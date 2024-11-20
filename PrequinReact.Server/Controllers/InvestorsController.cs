using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PrequinReact.Server.Responses;
using PrequinReact.Server.Services;

namespace PrequinReact.Server.Controllers
{
    [ApiController]
    public class InvestorsController : ControllerBase
    {
        public readonly IInvestorsService _investorsService;

        public InvestorsController(IInvestorsService investorsService)
        {
            _investorsService = investorsService;
        }

        [HttpGet()]
        [Route("/api/investors")]
        public async Task<IActionResult> GetInvestorsAsync()
        {
            var item = await _investorsService.GetInvestors();

            if (item == null)
            {
                return NotFound(new ApiResponse<object>
                {
                    Success = false,
                    Message = "Item not found",
                    Data = null
                });
            }

            return Ok(new ApiResponse<object>
            {
                Success = true,
                Message = "Item retrieved successfully",
                Data = item
            });
        }

        [HttpGet()]
        [Route("/api/investorsSummary")]
        public async Task<IActionResult> GetInvestorsSummary()
        {
            var item = await _investorsService.GetInvestorsSummary();

            if (item == null)
            {
                return NotFound(new ApiResponse<object>
                {
                    Success = false,
                    Message = "Item not found",
                    Data = null
                });
            }

            return Ok(new ApiResponse<object>
            {
                Success = true,
                Message = "Item retrieved successfully",
                Data = item
            });
        }

        [HttpGet()]
        [Route("/api/investorBreakdown")]
        public async Task<IActionResult> GetInvestorBreakdownById([FromQuery] int investorId)
        {
            var item = await _investorsService.GetInvestorBreakdownById(investorId); 

            if (item == null)
            {
                return NotFound(new ApiResponse<object>
                {
                    Success = false,
                    Message = "Item not found",
                    Data = null
                });
            }

            return Ok(new ApiResponse<object>
            {
                Success = true,
                Message = "Item retrieved successfully",
                Data = item
            });
        }
    }
}
