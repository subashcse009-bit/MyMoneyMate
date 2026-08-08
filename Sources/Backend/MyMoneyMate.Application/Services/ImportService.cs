using MyMoneyMate.Application.Interfaces;
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

        public ImportService(IEnumerable<IImporter> importers, ITransactionStageRepository repository)
        {
            _importers = importers;
            _repository = repository;
        }

        public async Task<Guid> ImportAsync(Stream stream, string fileName, string? contentType = null)
        {
            var batchId = Guid.NewGuid();

            var importer = _importers.FirstOrDefault(i => i.CanImport(fileName, contentType));
            if (importer == null) throw new InvalidOperationException("No importer available for the provided file type.");

            var rows = importer.ReadTransactions(stream);

            foreach (var row in rows)
            {
                var stage = new TransactionStaging
                {
                    TransactionDate = row.TransactionDate,
                    Description = row.Description,
                    IncomeAmount = row.IncomeAmount,
                    ExpenseAmount = row.ExpenseAmount,
                    CategoryName = row.Category,
                    AccountName = row.Account
                };

                await _repository.SaveAsync(stage);
            }

            return batchId;
        }
    }
}
