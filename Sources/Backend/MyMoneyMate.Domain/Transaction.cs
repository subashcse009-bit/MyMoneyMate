using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyMoneyMate.Domain
{
    public class Transaction
    {
        [Key]
        public int TransactionId { get; set; }
        
        [Required]
        public DateTime TransactionDate { get; set; }
        
        [Required]
        public DateTime EffectiveDate { get; set; }
        
        [Required]
        public int AccountId { get; set;}
        
        [Required]
        public int CategoryId { get; set; }
        
        public string Description { get; set; }
        
        [Required]
        public int PaymentMode { get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal ExpenseAmount {  get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal IncomeAmount { get; set; }

    }
}
