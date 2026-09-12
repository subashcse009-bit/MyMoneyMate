using Microsoft.AspNetCore.Mvc;
using MyMoneyMate.Application.DTO;
using MyMoneyMate.Application.Services;
using MyMoneyMate.Domain;
using MyMoneyMate.Infrastructure.Response;

namespace MyMoneyMate.API.Controllers
{
    [ApiController]
    [Route("api/accounts")]

    public class AccountController : ControllerBase
    {
        private readonly AccountService _service;
        private readonly ILogger<AccountController> _logger;

        public AccountController(AccountService service, ILogger<AccountController> logger)
        {
            _service = service;
            _logger = logger;
        }

        [HttpGet("GetList")]
        public async Task<IActionResult> GetList()
        {
            var correlationId = HttpContext.TraceIdentifier;

            var accounts = await _service.GetList();

            _logger.LogInformation("Total Accounts: {TotalAccounts}", accounts.Count());

            return Ok(ResponseFactory.CreateSuccessResponse(accounts, "Accounts retrieved successfully", correlationId));
        }

        [HttpGet("GetAccountById/{id}")]
        public async Task<IActionResult> GetAccountById(int id)
        {
            var correlationId = HttpContext.TraceIdentifier;

            var account = await _service.GetAccountById(id);

            _logger.LogInformation("Account retrieved successfully for AccountId: {AccountId}", id);

            if (account == null)
            {
                return NotFound(ResponseFactory.CreateErrorResponse<AccountDetailsDTO>(errors: null, message: "Account not found", correlationId));
            }

            return Ok(ResponseFactory.CreateSuccessResponse(account, "Account retrieved successfully", correlationId));
        }

        [HttpGet("AccountDashboard")]
        public async Task<IActionResult> AccountDashboard()
        {
            var correlationId = HttpContext.TraceIdentifier;

            var dashboardData = await _service.GetAccountDashboard();

            _logger.LogInformation("Account dashboard data retrieved successfully. CorrelationId: {CorrelationId}", correlationId);
            return Ok(ResponseFactory.CreateSuccessResponse(dashboardData, "Account dashboard data retrieved successfully", correlationId));
        }

        [HttpPost("AddAccount")]
        public async Task<IActionResult> AddAccount([FromBody] AddAccountDTO accountDto)
        {
            var correlationId = HttpContext.TraceIdentifier;

            var account = await _service.AddAccount(accountDto);

            _logger.LogInformation("Account added successfully");

            return Ok(ResponseFactory.CreateSuccessResponse(account, "Account added successfully", correlationId));
        }
    }
}
