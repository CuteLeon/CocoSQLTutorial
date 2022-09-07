using DummyDatabaseTool.Generators;
using DummyDatabaseTool.Models;
using static Bogus.DataSets.Name;

namespace DummyDatabaseTool.Fakers
{
    internal class StudentGenerator : GeneratorBase<Students>
    {
        public StudentGenerator()
        {
            this.EntityFaker
                .RuleFor(x => x.Name, faker => faker.Name.FirstName())
                .RuleFor(x => x.Address, faker => faker.Address.FullAddress())
                .RuleFor(x => x.Gender, faker => faker.Person.Gender == Gender.Male)
                .RuleFor(x => x.Birthday, faker => faker.Person.DateOfBirth);
        }

        public override IEnumerable<Students> Generate()
        {
            return this.EntityFaker.GenerateForever();
        }
    }
}
