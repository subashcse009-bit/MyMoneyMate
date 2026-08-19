using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    public class CategoryBudget
    {
        [Key]
        public int CategoryBudgetId { get; set; }
        
        public int CategoryId { get; set; }
        
        [ForeignKey(nameof(CategoryId))]
        public Category Category { get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        public decimal BudgetAmount { get; set; }
        
        public string Description { get; set; }
        
        public string Notes { get; set; }
        
        [Column(TypeName = "date")]
        public DateOnly StartDate { get; set; }
        
        [Column(TypeName = "date")]        
        public DateOnly? EndDate { get; set; }
        
        public int? StatusId { get; set; }
        
        public string? StatusValue { get; set; }
        
        public string CreatedBy { get; set; }
        
        public DateTime CreatedDate { get; set; }
        
        public string ModifiedBy { get; set; }
        
        public DateTime ModifiedDate { get; set; }
        
        public int UpdateSeq { get; set; }

    }
}
