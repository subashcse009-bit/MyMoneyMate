using Microsoft.EntityFrameworkCore;
using MyMoneyMate.Application.Repository.IRepository;
using MyMoneyMate.Domain;
using System;
using System.Collections.Generic;
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

        public async Task<Account> GetByNameAsync(string name)
        {
            return await _context.Accounts.FirstOrDefaultAsync(a => a.AccountName == name && a.StatusValue == "ACTV");
        }
    }
}
