using Microsoft.EntityFrameworkCore;
using MyMoneyMate.Domain;

namespace MyMoneyMate.Infrastructure
{
    public class MyMoneyMateDBContext: DbContext
    {
        public MyMoneyMateDBContext(DbContextOptions<MyMoneyMateDBContext> options) : base(options)
        {

        }

        public DbSet<Account> Accounts { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<ImportBatch> ImportBatch { get; set; }
        public DbSet<ImportBatchDetail> ImportBatchDetails { get; set; }
        public DbSet<TransactionStaging> TransactionStaging { get; set; }
        public DbSet<Transaction> Transactions { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Account>().HasData(
                new Account { AccountID = 1, AccountName = "HDFC", AccountType = "Bank", DisplayOrder = 1, IsActive = true, OpeningBalance = 104847.59M }
            );
        }
    }
}
