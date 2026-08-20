using Microsoft.Data.SqlClient;
using MyMoneyMate.Application.Repository.IRepository;
using MyMoneyMate.Domain;
using MyMoneyMate.Infrastructure.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Infrastructure.Repositories
{
    public class TransactionStageRepository : ITransactionStageRepository
    {
        private readonly MyMoneyMateDBContext _context;

        public TransactionStageRepository(MyMoneyMateDBContext context)
        {
            _context = context;
        }

        public async Task SaveAsync(TransactionStaging entity)
        {
            _context.TransactionStaging.Add(entity);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<TransactionStaging>> GetByBatchIdAsync(Guid batchId)
        {
            throw new NotImplementedException();
        }
    }
}
