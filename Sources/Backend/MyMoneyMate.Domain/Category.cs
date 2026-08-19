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
        public int CategoryId { get; set; }
       
        public string CategoryName { get; set; }
        
        //Need Savings, Want
        public int? CategoryNatureId { get; set; }
        
        public string? CategoryNatureValue { get; set; }
        
        //Operating Expense,Investment
        public int? CategoryGroupId { get; set; }
        
        public string? CategoryGroupValue { get; set; }
        
        public bool IncludeExpense { get; set; }
        
        public bool IncludeIncome { get; set; }
        
        public bool IncludeSavings { get; set; }
        
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
