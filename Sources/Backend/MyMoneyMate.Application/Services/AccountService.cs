using MyMoneyMate.Domain.DTO;
using MyMoneyMate.Application.Repository.IRepository;
using MyMoneyMate.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.Services
{
    public class AccountService
    {
        private readonly IAccountRepository _accountRepository;
        private readonly ICategoryRepository _categoryRepository;
        private readonly ITransactionRepository _transactionRepository;

        public AccountService(IAccountRepository accountRepository, ICategoryRepository categoryRepository, ITransactionRepository transactionRepository)
        {
            _accountRepository = accountRepository;
            _categoryRepository = categoryRepository;
            _transactionRepository = transactionRepository;
        }

        public async Task<IEnumerable<Account>> GetList()
        {
            var accounts = await _accountRepository.GetAllAsync();
            return accounts;
        }

        public async Task<AccountDetailsDTO> GetAccountById(int id)
        {
            var account = await _accountRepository.GetById(id);

            AccountDetailsDTO accountDetailsDTO = new AccountDetailsDTO()
            {
                AccountId = account.AccountId,
                AccountName = account.AccountName,
                AccountTypeValue = account.AccountTypeValue,
                CurrentBalance = account.CurrentBalance ?? 0,
                OpeningBalance = account.OpeningBalance,
                CreditLimit = account.CreditLimit,
                InterestRate = account.InterestRate,
                StartDate = account.StartDate,
                MaturityDate = account.MaturityDate,
                AccountSideValue = account.AccountSideValue,
                DisplayOrder = account.DisplayOrder,
                StatusValue = account.StatusValue
            };

            return accountDetailsDTO;
        }

        public async Task<AccountDashboardDTO> GetAccountDashboard()
        {
            var accounts = await _accountRepository.GetAllAsync();
            var summary = await GetAccountSummary(accounts);

            AccountDashboardDTO accountDashboardDTO = new AccountDashboardDTO()
            {
                Summary = summary,
                AccountDetails = accounts.Select(a => new AccountDetailsDTO
                {
                    AccountId = a.AccountId,
                    AccountName = a.AccountName,
                    AccountTypeValue = a.AccountTypeValue,
                    CurrentBalance = a.CurrentBalance ?? 0,
                    OpeningBalance = a.OpeningBalance,
                    CreditLimit = a.CreditLimit,
                    InterestRate = a.InterestRate,
                    StartDate = a.StartDate,
                    MaturityDate = a.MaturityDate,
                    AccountSideValue = a.AccountSideValue,
                    DisplayOrder = a.DisplayOrder,
                    StatusValue = a.StatusValue,
                    LastTransactionDate = DateTime.Now // Placeholder for last transaction date, you may want to fetch this from transactions
                }).ToList(),
            };

            return accountDashboardDTO;
        }

        public async Task<Account> AddAccount(AddAccountDTO accountDto)
        {
            var account = new Account
            {
                AccountName = accountDto.AccountName,
                AccountNumber = accountDto.AccountNumber,
                OpeningBalance = accountDto.OpeningBalance,
                CurrentBalance = accountDto.CurrentBalance,
                CreditLimit = accountDto.CreditLimit,
                InterestRate = accountDto.InterestRate,
                StartDate = accountDto.StartDate
            };

            await _accountRepository.AddAsync(account);
            return account;
        }


        private async Task<AccountSummaryDTO> GetAccountSummary(IEnumerable<Account> accounts)
        {
            var totalAccounts = accounts.Count();
            var totalAssets = accounts.Where(a => a.AccountSideValue == "ASST").Sum(a => a.CurrentBalance ?? 0);
            var totalLiabilities = accounts.Where(a => a.AccountSideValue == "LIAB").Sum(a => a.CurrentBalance ?? 0);
            return new AccountSummaryDTO
            {
                TotalActiveAccounts = totalAccounts,
                TotalAssets = totalAssets,
                TotalLiabilities = totalLiabilities,
                NetWorth = totalAssets - totalLiabilities
            };
        }
    }
}
