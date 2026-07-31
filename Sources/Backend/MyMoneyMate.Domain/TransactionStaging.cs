using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    public class TransactionStaging
    {
        [Key]
        public int TransactionStagingID { get; set; }
        [Required]
        public int ImportBatchDetailID { get; set; }
        [Required]
        public string TransactionDate { get; set; }
        [Required]
        public string AccountName { get; set; }
        [Required]
        public string CategoryName { get; set; }
        public string Description { get; set; }
        public string PaymentMode { get; set; }
        public string ExpenseAmount { get; set; }
        public string IncomeAmount { get; set; }
    }
}
