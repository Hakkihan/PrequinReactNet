using PrequinReact.Server.Models;

namespace PrequinReact.Server.Responses
{
    public class InvestorSummaryResponse
    {
        public int InvestorId { get; set; }
        public string? InvestorName { get; set; }
        public string? InvestorType { get; set; }
        public string? InvestorCountry { get; set; }
        public decimal TotalCommitment { get; set; }
    }
}
