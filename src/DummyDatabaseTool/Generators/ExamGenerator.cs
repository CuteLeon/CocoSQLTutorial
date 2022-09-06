using DummyDatabaseTool.Models;

namespace DummyDatabaseTool.Generators
{
    internal class ExamGenerator : GeneratorBase<Exams>
    {
        public int ExamID { get; set; }

        public DateTime ExamTime { get; set; }

        public int SubjectID { get; set; }

        public int GradeID { get; set; }

        public int ClassID { get; set; }

        public override IEnumerable<Exams> Generate()
        {
            return default;
        }
    }
}
