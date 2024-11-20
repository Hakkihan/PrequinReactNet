using System;
using System.Collections.Generic;

namespace PrequinReact.Server.Models;

public partial class Assetcommit
{
    public int Id { get; set; }

    public int? InvestorId { get; set; }

    public string? Commitmentassetclass { get; set; }

    public decimal? Commitmentamount { get; set; }

    public string? Commitmentcurrency { get; set; }

    public virtual Investor? Investor { get; set; }
}
