using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Infrastructure.Response
{
    public class APIResponse<T>
    {
        public bool Success { get; set; }
        public string Message { get; set; } = string.Empty;
        public T? Data { get; set; }
        public List<string>? Errors { get; set; }
        public string CorrelationId { get; set; } = string.Empty;
        public DateTime Timestamp { get; set; }

    }
}
