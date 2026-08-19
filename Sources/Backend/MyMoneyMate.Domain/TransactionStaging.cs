using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    public class TransactionStaging
    {
        [Key]
        public int TransactionStagingId { get; set; }
        
        [Required]
        public int ImportBatchDetailId { get; set; }
        
        [Required]
        public DateTime TransactionDate { get; set; }
        
        [Required]
        public string AccountName { get; set; }
        
        [Required]
        public string CategoryName { get; set; }
        
        public string Description { get; set; }
        
        public string PaymentMode { get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal ExpenseAmount { get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal IncomeAmount { get; set; }
    }
}
