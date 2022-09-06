using DummyDatabaseTool.Generators;
using DummyDatabaseTool.Models;

namespace DummyDatabaseTool.Fakers
{
    internal class StudentGenerator : GeneratorBase<Students>
    {
        public int StudentID { get; set; }

        public string CitizenID { get; set; }

        public string Name { get; set; }

        public DateTime Birthday { get; set; }

        public string Address { get; set; }

        public int GradeID { get; set; }

        public int ClassID { get; set; }

        public override IEnumerable<Students> Generate()
        {
            return default;
        }
    }
}
