using System.Diagnostics;

namespace MyMoneyMate.API.Middleware
{
    public class LoggerMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<LoggerMiddleware> _logger;

        public LoggerMiddleware(RequestDelegate next,
        ILogger<LoggerMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            var stopwatch = Stopwatch.StartNew();

            try
            {
                _logger.LogInformation(
                    "Request started: {Method} {Path}",
                    context.Request.Method,
                    context.Request.Path);

                await _next(context);

                stopwatch.Stop();

                _logger.LogInformation(
                    "Request completed: {Method} {Path} StatusCode: {StatusCode} Duration: {Duration}ms",
                    context.Request.Method,
                    context.Request.Path,
                    context.Response.StatusCode,
                    stopwatch.ElapsedMilliseconds);
            }
            catch (Exception ex)
            {
                stopwatch.Stop();

                _logger.LogError(
                    ex,
                    "Request failed: {Method} {Path} Duration: {Duration}ms",
                    context.Request.Method,
                    context.Request.Path,
                    stopwatch.ElapsedMilliseconds);

                throw;
            }
        }
    }
}
