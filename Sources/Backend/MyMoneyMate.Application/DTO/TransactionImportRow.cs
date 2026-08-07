using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.DTO
{
    public class TransactionImportRow
    {
        public string TransactionDate { get;set;  } = string.Empty;
        public string Account { get;set;  } = string.Empty;
        public string Category { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string IncomeAmount { get; set; } = string.Empty;
        public string ExpenseAmount { get; set; } = string.Empty;
    }
}
