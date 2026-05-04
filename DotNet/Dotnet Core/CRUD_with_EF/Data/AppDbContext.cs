using Microsoft.EntityFrameworkCore;
using CRUD_with_EF.Models;

namespace CRUD_with_EF.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options){}
        public DbSet<Employee> Employees { get; set; }
    }
}