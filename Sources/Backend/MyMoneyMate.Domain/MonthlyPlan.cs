using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    public class MonthlyPlan
    {
        public int MonthlyPlanId { get; set; }
        public DateTime MonthDate {  get; set; }
        public string PlanName { get; set; }
        public string Description { get; set; }
        public string Notes { get; set; }
        public int StatusID { get; set; }
        public string StatusValue { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int UpdateSeq { get; set; }

    }
}
