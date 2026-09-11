using MyMoneyMate.Infrastructure.Response;
using System.Diagnostics;
using System.Text.Json;

namespace MyMoneyMate.API.Middleware
{
    public class ExceptionMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<ExceptionMiddleware> _logger;


        public ExceptionMiddleware(RequestDelegate next, ILogger<ExceptionMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                await _next(context);

            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "An unhandled exception occurred while processing the request.",context.TraceIdentifier);               

                await HandleExceptionAsync(context, ex);
            }
        }

        private static async Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            context.Response.ContentType = "application/json";
            context.Response.StatusCode = StatusCodes.Status500InternalServerError;

            var correlationId = context.TraceIdentifier;
            var response = new APIResponse<object>
            {
                Success = false,
                Message = "An unexpected error occurred.",
                Data = null,
                Errors = new List<string> { exception.Message },
                CorrelationId = correlationId,
                Timestamp = DateTime.Now
            };
            var json = JsonSerializer.Serialize(response);
            await context.Response.WriteAsJsonAsync(response);
        }
    }
}
