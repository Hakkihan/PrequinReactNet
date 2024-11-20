using PrequinReact.Server.Models;
using PrequinReact.Server.Responses;

namespace PrequinReact.Server.Services
{
    public interface IInvestorsService
    {
        public Task<List<Investor>> GetInvestors();

        public Task<List<InvestorSummaryResponse>> GetInvestorsSummary();

        public Task<List<Assetcommit>> GetInvestorBreakdownById(int investorId);
    }
}
