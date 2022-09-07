using DummyDatabaseTool.Fakers;
using System.Text;

const int MaxGrade = 3;
const int MaxClass = 4;
const int MaxStudent = 50;

Console.WriteLine("Hello, World!");

GenerateStudents();

Console.WriteLine("Generate successfully.");

static void GenerateStudents()
{
    var builder = new StringBuilder();
    var generator = new StudentGenerator();
    for (int gradeId = 1; gradeId <= MaxGrade; gradeId++)
    {
        for (int classId = 1; classId <= MaxClass; classId++)
        {
            var objects = generator.Generate().Take(MaxStudent).ToArray();
            foreach (var item in objects)
            {
                item.GradeID = gradeId;
                item.ClassID = classId;
            }

            builder.AppendLine($"INSERT INTO Students (Gender, Name, Birthday, Address, GradeID, ClassID)");
            builder.AppendJoin(" UNION ALL\n\t", objects.Select(
                x => $"SELECT {(x.Gender ? "1" : "0")}, '{x.Name}', '{x.Birthday:yyyy-MM-dd}', '{x.Address.Replace("'", "''")}', {x.GradeID}, {x.ClassID}"));
            builder.AppendLine(";");
        }
    }

    File.WriteAllText(@"..\..\..\..\..\InitializeStudents.sql", builder.ToString());
}
