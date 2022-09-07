using DummyDatabaseTool.Models;
using static Bogus.DataSets.Name;

namespace DummyDatabaseTool.Generators
{
    internal class StudentGenerator : GeneratorBase<Students>
    {
        public StudentGenerator()
        {
            this.EntityFaker
                .RuleFor(x => x.Name, faker => faker.Name.FirstName())
                .RuleFor(x => x.Address, faker => faker.Address.FullAddress())
                .RuleFor(x => x.Gender, faker => faker.Person.Gender == Gender.Male)
                .RuleFor(x => x.Birthday, faker => faker.Date.Between(new DateTime(1995, 01, 01), new DateTime(2005, 12, 31)));
        }

        public override IEnumerable<Students> Generate()
        {
            return this.EntityFaker.GenerateForever();
        }
    }
}
