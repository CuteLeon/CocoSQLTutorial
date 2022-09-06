using DummyDatabaseTool.DataAccess;
using Microsoft.EntityFrameworkCore;
using DummyDatabaseTool.DataSeeds;

try
{
    Console.WriteLine("Hello, World!");
    Console.WriteLine("Connecting to database ...");
    var optionsBuilder = new DbContextOptionsBuilder<DummyDBContext>()
        .UseSqlite("DATA SOURCE=.\\DummyDatabase.db")
        .UseLazyLoadingProxies();
    var context = new DummyDBContext(optionsBuilder.Options);
    Console.WriteLine("Initialize database ...");
    await context.InitializeDatabaseAsync();
}
catch (Exception ex)
{
    Console.WriteLine($"Tool met an error: {ex.Message}\n{ex.StackTrace}");
}
finally
{
    Console.WriteLine("Tool exits.");
}