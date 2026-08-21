using MyMoneyMate.Application.Repository.IRepository;
using MyMoneyMate.Domain;
using MyMoneyMate.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.Repository
{
    public class ImportBatchRepository : IImportBatchRepository
    {
        private readonly MyMoneyMateDBContext _context;
        private readonly ITransactionStageRepository _transactionStageRepository;

        public ImportBatchRepository(MyMoneyMateDBContext context, ITransactionStageRepository transactionStageRepository)
        {
            _context = context;
            _transactionStageRepository = transactionStageRepository;
        }

        public async Task<int> SaveAsync(ImportBatch entity)
        {
            _context.ImportBatch.Add(entity);
            await _context.SaveChangesAsync();
            return entity.ImportBatchId;
        }

        public async Task UpdateBatchStatusAsync(int batchId)
        {
            var batch = await _context.ImportBatch.FindAsync(batchId);

            var transactionStages = (await _transactionStageRepository.GetByBatchIdAsync(batchId)).ToList();

            batch.TotalRecords = transactionStages.Count;

            batch.TotalFailedRecords = transactionStages.Count(ts => ts.StatusValue == "INVD");

            batch.TotalSuccessRecords = transactionStages.Count(ts => ts.StatusValue == "VALD");

            if(batch.TotalFailedRecords == 0)
            {
                batch.StatusValue = "COMP";
            }
            else if (batch.TotalSuccessRecords > 0)
{
                batch.StatusValue = "COME";
            }
            else
            {
                batch.StatusValue = "FAIL";
            }

            await _context.SaveChangesAsync();
        }
    }
}
