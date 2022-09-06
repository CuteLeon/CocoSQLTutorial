using DummyDatabaseTool.Generators;
using DummyDatabaseTool.Models;

namespace DummyDatabaseTool.Fakers
{
    internal class GradeGenerator : GeneratorBase<Grades>
    {
        public int GradeID { get; set; }

        public string GradeDirector { get; set; }

        public override IEnumerable<Grades> Generate()
        {
            return default;
        }
    }
}
