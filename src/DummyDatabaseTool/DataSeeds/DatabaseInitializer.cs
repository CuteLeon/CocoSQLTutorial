using DummyDatabaseTool.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace DummyDatabaseTool.DataSeeds
{
    internal static class DatabaseInitializer
    {
        public async static Task InitializeDatabaseAsync(this DummyDBContext dbContext)
        {
            try
            {
                Console.WriteLine($"Ensure database created...");
                await dbContext.Database.EnsureCreatedAsync();
                Console.WriteLine($"Check database pending migrations...");
                var pendingMigrations = await dbContext.Database.GetPendingMigrationsAsync();
                if (pendingMigrations.Any())
                {
                    Console.WriteLine($"Pending database migration should be combined: \n\t{string.Join(",", pendingMigrations)}");
                    await dbContext.Database.MigrateAsync();
                }
                Console.WriteLine($"Database check finished.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Database check failed: {ex.Message}\n{ex.StackTrace}");
            }
        }
    }
}
