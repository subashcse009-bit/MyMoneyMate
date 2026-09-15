using Microsoft.EntityFrameworkCore;
using MyMoneyMate.Application.Repository.IRepository;
using MyMoneyMate.Domain.DTO;
using MyMoneyMate.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Infrastructure.Repositories
{
    public class AccountRepository : IAccountRepository
    {
        private readonly MyMoneyMateDBContext _context;
        public AccountRepository(MyMoneyMateDBContext context)
        {
            _context = context;
        }

        public Task AddAsync(Account account)
        {
            _context.Accounts.Add(account);
            return _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Account>> GetAllAsync()
        {
            return await _context.Accounts.Where(a => a.StatusValue == "ACTV").ToListAsync();
        }

        public async Task<Account> GetById(int id)
        {
            return await _context.Accounts.FirstOrDefaultAsync(a => a.AccountId == id && a.StatusValue == "ACTV");
        }

        public async Task<Account> GetByNameAsync(string name)
        {
            return await _context.Accounts.FirstOrDefaultAsync(a => a.AccountName == name && a.StatusValue == "ACTV");
        }

        public async Task UpdateAccountCurrentBalanceAsync(Account account)
        {
            _context.Accounts.Update(account);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<AssertsAllocationDTO>> GetAssertsAllocations()
        {
            var result = new List<AssertsAllocationDTO>();

            var connection = _context.Database.GetDbConnection();

            await using var command = connection.CreateCommand();

            command.CommandText = "dbo.usp_GetAssertAllocations";
            command.CommandType = CommandType.StoredProcedure;

            if (connection.State != ConnectionState.Open)
            {
                await connection.OpenAsync();
            }

            await using var reader = await command.ExecuteReaderAsync();

            if (await reader.ReadAsync())
            {
                while (await reader.ReadAsync())
                {
                    result.Add(
                        new AssertsAllocationDTO
                        {
                            AccountType = reader.GetString(
                                reader.GetOrdinal("AccountTypeValue")),

                            TotalBalance = reader.GetDecimal(
                                reader.GetOrdinal("TotalBalance")),

                            Percentage = reader.GetDecimal(
                                reader.GetOrdinal("BalancePercentage"))
                        });
                }
            }

            return result;
        }
    }
}
