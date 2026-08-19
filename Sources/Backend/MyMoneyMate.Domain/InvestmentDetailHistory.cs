using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    public class InvestmentDetailHistory
    {
        [Key]
        public int InvestmentDetailHistoryId { get; set; }
        
        public int InvestmentDetailId { get; set; }
        
        [ForeignKey(nameof(InvestmentDetailId))]
        public InvestmentDetail InvestmentDetail { get; set; }
        
        [Column(TypeName = "decimal(18,2)")]
        
        public decimal Amount { get; set; }
        
        public string CreatedBy { get; set; }
        
        public DateTime CreatedDate { get; set; }
        
        public string ModifiedBy { get; set; }
        
        public DateTime ModifiedDate { get; set; }
        
        public int UpdateSeq { get; set; }
    }
}
