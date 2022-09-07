using DummyDatabaseTool.Models;

namespace DummyDatabaseTool.Generators
{
    internal class ScoreGenerator : GeneratorBase<Scores>
    {
        public ScoreGenerator()
        {
            this.EntityFaker
                .RuleFor(x => x.Score, faker => faker.Random.Double(50.0, 100.0));
        }

        public override IEnumerable<Scores> Generate()
        {
            return this.EntityFaker.GenerateForever();
        }
    }
}
