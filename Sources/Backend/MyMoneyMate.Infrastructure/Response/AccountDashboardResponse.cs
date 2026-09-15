using MyMoneyMate.Domain.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Infrastructure.Response
{
    public class AccountDashboardResponse
    {
        public AccountSummaryDTO Summary { get; set; }
        public List<AccountDetailsDTO> AccountDetails { get; set; }
        public List<NetworthTrendDTO> NetWorthTrends { get; set; }
        public List<AccountTypeSummaryDTO> AccountTypeSummaries { get; set; }
        public List<AssertsAllocationDTO> AssertsAllocations { get; set; }
    }
}
