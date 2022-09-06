DROP TABLE IF EXISTS ClassRooms;
CREATE TABLE ClassRooms (
	ClassRoomID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Address NVARCHAR(120) NOT NULL
);

DROP TABLE IF EXISTS Grades;
CREATE TABLE Grades (
	GradeID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	GradeDirector NVARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS Classes;
CREATE TABLE Classes (
	GradeID INTEGER NOT NULL,
	ClassID INTEGER NOT NULL,
	ClassRoomID INTEGER NOT NULL,
	ClassDirector NVARCHAR(50) NOT NULL,
    CONSTRAINT [PK_GradeIDClassID] PRIMARY KEY ([GradeID], [ClassID]),
    FOREIGN KEY ([GradeID]) REFERENCES [Grades] ([GradeID]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY ([ClassRoomID]) REFERENCES [ClassRooms] ([ClassRoomID]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS Students;
CREATE TABLE Students (
	StudentID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	CitizenID CHAR(18) NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	Birthday Date NOT NULL,
	Address NVARCHAR(120) NULL,
	GradeID INTEGER NOT NULL,
	ClassID INTEGER NOT NULL,
	FOREIGN KEY ([GradeID]) REFERENCES [Grades] ([GradeID]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY ([ClassID]) REFERENCES [Classes] ([ClassID]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE UNIQUE INDEX [IDX_CitizenID] ON [Students]([CitizenID]);

DROP TABLE IF EXISTS Subjects;
CREATE TABLE Subjects (
	SubjectID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	SubjectName NVARCHAR(50) NOT NULL
);
CREATE UNIQUE INDEX [IDX_SubjectName] ON [Subjects]([SubjectName]);

DROP TABLE IF EXISTS Exams;
CREATE TABLE Exams (
	ExamID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ExamTime DATETIME NOT NULL,
	SubjectID INTEGER NOT NULL,
	GradeID INTEGER NOT NULL,
	ClassID INTEGER NOT NULL,
	FOREIGN KEY ([SubjectID]) REFERENCES [Subjects] ([SubjectID]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY ([GradeID]) REFERENCES [Grades] ([GradeID]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY ([ClassID]) REFERENCES [Classes] ([ClassID]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE UNIQUE INDEX [IDX_GradeIDClassIDExamTime] ON [Exams]([GradeID], [ClassID], [ExamTime]);
CREATE INDEX [IDX_GradeIDClassIDSubjectID] ON [Exams]([GradeID], [ClassID], [SubjectID]);

DROP TABLE IF EXISTS Scores;
CREATE TABLE Scores (
	ScoreID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ExamID INTEGER NOT NULL,
	StudentID INTEGER NOT NULL,
	Score DOUBLE NOT NULL,
	FOREIGN KEY ([ExamID]) REFERENCES [Exams] ([ExamID]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY ([StudentID]) REFERENCES [Students] ([StudentID]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE UNIQUE INDEX [IDX_ExamIDStudentID] ON [Scores]([ExamID], [StudentID]);

INSERT INTO ClassRooms (Address)
SELECT '1st, 1st' UNION ALL
SELECT '1st, 2nd' UNION ALL
SELECT '1st, 3rd' UNION ALL
SELECT '1st, 4th' UNION ALL
SELECT '1st, 5th' UNION ALL
SELECT '2nd, 1st' UNION ALL
SELECT '2nd, 2nd' UNION ALL
SELECT '2nd, 3rd' UNION ALL
SELECT '2nd, 4th' UNION ALL
SELECT '2nd, 5th' UNION ALL
SELECT '3rd, 1st' UNION ALL
SELECT '3rd, 2nd' UNION ALL
SELECT '3rd, 3rd' UNION ALL
SELECT '3rd, 4th' UNION ALL
SELECT '3rd, 5th';

INSERT INTO Grades (GradeID, GradeDirector)
SELECT 1, 'Grade Director Tom' UNION ALL
SELECT 2, 'Grade Director Jerry' UNION ALL
SELECT 3, 'Grade Director Jack';

INSERT INTO Classes (GradeID, ClassID, ClassRoomID, ClassDirector)
SELECT 1, 1, 1,  'Class Director Terry' UNION ALL
SELECT 1, 2, 2,  'Class Director Emily' UNION ALL
SELECT 1, 3, 3,  'Class Director Bin' UNION ALL
SELECT 2, 1, 6,  'Class Director Diana' UNION ALL
SELECT 2, 2, 7,  'Class Director Laura' UNION ALL
SELECT 2, 3, 8,  'Class Director Jaci' UNION ALL
SELECT 3, 1, 11, 'Class Director Lilic' UNION ALL
SELECT 3, 2, 12, 'Class Director Cindy' UNION ALL
SELECT 3, 3, 13, 'Class Director Jerremy';

INSERT INTO Students (CitizenID, Name, Birthday, Address, GradeID, ClassID)
SELECT '412326199706184235', 'Leon', '1997-06-18', '上海市中建大厦35F', 3, 2 UNION ALL
SELECT '238764782364786723', 'Ksadjh', '1996-03-19', 'Hsajd Jsakd Ksdjw', 1, 3;

INSERT INTO Subjects (SubjectName)
SELECT '语文' UNION ALL
SELECT '数学' UNION ALL
SELECT '英语' UNION ALL
SELECT '科学';

INSERT INTO Exams (ExamTime, SubjectID,	GradeID, ClassID)
SELECT DATETIME(), 1, 2, 1 UNION ALL
SELECT DATETIME(), 1, 2, 3 UNION ALL
SELECT DATETIME(), 1, 1, 3 UNION ALL
SELECT DATETIME(), 1, 3, 2 UNION ALL
SELECT DATETIME(), 1, 3, 1,

INSERT INTO Scores (ExamID, StudentID, Score)
SELECT 1, 1, 100 UNION ALL
SELECT 4, 2, 97 UNION ALL
SELECT 2, 3, 83 UNION ALL
SELECT 3, 4, 68 UNION ALL
SELECT 5, 5, 77;

SELECT * FROM ClassRooms cr;
SELECT * FROM Grades g;
SELECT * FROM Classes c;
SELECT * FROM Students s;
SELECT * FROM Subjects s;
SELECT * FROM Exams e;
SELECT * FROM Scores s;

SELECT *
FROM Students s
LEFT JOIN Grades g ON g.GradeID = s.GradeID
LEFT JOIN Classes c ON c.GradeID = s.GradeID AND c.ClassID = s.ClassID 
LEFT JOIN ClassRooms cr ON cr.ClassRoomID = c.ClassRoomID;

SELECT cr.ClassRoomID, c.GradeID, c.ClassID, Count(1), Max(es.Score)
FROM ClassRooms cr
INNER JOIN Classes c ON c.ClassRoomID = cr.ClassRoomID
INNER JOIN Students s ON s.GradeID = c.GradeID AND s.ClassID = c.ClassID
LEFT JOIN Exams e ON e.GradeID = c.GradeID AND e.ClassID = c.ClassID
LEFT JOIN Scores es ON es.ExamID = e.ExamID
GROUP BY cr.ClassRoomID, c.GradeID, c.ClassID 
-- HAVING Count(1) > 0