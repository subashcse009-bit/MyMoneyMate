using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MyMoneyMate.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class InitialMigration : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Accounts",
                columns: table => new
                {
                    AccountID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AccountName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    AccountType = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OpeningBalance = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    CreditLimit = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    DisplayOrder = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Accounts", x => x.AccountID);
                });

            migrationBuilder.CreateTable(
                name: "Categories",
                columns: table => new
                {
                    CategoryID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CategoryName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    NSWID = table.Column<int>(type: "int", nullable: false),
                    TransactionTypeID = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Budget = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    IncludeExpense = table.Column<bool>(type: "bit", nullable: false),
                    IncludeIncome = table.Column<bool>(type: "bit", nullable: false),
                    IncludeSavings = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Categories", x => x.CategoryID);
                });

            migrationBuilder.CreateTable(
                name: "ImportBatch",
                columns: table => new
                {
                    ImportBatchID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FileName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ImportDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    TotalRecords = table.Column<int>(type: "int", nullable: false),
                    TotalSuccessRecords = table.Column<int>(type: "int", nullable: false),
                    TotalFailedRecords = table.Column<int>(type: "int", nullable: false),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ImportBatch", x => x.ImportBatchID);
                });

            migrationBuilder.CreateTable(
                name: "ImportBatchDetails",
                columns: table => new
                {
                    ImportBatchDetailID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ImportBatchID = table.Column<int>(type: "int", nullable: false),
                    RecordNumber = table.Column<int>(type: "int", nullable: false),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ErrorMessage = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ImportBatchDetails", x => x.ImportBatchDetailID);
                });

            migrationBuilder.CreateTable(
                name: "Transactions",
                columns: table => new
                {
                    TransactionID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TransactionDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EffectiveDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    AccountID = table.Column<int>(type: "int", nullable: false),
                    CategoryID = table.Column<int>(type: "int", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PaymentMode = table.Column<int>(type: "int", nullable: false),
                    ExpenseAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    IncomeAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Transactions", x => x.TransactionID);
                });

            migrationBuilder.CreateTable(
                name: "TransactionStaging",
                columns: table => new
                {
                    TransactionStagingID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ImportBatchDetailID = table.Column<int>(type: "int", nullable: false),
                    TransactionDate = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    AccountName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CategoryName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PaymentMode = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ExpenseAmount = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IncomeAmount = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TransactionStaging", x => x.TransactionStagingID);
                });

            migrationBuilder.InsertData(
                table: "Accounts",
                columns: new[] { "AccountID", "AccountName", "AccountType", "CreditLimit", "DisplayOrder", "IsActive", "OpeningBalance" },
                values: new object[] { 1, "HDFC", "Bank", 0m, 1, true, 104847.59m });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Accounts");

            migrationBuilder.DropTable(
                name: "Categories");

            migrationBuilder.DropTable(
                name: "ImportBatch");

            migrationBuilder.DropTable(
                name: "ImportBatchDetails");

            migrationBuilder.DropTable(
                name: "Transactions");

            migrationBuilder.DropTable(
                name: "TransactionStaging");
        }
    }
}
