using DummyDatabaseTool.Models;

namespace DummyDatabaseTool.Generators
{
    internal class ExamGenerator : GeneratorBase<Exams>
    {
        public ExamGenerator()
        {
            this.EntityFaker
                .RuleFor(x => x.ExamTime, faker => faker.Date.Between(
                    new DateTime(2022, 09, 01, 09, 00, 00), new DateTime(2022, 12, 31, 17, 00, 00)))
                .RuleFor(x => x.SubjectID, faker => faker.Random.Int(1, 4));
        }

        public override IEnumerable<Exams> Generate()
        {
            return this.EntityFaker.GenerateForever();
        }
    }
}
