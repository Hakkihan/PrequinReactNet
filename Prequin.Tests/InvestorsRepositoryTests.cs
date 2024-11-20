using Microsoft.EntityFrameworkCore;
using PrequinReact.Server.Models;
using PrequinReact.Server.Repository;

public class InvestorsRepositoryTests
{
    private readonly PGSqlContext _context;
    private readonly InvestorsRepository _repository;

    public InvestorsRepositoryTests()
    {
        // Create a fresh DbContextOptions for the InMemory database
        var options = new DbContextOptionsBuilder<PGSqlContext>()
            .UseInMemoryDatabase(databaseName: "TestDatabase") // Ensure unique database name per test
            .Options;

        // Initialize the in-memory database context
        _context = new PGSqlContext(options);

        // Seed data if needed
        SeedTestData();

        // Create the repository instance with the test context
        _repository = new InvestorsRepository(_context);
    }

    private void SeedTestData()
    {
        // Seed some initial data for testing
        _context.Investors.AddRange(
            new Investor { Id = 1, Investorname = "Investor 1", Investortype = "Type A", Investorcountry = "Country X" },
            new Investor { Id = 2, Investorname = "Investor 2", Investortype = "Type B", Investorcountry = "Country Y" }
        );

        _context.Assetcommits.AddRange(
            new Assetcommit { Id = 1, InvestorId = 1, Commitmentamount = 10000 },
            new Assetcommit { Id = 2, InvestorId = 1, Commitmentamount = 15000 },
            new Assetcommit { Id = 3, InvestorId = 2, Commitmentamount = 5000 }
        );

        _context.SaveChanges();
    }

    [Fact]
    public async Task GetInvestors_ShouldReturnAllInvestors()
    {
        // Act
        var result = await _repository.GetInvestors();

        // Assert
        Assert.NotNull(result);
        Assert.Equal(2, result.Count); // Verify the count matches the seeded data
    }

    [Fact]
    public async Task GetInvestorsSummary_ShouldReturnInvestorSummaries()
    {
        // Act
        var result = await _repository.GetInvestorsSummary();

        // Assert
        Assert.NotNull(result);
        Assert.Equal(2, result.Count); // 2 summaries for the 2 investors
        Assert.Equal(25000, result.First(r => r.InvestorId == 1).TotalCommitment);
    }
}
