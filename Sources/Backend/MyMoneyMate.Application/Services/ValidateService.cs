using MyMoneyMate.Application.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.Services
{
    public class ValidateService
    {
        private readonly ITransactionStageRepository _transactionStageRepository;
        private readonly IImportBatchRepository _importBatchRepository;

        private readonly IAccountRepository _accountRepository;
        private readonly ICategoryRepository _categoryRepository;
        public ValidateService(ITransactionStageRepository transactionStageRepository,
            IImportBatchRepository importBatchRepository, IAccountRepository accountRepository, ICategoryRepository categoryRepository)
        {
            _transactionStageRepository = transactionStageRepository;
            _importBatchRepository = importBatchRepository;
            _accountRepository = accountRepository;
            _categoryRepository = categoryRepository;
        }

        public async Task ValidateTransactionStages(int batchId)
        {
            var stages = (await _transactionStageRepository.GetPendingAndInvalidTransactionStages(batchId)).Where(t => t != null).ToList();

            var accountCache = new Dictionary<string, object?>(StringComparer.OrdinalIgnoreCase);
            var categoryCache = new Dictionary<string, object?>(StringComparer.OrdinalIgnoreCase);

            foreach (var t in stages)
            {
                string status = "VALD";
                string message = string.Empty;

                // Robust TransactionDate handling (supports DateTime or string-backed)
                DateTime? parsedDate = null;
                if (t.TransactionDate is DateTime dt) parsedDate = dt;
                else if (DateTime.TryParse(t.TransactionDate.ToString(), out var tmp)) parsedDate = tmp;

                if (!parsedDate.HasValue)
                {
                    message = "Invalid Transaction Date format.";
                    status = "INVD";
                }
                else if (parsedDate.Value == DateTime.MinValue)
                {
                    message = "Transaction Date is required.";
                    status = "INVD";
                }
                else if (parsedDate.Value > DateTime.UtcNow)
                {
                    message = "Transaction Date cannot be in the future.";
                    status = "INVD";
                }

                // Account validation with caching
                if (status == "VALD")
                {
                    if (string.IsNullOrWhiteSpace(t.AccountName))
                    {
                        message = "Account Name is required.";
                        status = "INVD";
                    }
                    else
                    {
                        if (!accountCache.TryGetValue(t.AccountName, out var account))
                        {
                            account = await _accountRepository.GetByNameAsync(t.AccountName);
                            accountCache[t.AccountName] = account;
                        }

                        if (account == null)
                        {
                            message = "Invalid Account Name.";
                            status = "INVD";
                        }
                    }
                }

                // Category validation with caching
                if (status == "VALD")
                {
                    if (string.IsNullOrWhiteSpace(t.CategoryName))
                    {
                        message = "Category Name is required.";
                        status = "INVD";
                    }
                    else
                    {
                        if (!categoryCache.TryGetValue(t.CategoryName, out var category))
                        {
                            category = await _categoryRepository.GetByNameAsync(t.CategoryName);
                            categoryCache[t.CategoryName] = category;
                        }

                        if (category == null)
                        {
                            message = "Invalid Category Name.";
                            status = "INVD";
                        }
                    }
                }
                
                // Amount validation
                if (status == "VALD")
                {
                    if (t.ExpenseAmount == 0 && t.IncomeAmount == 0)
                    {
                        message = "Either Expense Amount or Income Amount must be positive.";
                        status = "INVD";
                    }
                    else if (t.ExpenseAmount > 0 && t.IncomeAmount > 0)
                    {
                        message = "Both Expense Amount and Income Amount cannot be positive.";
                        status = "INVD";
                    }
                }

                // Persist changes (await to avoid overlapping DbContext operations)
                t.ValidationMessage = message;
                t.StatusValue = status;
                t.ModifiedBy = "System";
                t.ModifiedDate = DateTime.UtcNow;
                t.UpdateSeq += 1;

                await _transactionStageRepository.UpdateAsync(t);
            }

            await _importBatchRepository.UpdateBatchStatusAsync(batchId);
        }
    }
}
