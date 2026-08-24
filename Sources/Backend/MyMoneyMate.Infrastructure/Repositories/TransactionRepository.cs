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

        public async Task SaveAsync(Transaction entity)
        {
            _context.Transactions.Add(entity);
            await _context.SaveChangesAsync();
        }
    }
}
