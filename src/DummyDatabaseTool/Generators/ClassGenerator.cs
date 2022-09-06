using Bogus;
using DummyDatabaseTool.Generators;
using DummyDatabaseTool.Models;

namespace DummyDatabaseTool.Fakers
{
    internal class ClassGenerator : GeneratorBase<Classes>
    {
        public int GradeID { get; set; }

        public int ClassID { get; set; }

        public int ClassRoomID { get; set; }

        public string ClassDirector { get; set; }

        public override IEnumerable<Classes> Generate()
        {
            return default;
        }
    }
}
