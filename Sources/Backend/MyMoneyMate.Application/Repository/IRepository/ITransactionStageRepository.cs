using MyMoneyMate.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.Repository.IRepository
{
    public interface ITransactionStageRepository
    {
        Task SaveAsync(TransactionStaging entity);
        Task<IEnumerable<TransactionStaging>> GetByBatchIdAsync(int batchId);
        Task<IEnumerable<TransactionStaging>> GetPendingAndInvalidTransactionStages(int batchId);
        Task<IEnumerable<TransactionStaging>> GetByBatchIdAndStatusAsync(int batchId, string statusId);
        Task DeleteByBatchIdAsync(int batchId);
        Task UpdateAsync(TransactionStaging entity);
        Task DeleteAsync(TransactionStaging entity);
        Task<bool> DuplicateAsync(TransactionStaging entity);
    }
}
