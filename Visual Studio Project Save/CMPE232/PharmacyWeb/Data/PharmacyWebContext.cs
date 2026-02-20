using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccess;

namespace PharmacyWeb.Data
{
    public class PharmacyWebContext : DbContext
    {
        public PharmacyWebContext (DbContextOptions<PharmacyWebContext> options)
            : base(options)
        {
        }

        public DbSet<DataAccess.MEDICINE> MEDICINE { get; set; } = default!;
        public DbSet<DataAccess.PHARMACY> PHARMACY { get; set; } = default!;
        public DbSet<DataAccess.PHARMACIST> PHARMACIST { get; set; } = default!;
        public DbSet<DataAccess.MEDICINE_COMPANY> MEDICINE_COMPANY { get; set; } = default!;
        public DbSet<DataAccess.MEDICINE_COMPANY_LOCATIONS> MEDICINE_COMPANY_LOCATIONS { get; set; } = default!;
        public DbSet<DataAccess.EMPLOYEE> EMPLOYEE { get; set; } = default!;
        public DbSet<DataAccess.CUSTOMER> CUSTOMER { get; set; } = default!;
        public DbSet<DataAccess.PRESCRIPTION> PRESCRIPTION { get; set; } = default!;
        public DbSet<DataAccess.BUYS_MEDICINE_FROM> BUYS_MEDICINE_FROM { get; set; } = default!;
        public DbSet<DataAccess.GETS_MEDICINE_FROM> GETS_MEDICINE_FROM { get; set; } = default!;
    }
}
