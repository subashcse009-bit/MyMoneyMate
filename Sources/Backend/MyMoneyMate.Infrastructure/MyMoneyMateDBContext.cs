using Microsoft.EntityFrameworkCore;
using MyMoneyMate.Domain;

namespace MyMoneyMate.Infrastructure
{
    public class MyMoneyMateDBContext : DbContext
    {
        public MyMoneyMateDBContext(DbContextOptions<MyMoneyMateDBContext> options) : base(options)
        {

        }

        public DbSet<Account> Accounts { get; set; }
        public DbSet<AccountBudget> AccountBudgets { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<CategoryBudget> CategoryBudgets { get; set; }
        public DbSet<Codes> Codes { get; set; }
        public DbSet<CodeValues> CodeValues { get; set; }
        public DbSet<Goal> Goals { get; set; }
        public DbSet<ImportBatch> ImportBatch { get; set; }
        public DbSet<InvestmentDetail> InvestmentDetails { get; set; }
        public DbSet<InvestmentDetailHistory> InvestmentDetailHistories { get; set; }
        public DbSet<InvestmentType> InvestmentTypes { get; set; }
        public DbSet<MonthlyPlan> MonthlyPlans { get; set; }
        public DbSet<ScheduledExpense> ScheduledExpenses { get; set; }
        public DbSet<Transaction> Transactions { get; set; }
        public DbSet<TransactionStaging> TransactionStaging { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Account>().HasData(
                new Account
                {
                    AccountId = 1,
                    AccountName = "HDFC",
                    AccountTypeId = 1002,
                    AccountTypeValue = "BAAC",
                    Institution = "HDFC Bank",
                    AccountNumber = "123456",
                    OpeningBalance = 104847.59M,
                    CurrentBalance = 0,
                    CreditLimit = 0,
                    InterestRate = 0,
                    StartDate = new DateTime(2026, 3, 1),
                    MaturityDate = null,
                    AccountSideId = 1002,
                    AccountSideValue = "ASST",
                    DisplayOrder = 1,
                    StatusId = 1001,
                    StatusValue = "ACTV",
                    CreatedBy = "System",
                    CreatedDate = new DateTime(2026, 3, 1),
                    ModifiedBy = "System",
                    ModifiedDate = new DateTime(2026, 3, 1),
                    UpdateSeq = 1
                }
            );
        }
    }
}
