using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    public class InvestmentDetail
    {
        [Key]
        public int InvestmentDetailId { get; set; }
        
        public int GoalId { get; set; }
        
        [ForeignKey(nameof(GoalId))]
        public Goal Goal { get; set; }

        // HDFC Flexi Cap Fund
        public string InvestmentDetailName { get; set; }
        
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
