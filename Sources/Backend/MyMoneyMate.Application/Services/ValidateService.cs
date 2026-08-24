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
            try
            {
                var lstTransactionStaging = (await _transactionStageRepository.GetPendingAndInvalidTransactionStages(batchId)).ToList();

                foreach (var transaction in lstTransactionStaging)
                {
                    if (transaction != null)
                    {
                        if (!DateTime.TryParse(transaction.TransactionDate.ToString(), out DateTime parsedDate))
                        {
                            transaction.ValidationMessage = "INVD Transaction Date format.";
                            transaction.StatusValue = "INVD";
                        }
                        else if (transaction.TransactionDate == DateTime.MinValue)
                        {
                            transaction.ValidationMessage = "Transaction Date is required.";

                            transaction.StatusValue = "INVD";
                        }
                        else if (transaction.TransactionDate > DateTime.UtcNow)
                        {
                            transaction.ValidationMessage = "Transaction Date cannot be in the future.";
                            transaction.StatusValue = "INVD";
                        }
                        else if (string.IsNullOrEmpty(transaction.AccountName))
                        {
                            transaction.ValidationMessage = "Account Name is required.";
                            transaction.StatusValue = "INVD";
                        }
                        else if (!string.IsNullOrEmpty(transaction.AccountName))
                        {
                            var account = await _accountRepository.GetByNameAsync(transaction.AccountName);
                            if (account == null)
                            {
                                transaction.ValidationMessage = "Invalid Account Name.";
                                transaction.StatusValue = "INVD";
                            }
                        }
                        else if (string.IsNullOrEmpty(transaction.CategoryName))
                        {
                            transaction.ValidationMessage = "Category Name is required.";
                            transaction.StatusValue = "INVD";
                        }
                        else if (!string.IsNullOrEmpty(transaction.CategoryName))
                        {
                            var category = await _categoryRepository.GetByNameAsync(transaction.CategoryName);
                            if (category == null)
                            {
                                transaction.ValidationMessage = "Invalid Category Name.";
                                transaction.StatusValue = "INVD";
                            }
                        }
                        else if (transaction.ExpenseAmount == 0 && transaction.IncomeAmount == 0)
                        {
                            transaction.ValidationMessage = "Either Expense Amount or Income Amount must be positive.";
                            transaction.StatusValue = "INVD";
                        }
                        else if (transaction.ExpenseAmount > 0 && transaction.IncomeAmount > 0)
                        {
                            transaction.ValidationMessage = "Both Expense Amount and Income Amount cannot be positive.";
                            transaction.StatusValue = "INVD";
                        }
                        //else if (await _transactionStageRepository.DuplicateAsync(transaction))
                        //{
                        //    transaction.ValidationMessage = "Duplicate transaction found.";
                        //    transaction.StatusValue = "INVD";
                        //}
                        else
                        {
                            transaction.ValidationMessage = string.Empty;
                            transaction.StatusValue = "VALD";
                        }
                        transaction.ModifiedBy = "System";
                        transaction.ModifiedDate = DateTime.Now;
                        transaction.UpdateSeq += 1;

                        _transactionStageRepository.UpdateAsync(transaction);
                    }
                }

                await _importBatchRepository.UpdateBatchStatusAsync(batchId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
