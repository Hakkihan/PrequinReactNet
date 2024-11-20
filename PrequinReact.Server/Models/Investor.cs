using System;
using System.Collections.Generic;

namespace PrequinReact.Server.Models;

public partial class Investor
{
    public int Id { get; set; }

    public string? Investorname { get; set; }

    public string? Investortype { get; set; }

    public string? Investorcountry { get; set; }

    public DateOnly? Investordateadded { get; set; }

    public DateOnly? Investorlastupdated { get; set; }

    public virtual ICollection<Assetcommit> Assetcommits { get; set; } = new List<Assetcommit>();
}
