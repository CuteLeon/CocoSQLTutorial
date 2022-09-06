using DummyDatabaseTool.Generators;
using DummyDatabaseTool.Models;

namespace DummyDatabaseTool.Fakers
{
    internal class ScoreGenerator : GeneratorBase<Scores>
    {
        public int ScoreID { get; set; }

        public int ExamID { get; set; }

        public int StudentID { get; set; }

        public double Score { get; set; }

        public override IEnumerable<Scores> Generate()
        {
            return default;
        }
    }
}
