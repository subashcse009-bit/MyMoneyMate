using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    //HDFC, SBI, Cash, Investment
    public class Account
    {
        [Key]
        public int AccountId { get; set; }

        public string AccountName { get; set; }

        // Examples: Checking, Savings, CreditCard
        public string AccountType { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal OpeningBalance { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal? CreditLimit { get; set; }

        public int DisplayOrder { get; set; }

        [Required]
        public int? StatusId { get; set; }

        public string? StatusValue { get; set; }

        public string CreatedBy { get; set; }

        public DateTime CreatedDate { get; set; }
        
        public string ModifiedBy { get; set; }
        
        public DateTime ModifiedDate { get; set; }
        
        public int UpdateSeq { get; set; }

    }
}
