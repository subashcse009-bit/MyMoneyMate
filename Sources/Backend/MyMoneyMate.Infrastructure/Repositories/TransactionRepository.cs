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
    public class TransactionRepository : ITransactionRepository
    {
        private readonly MyMoneyMateDBContext _context;
        public TransactionRepository(MyMoneyMateDBContext context)
        {
            _context = context;
        }

        public async Task<DateTime?> GetLastTransactionDateByAccountIdAsync(int accountId)
        {
            return await _context.Transactions
                .Where(t => t.AccountId == accountId && t.StatusValue == "ACTV")
                .OrderByDescending(t => t.EffectiveDate)
                .Select(t => (DateTime?)t.EffectiveDate)
                .FirstOrDefaultAsync();
        }

        public async Task SaveAsync(Transaction entity)
        {
            _context.Transactions.Add(entity);
            await _context.SaveChangesAsync();
        }


    }
}
