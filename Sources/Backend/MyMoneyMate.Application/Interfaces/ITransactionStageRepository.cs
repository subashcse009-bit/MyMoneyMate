using MyMoneyMate.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.Interfaces
{
    public interface ITransactionStageRepository
    {
        Task SaveAsync(TransactionStaging entity);
        Task<IEnumerable<TransactionStaging>> GetByBatchIdAsync(Guid batchId);
    }
}
