using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    public class InvestmentDetail
    {
        [Key]
        public int InvestmentDetailId { get; set; }
        public int InvestmentId { get; set; }
        // HDFC Flexi Cap Fund
        public string InvestmentDetailName { get; set; }
        public string Description { get; set; }
        public string Notes { get; set; }
        public DateOnly StartDate { get; set; }
        public DateOnly EndDate { get; set; }
        public int StatusID { get; set; }
        public string StatusValue { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int UpdateSeq { get; set; }
    }
}
