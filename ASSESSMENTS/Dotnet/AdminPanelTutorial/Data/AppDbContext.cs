using AdminPanelTutorial.Models;
using Microsoft.EntityFrameworkCore;

namespace AdminPanelTutorial.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<Doctor> Doctors { get; set; }
    }
}