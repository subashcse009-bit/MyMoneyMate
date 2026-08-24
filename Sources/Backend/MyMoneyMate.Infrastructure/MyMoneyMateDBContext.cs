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
                    AccountTypeValue = "Savings Account",
                    OpeningBalance = 104847.59M,
                    CreditLimit = 0,
                    DisplayOrder = 1,
                    StatusId = 1,
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
