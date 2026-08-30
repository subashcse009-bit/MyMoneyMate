using Microsoft.AspNetCore.Mvc;
using MyMoneyMate.Application.Services;

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
            var accounts = await _service.GetList();

            _logger.LogInformation("Total Accounts");

            return Ok(new
            {
                Accounts = accounts
            });
        }
    }
}
