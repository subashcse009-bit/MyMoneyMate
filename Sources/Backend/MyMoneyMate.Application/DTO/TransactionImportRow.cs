using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.DTO
{
    public class TransactionImportRow
    {
        public DateTime TransactionDate { get; set; }
        public string Account { get; set; } = string.Empty;
        public string Category { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public decimal IncomeAmount { get; set; } = 0m;
        public decimal ExpenseAmount { get; set; } = 0m;
    }
}
