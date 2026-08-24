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

        public int AccountTypeId { get; set; }
        // Examples: Bank Account, CreditCard, Cash, Loan, Mutual Fund, Stock, Other
        public string AccountTypeValue { get; set; }

        public string? Institution { get; set; }

        public string? AccountNumber { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal OpeningBalance { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal? CurrentBalance { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal? CreditLimit { get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal? InterestRate { get; set; }
        
        public DateTime? StartDate { get; set; }
        
        public DateTime? MaturityDate { get; set; }

        public int AccountSideId { get; set; }

        // Examples: Asset, Liability, Equity
        public string AccountSideValue { get; set; }

        public int DisplayOrder { get; set; }

        public int? StatusId { get; set; }

        public string? StatusValue { get; set; }

        public string CreatedBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public string ModifiedBy { get; set; }

        public DateTime ModifiedDate { get; set; }

        public int UpdateSeq { get; set; }

    }
}
