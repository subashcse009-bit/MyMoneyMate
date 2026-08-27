using MyMoneyMate.Application.Repository.IRepository;
using MyMoneyMate.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace MyMoneyMate.Application.Services
{
    public class ImportService
    {
        private readonly IEnumerable<IImporter> _importers;
        private readonly ITransactionStageRepository _transactionStageRepository;
        private readonly IImportBatchRepository _importBatchRepository;
        private readonly ITransactionRepository _transactionRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly ICategoryRepository _categoryRepository;

        public ImportService(IEnumerable<IImporter> importers, ITransactionStageRepository transactionStageRepository,
            IImportBatchRepository importBatchRepository, ITransactionRepository transactionRepository,
            IAccountRepository accountRepository, ICategoryRepository categoryRepository)
        {
            _importers = importers;
            _transactionStageRepository = transactionStageRepository;
            _importBatchRepository = importBatchRepository;
            _transactionRepository = transactionRepository;
            _accountRepository = accountRepository;
            _categoryRepository = categoryRepository;
        }

        public async Task<Guid> ImportAsync(Stream stream, string fileName, string? contentType = null)
        {
            var batchId = Guid.NewGuid();

            var importBatch = new ImportBatch
            {
                FileName = fileName,
                StatusId = 3001,
                StatusValue = "PEND",
                CreatedBy = "System",
                CreatedDate = DateTime.Now,
                ModifiedBy = "System",
                ModifiedDate = DateTime.Now,
                UpdateSeq = 1
            };

            var importBatchId = await _importBatchRepository.SaveAsync(importBatch);

            var importer = _importers.FirstOrDefault(i => i.CanImport(fileName, contentType));
            if (importer == null) throw new InvalidOperationException("No importer available for the provided file type.");

            var rows = importer.ReadTransactions(stream);

            foreach (var row in rows)
            {
                var stage = new TransactionStaging
                {
                    TransactionDate = row.TransactionDate,
                    Description = row.Description,
                    IncomeAmount = row.IncomeAmount,
                    ExpenseAmount = row.ExpenseAmount,
                    CategoryName = row.Category,
                    AccountName = row.Account,
                    SourceTypeId = 3003,
                    SourceTypeValue = "IMBT",
                    SourceRefId = importBatchId,
                    StatusId = 3002,
                    StatusValue = "PEND",
                    CreatedBy = "System",
                    CreatedDate = DateTime.Now,
                    ModifiedBy = "System",
                    ModifiedDate = DateTime.Now,
                    UpdateSeq = 1
                };

                await _transactionStageRepository.SaveAsync(stage);
            }

            return batchId;
        }

        public async Task PromoteTransactionsAsync(int batchId)
        {
            var stagingTransactions = (await _transactionStageRepository.GetByBatchIdAndStatusAsync(batchId, "VALD"))?.ToList() ?? new List<TransactionStaging>();

            if (!stagingTransactions.Any()) return;

            // Filter out already promoted and collect unique names
            var toProcess = stagingTransactions.Where(s => s.StatusValue != "PRMD").ToList();

            if (!toProcess.Any()) return;

            var accountNames = toProcess.Select(s => s.AccountName).Where(n => !string.IsNullOrWhiteSpace(n)).Distinct().ToList();
            var categoryNames = toProcess.Select(s => s.CategoryName).Where(n => !string.IsNullOrWhiteSpace(n)).Distinct().ToList();

            var accountsByName = new Dictionary<string, Account>(StringComparer.OrdinalIgnoreCase);
            foreach (var name in accountNames)
            {
                try
                {
                    var acct = await _accountRepository.GetByNameAsync(name);
                    if (acct != null) accountsByName[name] = acct;
                }
                catch
                {
                    // optionally log lookup failure; treat as missing later
                }
            }

            // Fetch categories sequentially to avoid concurrent DbContext usage
            var categoriesByName = new Dictionary<string, Category>(StringComparer.OrdinalIgnoreCase);
            foreach (var name in categoryNames)
            {
                try
                {
                    var cat = await _categoryRepository.GetByNameAsync(name);
                    if (cat != null) categoriesByName[name] = cat;
                }
                catch
                {
                    // optionally log lookup failure; treat as missing later
                }
            }

            foreach (var stage in toProcess)
            {
                try
                {
                    accountsByName.TryGetValue(stage.AccountName, out var account);
                    categoriesByName.TryGetValue(stage.CategoryName, out var category);

                    if (account == null || category == null)
                    {
                        // Mark as error and continue
                        stage.StatusValue = "INVD";
                        stage.StatusId = 3002; // keep an error code or adapt to your domain constants
                        stage.ValidationMessage = "Invalid transaction data";
                        stage.ModifiedDate = DateTime.Now;
                        stage.ModifiedBy = "System";
                        await _transactionStageRepository.UpdateAsync(stage);
                        continue;
                    }

                    // Use opening balance as current balance when current is zero
                    if (account.CurrentBalance == 0)
                    {
                        account.CurrentBalance = account.OpeningBalance;
                    }

                    var transaction = CreateTransaction(stage, account.AccountId, category.CategoryId);

                    await _transactionRepository.SaveAsync(transaction);

                    // Update account balance using the prefetched account instance
                    if (string.Equals(transaction.TransactionTypeValue, "EXPE", StringComparison.OrdinalIgnoreCase))
                    {
                        account.CurrentBalance -= transaction.Amount;
                    }
                    else
                    {
                        account.CurrentBalance += transaction.Amount;
                    }

                    await _accountRepository.UpdateAccountCurrentBalanceAsync(account);

                    // After successful promotion, update staging status
                    stage.StatusId = 3002; // keep existing numeric mapping if required by domain
                    stage.StatusValue = "PRMD";
                    stage.ModifiedDate = DateTime.Now;
                    stage.ModifiedBy = "System";
                    await _transactionStageRepository.UpdateAsync(stage);
                }
                catch
                {
                    // If a stage fails, mark it as error and continue with others
                    stage.StatusValue = "INVD";
                    stage.StatusId = 3002;
                    stage.ValidationMessage = "Invalid transaction data";
                    stage.ModifiedDate = DateTime.Now;
                    stage.ModifiedBy = "System";
                    try { await _transactionStageRepository.UpdateAsync(stage); } catch { /* swallow to avoid cascading failures */ }
                }
            }
        }

        private Transaction CreateTransaction(TransactionStaging staging, int accountId, int categoryId)
        {
            var isExpense = staging.ExpenseAmount > 0;
            return new Transaction
            {
                TransactionDate = staging.TransactionDate,
                EffectiveDate = staging.TransactionDate,
                AccountId = accountId,
                CategoryId = categoryId,
                Amount = isExpense ? staging.ExpenseAmount : staging.IncomeAmount,
                TransactionTypeValue = isExpense ? "EXPE" : "INCO",
                Description = staging.Description,
                StatusId = 4002,
                StatusValue = "ACTV",
                CreatedBy = staging.CreatedBy,
                CreatedDate = DateTime.Now,
                ModifiedBy = staging.ModifiedBy,
                ModifiedDate = DateTime.Now,
                UpdateSeq = 0
            };
        }
    }
}
