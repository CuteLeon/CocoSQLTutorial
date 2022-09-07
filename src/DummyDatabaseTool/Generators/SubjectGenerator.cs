using DummyDatabaseTool.Models;

namespace DummyDatabaseTool.Generators
{
    internal class SubjectGenerator : GeneratorBase<Subjects>
    {
        public int SubjectID { get; set; }

        public string SubjectName { get; set; }

        public SubjectGenerator()
        {
            this.EntityFaker.RuleFor(x => x.SubjectName, faker => faker.Name.JobType());
        }

        public override IEnumerable<Subjects> Generate()
        {
            return Enumerable.Range(1, 10)
                .Select(x => SharedFaker.Name.JobType())
                .Distinct()
                .OrderBy(x => x)
                .Select((x, index) => new Subjects()
                {
                    SubjectID = index,
                    SubjectName = x
                });
        }
    }
}
