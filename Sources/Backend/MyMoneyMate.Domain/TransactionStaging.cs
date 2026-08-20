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

        public int ImportBatchDetailId { get; set; }

        public int RowNumber { get; set; }

        public DateTime TransactionDate { get; set; }

        public string AccountName { get; set; } = string.Empty;

        public string CategoryName { get; set; } = string.Empty;

        public string Description { get; set; } = string.Empty;

        public string? PaymentMode { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal ExpenseAmount { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal IncomeAmount { get; set; }

        //Account Not Found, Category Not Found, Amount Invalid
        public string? ValidationMessage { get; set; }

        public int? StatusId { get; set; }
        
        ///Pending = 1, Valid, Invalid, Promoted
        public string? StatusValue { get; set; }

        public string CreatedBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public string ModifiedBy { get; set; }

        public DateTime ModifiedDate { get; set; }

        public int UpdateSeq { get; set; }
    }
}
