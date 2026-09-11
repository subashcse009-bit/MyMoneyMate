using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMoneyMate.Infrastructure.Response
{
    public static class ResponseFactory
    {
        public static APIResponse<T> CreateSuccessResponse<T>(T data, string message = "", string correlationId = "")
        {
            return new APIResponse<T>
            {
                Success = true,
                Message = message,
                Data = data,
                CorrelationId = correlationId,
                Timestamp = DateTime.Now
            };
        }

        public static APIResponse<T> CreateErrorResponse<T>(List<string>? errors = null, string message = "", string correlationId = "")
        {
            return new APIResponse<T>
            {
                Success = false,
                Message = message,
                Errors = errors,
                CorrelationId = correlationId,
                Timestamp = DateTime.Now
            };
        }
    }
}
