using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    //HDFC, SBI, Cash, Investment
    public class Account
    {
        [Key]
        public int AccountID { get; set; }
        [Required]
        public string AccountName { get; set; }
        [Required]
        public string AccountType { get; set; }
        [Required]
        public decimal OpeningBalance {  get; set; }
        public decimal CreditLimit { get; set; }
        [Required]
        public bool IsActive { get; set; }
        public int DisplayOrder {  get; set; }

    }
}
