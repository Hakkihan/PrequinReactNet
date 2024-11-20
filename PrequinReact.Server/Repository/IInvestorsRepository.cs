using PrequinReact.Server.Models;
using PrequinReact.Server.Responses;

namespace PrequinReact.Server.Repository
{
    public interface IInvestorsRepository
    {
        public Task<List<Investor>> GetInvestors();
        public Task<List<InvestorSummaryResponse>> GetInvestorsSummary();
        public Task<List<Assetcommit>> GetInvestorBreakdownById(int investorId);
    }
}
