using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Application.DTO
{
    public class AddAccountDTO
    {
        public string AccountName { get; set; }

        public string? AccountNumber { get; set; }

        public decimal OpeningBalance { get; set; }

        public decimal? CurrentBalance { get; set; }

        public decimal? CreditLimit { get; set; }

        public decimal? InterestRate { get; set; }

        public DateTime? StartDate { get; set; }
    }
}
