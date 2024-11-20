using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace PrequinReact.Server.Models;

public partial class PGSqlContext : DbContext
{
    public PGSqlContext()
    {
    }

    public PGSqlContext(DbContextOptions<PGSqlContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Assetcommit> Assetcommits { get; set; }

    public virtual DbSet<Investor> Investors { get; set; }

    public virtual DbSet<Investors1> Investors1s { get; set; }

    public virtual DbSet<RawDatum> RawData { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=Prequin;Username=postgres;Password=1E2l3l4a");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Assetcommit>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("assetcommit_pkey");

            entity.ToTable("assetcommit");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Commitmentamount)
                .HasPrecision(19, 4)
                .HasColumnName("commitmentamount");
            entity.Property(e => e.Commitmentassetclass)
                .HasMaxLength(255)
                .HasColumnName("commitmentassetclass");
            entity.Property(e => e.Commitmentcurrency)
                .HasMaxLength(255)
                .HasColumnName("commitmentcurrency");
            entity.Property(e => e.InvestorId).HasColumnName("investor_id");

            entity.HasOne(d => d.Investor).WithMany(p => p.Assetcommits)
                .HasForeignKey(d => d.InvestorId)
                .HasConstraintName("fk_investor_id");
        });

        modelBuilder.Entity<Investor>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("investors_pkey");

            entity.ToTable("investors");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Investorcountry)
                .HasMaxLength(255)
                .HasColumnName("investorcountry");
            entity.Property(e => e.Investordateadded).HasColumnName("investordateadded");
            entity.Property(e => e.Investorlastupdated).HasColumnName("investorlastupdated");
            entity.Property(e => e.Investorname)
                .HasMaxLength(255)
                .HasColumnName("investorname");
            entity.Property(e => e.Investortype)
                .HasMaxLength(255)
                .HasColumnName("investortype");
        });

        modelBuilder.Entity<Investors1>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("investors1");

            entity.Property(e => e.Commitmentamount).HasColumnName("commitmentamount");
            entity.Property(e => e.Commitmentassetclass).HasColumnName("commitmentassetclass");
            entity.Property(e => e.Commitmentcurrency)
                .HasMaxLength(3)
                .IsFixedLength()
                .HasColumnName("commitmentcurrency");
            entity.Property(e => e.Investorcountry).HasColumnName("investorcountry");
            entity.Property(e => e.Investordateadded).HasColumnName("investordateadded");
            entity.Property(e => e.Investorlastupdated).HasColumnName("investorlastupdated");
            entity.Property(e => e.Investorname).HasColumnName("investorname");
            entity.Property(e => e.Investortype).HasColumnName("investortype");
        });

        modelBuilder.Entity<RawDatum>(entity =>
        {
            entity.HasKey(e => new { e.Id, e.InvestorType }).HasName("RawData_pkey");

            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("id");
            entity.Property(e => e.InvestorType)
                .HasMaxLength(255)
                .HasColumnName("Investor Type");
            entity.Property(e => e.CommitmentAmount)
                .HasDefaultValueSql("0")
                .HasColumnName("Commitment Amount");
            entity.Property(e => e.CommitmentAssetClass)
                .HasColumnType("character varying")
                .HasColumnName("Commitment Asset Class");
            entity.Property(e => e.CommitmentCurrency)
                .HasMaxLength(3)
                .HasColumnName("Commitment Currency");
            entity.Property(e => e.InvestorCountry)
                .HasMaxLength(255)
                .HasColumnName("Investor Country");
            entity.Property(e => e.InvestorDateAdded).HasColumnName("Investor Date Added");
            entity.Property(e => e.InvestorLastUpdated).HasColumnName("Investor Last Updated");
            entity.Property(e => e.InvestorName)
                .HasMaxLength(255)
                .HasColumnName("Investor Name");
        });
        modelBuilder.HasSequence("my_sequence").StartsAt(602L);

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
