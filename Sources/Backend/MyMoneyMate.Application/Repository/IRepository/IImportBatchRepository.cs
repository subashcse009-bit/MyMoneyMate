using MyMoneyMate.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.Repository.IRepository
{
    public interface IImportBatchRepository
    {
        Task<int> SaveAsync(ImportBatch entity);

        Task UpdateBatchStatusAsync(int batchId);
    }
}
