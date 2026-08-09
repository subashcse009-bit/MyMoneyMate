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
        INSERT INTO TransactionStaging
        (
            ImportBatchDetailID,
            TransactionDate,
            AccountName,
            CategoryName,
            Description,
            PaymentMode,
            ExpenseAmount,
            IncomeAmount
        )
        VALUES
        (
            @ImportBatchDetailID,
            @TransactionDate,
            @AccountName,
            @CategoryName,
            @Description,
            @PaymentMode,
            @ExpenseAmount,
            @IncomeAmount
        )";

            using var connection = _factory.Create();
            await connection.OpenAsync();

            using var command = new SqlCommand(sql, connection);

            command.Parameters.AddWithValue("@ImportBatchDetailID", entity.ImportBatchDetailID);
            command.Parameters.AddWithValue("@TransactionDate", entity.TransactionDate );
            command.Parameters.AddWithValue("@AccountName", entity.AccountName ?? string.Empty);
            command.Parameters.AddWithValue("@CategoryName", entity.CategoryName ?? string.Empty);
            command.Parameters.AddWithValue("@Description", entity.Description ?? string.Empty);
            command.Parameters.AddWithValue("@PaymentMode", entity.PaymentMode ?? string.Empty);
            command.Parameters.AddWithValue("@ExpenseAmount", entity.ExpenseAmount );
            command.Parameters.AddWithValue("@IncomeAmount", entity.IncomeAmount);

            await command.ExecuteNonQueryAsync();
        }

        public async Task<IEnumerable<TransactionStaging>> GetByBatchIdAsync(Guid batchId)
        {
            throw new NotImplementedException();
        }
    }
}
