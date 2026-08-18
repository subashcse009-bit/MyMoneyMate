using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    public class InvestmentType
    {
        [Key]
        public int InvestmentTypeId { get; set; }
        public string InvestmentTypeName { get; set; }
        public string InvestmentTypeDescription { get; set; }
        public int StatusID { get; set; }
        public string StatusValue { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int UpdateSeq { get; set; }
    }
}
