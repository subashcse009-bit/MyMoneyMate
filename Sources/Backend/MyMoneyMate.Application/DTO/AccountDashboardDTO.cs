using MyMoneyMate.Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Infrastructure.Response
{
    public class AccountDashboardDTO
    {
        public AccountSummaryDTO Summary { get; set; }
        public List<AccountDetailsDTO> AccountDetails { get; set; }
        public List<NetworthTrendDTO> NetWorthTrends { get; set; }
        public List<AccountTypeSummaryDTO> AccountTypeSummaries { get; set; }
        public List<AssertsAllocationDTO> AssertsAllocations { get; set; }
    }

    public class AccountDetailsDTO
    {
        public int AccountId { get; set; }
        public string AccountName { get; set; }
        public string AccountTypeValue { get; set; }
        public decimal CurrentBalance { get; set; }
        public decimal OpeningBalance { get; set; }
        public decimal? CreditLimit { get; set; }
        public decimal? InterestRate { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? MaturityDate { get; set; }
        public string AccountSideValue { get; set; }
        public int DisplayOrder { get; set; }
        public string? StatusValue { get; set; }
    }

    public class AccountSummaryDTO
    {
        public decimal TotalAssets { get; set; }
        public decimal AssertInceasePercentage { get; set; }
        public decimal TotalLiabilities { get; set; }
        public decimal LiabilitiesIncreasePercentage { get; set; }
        public decimal NetWorth { get; set; }
        public decimal NetWorthIncreasePercentage { get; set; }
        public int TotalActiveAccounts { get; set; }
    }


    public class AccountTypeSummaryDTO
    {
        public string AccountType { get; set; }
        public decimal TotalBalance { get; set; }
    }


    public class AssertsAllocationDTO
    {
        public string AccountType { get; set; }
        public decimal TotalBalance { get; set; }
        public decimal Percentage { get; set; }
    }


    public class NetworthTrendDTO
    {
        public DateTime Date { get; set; }
        public decimal NetWorth { get; set; }
    }
}
