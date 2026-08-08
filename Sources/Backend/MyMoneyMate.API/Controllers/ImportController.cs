using Microsoft.AspNetCore.Mvc;
using MyMoneyMate.Application.Services;

[ApiController]
[Route("api/import")]
public class ImportController : ControllerBase
{
    private readonly ImportService _service;

    public ImportController(ImportService service)
    {
        _service = service;
    }

    [HttpPost]
    public async Task<IActionResult> Upload(IFormFile file)
    {
        using var stream = file.OpenReadStream();

        var batchId = await _service.ImportAsync(stream, file.FileName);

        return Ok(new
        {
            BatchId = batchId
        });
    }
}