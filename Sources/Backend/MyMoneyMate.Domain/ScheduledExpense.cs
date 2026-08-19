using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    public class ScheduledExpense
    {
        [Key]
        public int ScheduledExpenseId { get; set; }
       
        public int ScheduledDay { get; set; }
        
        public int AccountId { get; set; }
        
        [ForeignKey(nameof(AccountId))]
        public Account Account { get; set; }
        
        public int CategoryId { get; set; }
        
        [ForeignKey(nameof(CategoryId))]
        public Category Category { get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal ExpenseAmount { get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal IncomeAmount { get; set; }
        
        [Column(TypeName = "date")]
        public DateOnly StartDate { get; set; }
        
        [Column(TypeName = "date")]
        public DateOnly? EndDate { get; set; }
        
        public string Description { get; set; }
        
        public string Notes { get; set; }
        
        public int? StatusId { get; set; }
        
        public string? StatusValue { get; set; }
        
        public string CreatedBy { get; set; }
        
        public DateTime CreatedDate { get; set; }
        
        public string ModifiedBy { get; set; }
        
        public DateTime ModifiedDate { get; set; }
        
        public int UpdateSeq { get; set; }
    }
}

