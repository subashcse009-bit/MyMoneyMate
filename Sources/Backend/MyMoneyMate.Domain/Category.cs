using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    //Rent, EMI,Loan
    public class Category
    {
        [Key]
        public int CategoryID { get; set; }
        [Required]
        public string CategoryName { get; set; }
        //Need Savings, Want
        public int CategoryNatureID { get; set; }
        public string CategoryNatureValue { get; set; }
        //Operating Expense,Investment
        public int CategoryGroupID { get; set; }
        public string CategoryGroupValue { get; set; }
        [Required]
        public bool IncludeExpense { get; set; }
        [Required]
        public bool IncludeIncome { get; set; }
        [Required]
        public bool IncludeSavings { get; set; }
        public int DisplayOrder { get; set; }
        public int StatusID { get; set; }
        public string StatusCode { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int UpdateSeq { get; set; }

    }
}
