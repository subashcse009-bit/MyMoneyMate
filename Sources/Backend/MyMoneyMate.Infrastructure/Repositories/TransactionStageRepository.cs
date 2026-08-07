using Microsoft.Data.SqlClient;
using MyMoneyMate.Application.Interfaces;
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
        private readonly DbConnectionFactory _factory;

        public TransactionStageRepository(DbConnectionFactory factory)
        {
            _factory = factory;
        }

        public async Task SaveAsync(TransactionStaging entity)
        {
            const string sql = @"
                INSERT INTO TransactionStage
                (
                 StageId,
                 BatchId,
                 TransactionDate,
                 Description,
                 Amount,
                 Category,
                 Account,
                 Status
                )
                VALUES
                (
                 @StageId,
                 @BatchId,
                 @TransactionDate,
                 @Description,
                 @Amount,
                 @Category,
                 @Account,
                 @Status
                )";

            using var connection = _factory.Create();

            await connection.OpenAsync();

            using var command = new SqlCommand(sql, connection);

            command.Parameters.AddWithValue("@TransactionDate", entity.TransactionDate);
            command.Parameters.AddWithValue("@Description", entity.Description);
            command.Parameters.AddWithValue("@IncomeAmount", entity.IncomeAmount);
            command.Parameters.AddWithValue("@ExpenseAmount", entity.ExpenseAmount);
            command.Parameters.AddWithValue("@Category", entity.CategoryName);
            command.Parameters.AddWithValue("@Account", entity.AccountName);
            await command.ExecuteNonQueryAsync();
        }

        public async Task<IEnumerable<TransactionStaging>> GetByBatchIdAsync(Guid batchId)
        {
            throw new NotImplementedException();
        }
    }
}
