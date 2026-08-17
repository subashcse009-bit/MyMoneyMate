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
        [Required]
        //Need Savings, Want
        public int NSWID { get; set; }
        [Required]
        //Operating Expense,Investment
        public string TransactionTypeID { get; set; }
        [Required]
        public decimal Budget { get; set; }
        [Required]
        public bool IncludeExpense { get; set; }
        [Required]
        public bool IncludeIncome { get; set; }
        [Required]
        public bool IncludeSavings { get; set; }

    }
}
