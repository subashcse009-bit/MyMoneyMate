using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
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

        public async Task<IEnumerable<TransactionStaging>> GetByBatchIdAsync(int batchId)
        {
            return await _context.TransactionStaging.Where(ts => ts.SourceRefId == batchId).ToListAsync();
        }

        public async Task<IEnumerable<TransactionStaging>> GetPendingAndInvalidTransactionStages(int batchId)
        {
            return await _context.TransactionStaging
                .Where(ts => (ts.SourceRefId == batchId) && (ts.StatusValue == "PEND" || ts.StatusValue == "INVD"))
                .ToListAsync();
        }

        public async Task UpdateAsync(TransactionStaging entity)
        {
            _context.TransactionStaging.Update(entity);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(TransactionStaging entity)
        {
            _context.TransactionStaging.Remove(entity);
            _context.SaveChangesAsync();
        }

        public Task<bool> DuplicateAsync(TransactionStaging entity)
        {

            return _context.TransactionStaging.AnyAsync(ts =>
                ts.TransactionDate == entity.TransactionDate &&
                ts.AccountName == entity.AccountName &&
                ts.CategoryName == entity.CategoryName &&
                ts.ExpenseAmount == entity.ExpenseAmount &&
                ts.IncomeAmount == entity.IncomeAmount
            );
        }

        public async Task DeleteByBatchIdAsync(int batchId)
        {
            _context.TransactionStaging.RemoveRange(_context.TransactionStaging.Where(ts => ts.SourceRefId == batchId));
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<TransactionStaging>> GetByBatchIdAndStatusAsync(int batchId, string statusId)
        {
            return await _context.TransactionStaging
                .Where(ts => (ts.SourceRefId == batchId) && (ts.StatusValue == statusId)).
                OrderBy(ts => ts.TransactionDate).ToListAsync();
        }
    }
}
