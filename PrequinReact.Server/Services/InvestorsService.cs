
using PrequinReact.Server.Models;
using PrequinReact.Server.Repository;
using PrequinReact.Server.Responses;

namespace PrequinReact.Server.Services
{
    public class InvestorsService : IInvestorsService
    {

        private readonly IInvestorsRepository _investorsRespository;

        public InvestorsService(IInvestorsRepository investorsRespository)
        {
            _investorsRespository = investorsRespository;
        }

        public async Task<List<Investor>> GetInvestors()
        {
            var investors = await _investorsRespository.GetInvestors();
            return investors;
        }
        public async Task<List<InvestorSummaryResponse>> GetInvestorsSummary()
        {
            var investors = await _investorsRespository.GetInvestorsSummary();
            return investors;
        }

        public async Task<List<Assetcommit>> GetInvestorBreakdownById(int investorId)
        {
            var investorData = await _investorsRespository.GetInvestorBreakdownById(investorId);
            return investorData;
        }
    }
}
