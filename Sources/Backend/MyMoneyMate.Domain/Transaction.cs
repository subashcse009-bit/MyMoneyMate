using System.ComponentModel.DataAnnotations;

namespace MyMoneyMate.Domain
{
    public class Transaction
    {
        [Key]
        public int TransactionID { get; set; }
        [Required]
        public DateTime TransactionDate { get; set; }
        [Required]
        public DateTime EffectiveDate { get; set; }
        [Required]
        public int AccountID { get; set;}
        [Required]
        public int CategoryID { get; set; }
        public string Description { get; set; }
        [Required]
        public int PaymentMode { get; set; }
        public decimal ExpenseAmount {  get; set; }
        public decimal IncomeAmount { get; set; }

    }
}
