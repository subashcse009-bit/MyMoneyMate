using Microsoft.AspNetCore.Mvc;
using MyMoneyMate.Application.Services;

namespace MyMoneyMate.API.Controllers
{
    [ApiController]
    [Route("api/accounts")]

    public class AccountController : ControllerBase
    {
        private readonly AccountService _service;

        public AccountController(AccountService service)
        {
            _service = service;
        }

        [HttpGet("GetList")]
        public async Task<IActionResult> GetList()
        {
            var accounts = await _service.GetList();

            return Ok(new
            {
                Accounts = accounts
            });
        }
    }
}
