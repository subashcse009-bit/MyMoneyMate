using Microsoft.AspNetCore.Mvc;
using MyMoneyMate.Application.Services;

[ApiController]
[Route("api/import")]
public class ImportController : ControllerBase
{
    private readonly ImportService _service;
    private readonly ValidateService _validateService;

    public ImportController(ImportService service, ValidateService validateService)
    {
        _service = service;
        _validateService = validateService;
    }

    [HttpPost("Upload")]
    public async Task<IActionResult> Upload(IFormFile file)
    {
        using var stream = file.OpenReadStream();

        var batchId = await _service.ImportAsync(stream, file.FileName);

        return Ok(new
        {
            BatchId = batchId
        });
    }

    [HttpPost("Validate")]
    public async Task<IActionResult> Validate(int batchId)
    {
        await _validateService.ValidateTransactionStages(batchId);
        return Ok(new { Message = "Validation completed." });
    }
}