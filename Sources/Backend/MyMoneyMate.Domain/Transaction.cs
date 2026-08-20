using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Transactions;

namespace MyMoneyMate.Domain
{
    public class Transaction
    {
        [Key]
        public int TransactionId { get; set; }

        public DateTime TransactionDate { get; set; }

        public DateTime EffectiveDate { get; set; }

        public int AccountId { get; set; }

        public int CategoryId { get; set; }

        public int? TransactionTypeId { get; set; }
        //Income, Expense, Transfer
        public string? TransactionTypeValue { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal Amount { get; set; }
                
        public int? PaymentModeId { get; set; }

        //Cash, UPI, DebitCard, CreditCard, NetBanking, Cheque, AutoDebit
        public string? PaymentModeValue { get; set; }

        public string Description { get; set; } = string.Empty;

        public string? ReferenceNumber { get; set; }

        public string? Tags { get; set; }

        public int? StatusId { get; set; }

        public string? StatusValue { get; set; }

        public string CreatedBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public string ModifiedBy { get; set; }

        public DateTime ModifiedDate { get; set; }

        public int UpdateSeq { get; set; }
    }
}
