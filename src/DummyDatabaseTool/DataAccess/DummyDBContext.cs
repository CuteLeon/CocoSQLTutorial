using Microsoft.EntityFrameworkCore;

namespace DummyDatabaseTool.DataAccess
{
    internal class DummyDBContext : DbContext
    {
        public DummyDBContext() { }

        public DummyDBContext(DbContextOptions options) : base(options) { }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
            optionsBuilder.LogTo(new Action<string>(message => Console.WriteLine($"[DbContextLog] => {message}")));
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }
    }
}
