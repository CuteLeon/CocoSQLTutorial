using Bogus;

namespace DummyDatabaseTool.Generators
{
    internal abstract class GeneratorBase<T>
        where T : class
    {
        protected Faker<T> EntityFaker { get; } = new Faker<T>();

        protected static Faker SharedFaker { get; } = new Faker();

        public abstract IEnumerable<T> Generate();
    }
}
