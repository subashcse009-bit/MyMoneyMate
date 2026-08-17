using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    //School Fees, Retirement, Home
    public class Goal
    {
        public int GoldId {  get; set; }
        public string GoalName {  get; set; }
        //Short-Term, Mid-Term, Long-Term
        public string GoalType { get; set; }
        public string Description {  get; set; }
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
