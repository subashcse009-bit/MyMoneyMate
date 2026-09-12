using MyMoneyMate.Application.DTO;
using MyMoneyMate.Application.Repository.IRepository;
using MyMoneyMate.Domain;
using MyMoneyMate.Infrastructure.Response;
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

        public AccountService(IAccountRepository accountRepository, ICategoryRepository categoryRepository)
        {
            _accountRepository = accountRepository;
            _categoryRepository = categoryRepository;
        }

        public async Task<IEnumerable<Account>>  GetList()
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
            var dashboardData = new AccountDashboardDTO
            { };
            return dashboardData;
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
    }
}
