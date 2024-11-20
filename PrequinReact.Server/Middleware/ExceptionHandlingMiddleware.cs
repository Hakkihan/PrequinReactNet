namespace PrequinReact.Server.Middleware
{
    using System.Net;
    using System.Text.Json;

    public class ExceptionHandlingMiddleware
    {
        private readonly RequestDelegate _next;

        public ExceptionHandlingMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                await HandleExceptionAsync(context, ex);
            }
        }

        private static Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            var response = context.Response;
            response.ContentType = "application/json";

            // Customize based on exception type
            var statusCode = exception switch
            {
                ArgumentException => (int)HttpStatusCode.BadRequest,
                KeyNotFoundException => (int)HttpStatusCode.NotFound,
                _ => (int)HttpStatusCode.InternalServerError,
            };

            var result = JsonSerializer.Serialize(new
            {
                StatusCode = statusCode,
                Message = exception.Message,
                Details = exception.InnerException?.Message
            });

            response.StatusCode = statusCode;
            return response.WriteAsync(result);
        }
    }
}
