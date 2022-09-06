using DummyDatabaseTool.Fakers;
using System.Text;

Console.WriteLine("Hello, World!");
var scriptBuilder = new StringBuilder();

var subjectGenerator = new SubjectGenerator();
var subjects = subjectGenerator.Generate().Take(10).Distinct().ToArray();
scriptBuilder.AppendLine($"INSERT INTO Subjects (SubjectName)\n\t{string.Join("UNION ALL\n\t", subjects.Select(x=>$"SELECT '{x.SubjectName}'"))};");

Console.WriteLine(scriptBuilder.ToString());
Console.WriteLine("Generate successfully.");