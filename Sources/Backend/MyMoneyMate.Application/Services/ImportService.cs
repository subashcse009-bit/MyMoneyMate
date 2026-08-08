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
        private readonly IImporter _excelImporter;

        private readonly ITransactionStageRepository _repository;

        public ImportService(IImporter excelImporter, ITransactionStageRepository repository)
        {
            _excelImporter = excelImporter;
            _repository = repository;
        }

        public async Task<Guid> ImportAsync(Stream stream)
        {
            var batchId = Guid.NewGuid();

            var rows =
                _excelImporter.ReadTransactions(stream);

            foreach (var row in rows)
            {
                var stage = new TransactionStaging
                {
                    TransactionDate =
                        row.TransactionDate,
                    Description =
                        row.Description,
                    IncomeAmount =
                        row.IncomeAmount,
                    ExpenseAmount =
                        row.ExpenseAmount,
                    CategoryName =
                        row.Category,
                    AccountName =
                        row.Account
                };

                await _repository.SaveAsync(stage);
            }

            return batchId;
        }
    }
}
