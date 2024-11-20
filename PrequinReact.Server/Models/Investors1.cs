using System;
using System.Collections.Generic;

namespace PrequinReact.Server.Models;

public partial class Investors1
{
    public string? Investorname { get; set; }

    public string? Investortype { get; set; }

    public string? Investorcountry { get; set; }

    public DateOnly? Investordateadded { get; set; }

    public DateOnly? Investorlastupdated { get; set; }

    public string? Commitmentassetclass { get; set; }

    public decimal? Commitmentamount { get; set; }

    public string? Commitmentcurrency { get; set; }
}
