using Microsoft.EntityFrameworkCore;
using PrequinReact.Server.Models;
using PrequinReact.Server.Responses;

namespace PrequinReact.Server.Repository
{
    public class InvestorsRepository : IInvestorsRepository
    {
        private readonly PGSqlContext _pgContext;
        public InvestorsRepository(PGSqlContext pgContext)
        {
            _pgContext = pgContext;
        }

        public async Task<List<Investor>> GetInvestors()
        {
            return await _pgContext.Investors.ToListAsync();
        }

        public async Task<List<InvestorSummaryResponse>> GetInvestorsSummary()
        {

            var result = await (from investor in _pgContext.Investors
                                join assetCommit in _pgContext.Assetcommits
                                    on investor.Id equals assetCommit.InvestorId into assetCommitGroup
                                from ac in assetCommitGroup.DefaultIfEmpty()
                                group ac by new { investor.Id, investor.Investorname, investor.Investortype, investor.Investorcountry } into grouped
                                select new InvestorSummaryResponse
                                {
                                    InvestorId = grouped.Key.Id,
                                    InvestorName = grouped.Key.Investorname,
                                    InvestorType = grouped.Key.Investortype,
                                    InvestorCountry = grouped.Key.Investorcountry,
                                    TotalCommitment = grouped.Sum(ac => ac.Commitmentamount ?? 0)
                                }).ToListAsync();

            return result;
        }

        public async Task<List<Assetcommit>> GetInvestorBreakdownById(int investorId)
        {
            
            return await _pgContext.Assetcommits.Where(ac => ac.InvestorId == investorId).ToListAsync();
        }

    }
}
