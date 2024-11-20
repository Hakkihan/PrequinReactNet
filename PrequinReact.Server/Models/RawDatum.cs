using System;
using System.Collections.Generic;

namespace PrequinReact.Server.Models;

public partial class RawDatum
{
    public int Id { get; set; }

    public string InvestorName { get; set; } = null!;

    public string InvestorType { get; set; } = null!;

    public string? InvestorCountry { get; set; }

    public DateOnly InvestorDateAdded { get; set; }

    public DateOnly? InvestorLastUpdated { get; set; }

    public string? CommitmentAssetClass { get; set; }

    public decimal? CommitmentAmount { get; set; }

    public string? CommitmentCurrency { get; set; }
}
