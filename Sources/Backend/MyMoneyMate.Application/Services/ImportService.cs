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
        private readonly ITransactionStageRepository _repository;
        private readonly IImportBatchRepository _importBatchRepository;
        private readonly ITransactionRepository _transactionRepository;
        private readonly IAccountRepository _accountRepository;
        private readonly ICategoryRepository _categoryRepository;

        public ImportService(IEnumerable<IImporter> importers, ITransactionStageRepository repository,
            IImportBatchRepository importBatchRepository, ITransactionRepository transactionRepository,
            IAccountRepository accountRepository, ICategoryRepository categoryRepository)
        {
            _importers = importers;
            _repository = repository;
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
                StatusId = 1000,
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
                    SourceTypeId = 1002,
                    SourceTypeValue = "IMBT",
                    SourceRefId = importBatchId,
                    StatusId = 1001,
                    StatusValue = "PEND",
                    CreatedBy = "System",
                    CreatedDate = DateTime.Now,
                    ModifiedBy = "System",
                    ModifiedDate = DateTime.Now,
                    UpdateSeq = 1
                };

                await _repository.SaveAsync(stage);
            }

            return batchId;
        }

        public async Task PromoteTransactionsAsync(int batchId)
        {
            var stagingTransactions = await _repository.GetByBatchIdAndStatusAsync(batchId, "VALD");
            foreach (var stage in stagingTransactions)
            {
                if (stage.StatusValue == "PRMD")
                {
                    continue;
                }
                var account = await _accountRepository.GetByNameAsync(stage.AccountName);
                var category = await _categoryRepository.GetByNameAsync(stage.CategoryName);

                var transaction = CreateTransaction(stage, account.AccountId, category.CategoryId);

                await _transactionRepository.SaveAsync(transaction);

                // After promoting, you might want to update the status of the staging record
                stage.StatusId = 1001; // Assuming 1001 is the status for promoted
                stage.StatusValue = "PRMD";
                await _repository.UpdateAsync(stage);
            }
        }

        private Transaction CreateTransaction(TransactionStaging staging, int accountId, int categoryId)
        {
            return new Transaction
            {
                TransactionDate = staging.TransactionDate,
                EffectiveDate = staging.TransactionDate,
                AccountId = accountId,
                CategoryId = categoryId,
                Amount = staging.ExpenseAmount > 0 ? staging.ExpenseAmount : staging.IncomeAmount,
                TransactionTypeValue = staging.ExpenseAmount > 0 ? "INCO" : "EXPE",
                Description = staging.Description,
                StatusId = 1004,
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
