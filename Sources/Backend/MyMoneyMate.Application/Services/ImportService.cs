using MyMoneyMate.Application.Repository.IRepository;
using MyMoneyMate.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.Services
{
    public class ImportService
    {
        private readonly IEnumerable<IImporter> _importers;
        private readonly ITransactionStageRepository _repository;
        private readonly IImportBatchRepository _importBatchRepository;

        public ImportService(IEnumerable<IImporter> importers, ITransactionStageRepository repository, IImportBatchRepository importBatchRepository)
        {
            _importers = importers;
            _repository = repository;
            _importBatchRepository = importBatchRepository;
        }

        public async Task<Guid> ImportAsync(Stream stream, string fileName, string? contentType = null)
        {
            var batchId = Guid.NewGuid();

            var importBatch = new ImportBatch
            {
                FileName = fileName,
                StatusId = 1,
                StatusValue = "Pending",
                CreatedBy = "System",
                CreatedDate = DateTime.Now,
                ModifiedBy = "System",
                ModifiedDate = DateTime.Now,
                UpdateSeq = 1
            };

            var importBatchId = _importBatchRepository.SaveAsync(importBatch);

            var importer = _importers.FirstOrDefault(i => i.CanImport(fileName, contentType));
            if (importer == null) throw new InvalidOperationException("No importer available for the provided file type.");

            var rows = importer.ReadTransactions(stream);

            foreach (var row in rows)
            {
                var stage = new TransactionStaging
                {
                    ImportBatchDetailId = importBatchId,
                    TransactionDate = row.TransactionDate,
                    Description = row.Description,
                    IncomeAmount = row.IncomeAmount,
                    ExpenseAmount = row.ExpenseAmount,
                    CategoryName = row.Category,
                    AccountName = row.Account,
                    CreatedBy = "System",
                    CreatedDate = DateTime.Now,
                    ModifiedBy = "System",
                    ModifiedDate = DateTime.Now,
                    UpdateSeq = 1
                };

                await _repository.SaveAsync(stage);
            }

            return batchId;
        }
    }
}
