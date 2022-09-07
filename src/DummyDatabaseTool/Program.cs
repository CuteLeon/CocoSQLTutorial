using DummyDatabaseTool.Generators;
using System.Text;

const int MaxGrade = 3;
const int MaxClass = 4;
const int MaxExam = 5;
const int MaxStudent = 20;

Console.WriteLine("Hello, World!");

GenerateStudents();
GenerateExams();
GenerateScores();

Console.WriteLine("Generate successfully.");

static void GenerateStudents()
{
    var builder = new StringBuilder();
    var generator = new StudentGenerator();
    for (int gradeIndex = 1; gradeIndex <= MaxGrade; gradeIndex++)
    {
        for (int classIndex = 1; classIndex <= MaxClass; classIndex++)
        {
            var objects = generator.Generate().Take(MaxStudent).ToArray();
            foreach (var item in objects)
            {
                item.GradeID = gradeIndex;
                item.ClassID = classIndex;
            }

            builder.AppendLine($"INSERT INTO Students (Gender, Name, Birthday, Address, GradeID, ClassID)");
            builder.AppendJoin(" UNION ALL\n\t", objects.Select(
                x => $"SELECT {(x.Gender ? "1" : "0")}, '{x.Name}', '{x.Birthday:yyyy-MM-dd}', '{x.Address.Replace("'", "''")}', {x.GradeID}, {x.ClassID}"));
            builder.AppendLine(";");
        }
    }

    File.WriteAllText(@"..\..\..\..\..\InitializeStudents.sql", builder.ToString());
}

static void GenerateExams()
{
    var builder = new StringBuilder();
    var generator = new ExamGenerator();
    for (int gradeIndex = 1; gradeIndex <= MaxGrade; gradeIndex++)
    {
        for (int classIndex = 1; classIndex <= MaxClass; classIndex++)
        {
            var objects = generator.Generate().Take(MaxExam).ToArray();
            foreach (var item in objects)
            {
                item.GradeID = gradeIndex;
                item.ClassID = classIndex;
            }

            builder.AppendLine($"INSERT INTO Exams (ExamTime, SubjectID, GradeID, ClassID)");
            builder.AppendJoin(" UNION ALL\n\t", objects.Select(
                x => $"SELECT '{x.ExamTime:yyyy-MM-dd HH-mm-ss)}', {x.SubjectID}, {x.GradeID}, {x.ClassID}"));
            builder.AppendLine(";");
        }
    }

    File.WriteAllText(@"..\..\..\..\..\InitializeExams.sql", builder.ToString());
}

static void GenerateScores()
{
    var builder = new StringBuilder();
    var generator = new ScoreGenerator();
    for (int gradeIndex = 1; gradeIndex <= MaxGrade; gradeIndex++)
    {
        for (int classIndex = 1; classIndex <= MaxClass; classIndex++)
        {
            var classId = (gradeIndex - 1) * MaxClass + classIndex;
            for (int examIndex = 1; examIndex <= MaxExam; examIndex++)
            {
                builder.AppendLine($"INSERT INTO Scores (ExamID, StudentID, Score)");
                var examId = (classId - 1) * MaxExam + examIndex;
                var objects = generator.Generate().Take(MaxStudent).Select((x, studentIndex) =>
                {
                    x.ExamID = examId;
                    x.StudentID = (classId - 1) * MaxStudent + studentIndex;
                    return x;
                }).ToArray();
                builder.AppendJoin(" UNION ALL\n\t", objects.Select(
                x => $"SELECT {x.ExamID}, {x.StudentID}, {x.Score}"));
                builder.AppendLine(";");
            }
        }
    }

    File.WriteAllText(@"..\..\..\..\..\InitializeScores.sql", builder.ToString());
}
