using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Domain
{
    public class ScheduledExpense
    {
        public int ScheduledExpenseId { get; set; }
        public int AccountId { get; set; }
        public int CategoryId { get; set; }
        public decimal ExpenseAmount { get; set; }
        public decimal IncomeAmount { get; set; }
        public DateOnly StartDate { get; set; }
        public DateOnly EndDate { get; set; }
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

