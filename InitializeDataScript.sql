INSERT INTO ClassRooms (ClassRoomID, Address)
SELECT 1,  '1st, 1st' UNION ALL
SELECT 2,  '1st, 2nd' UNION ALL
SELECT 3,  '1st, 3rd' UNION ALL
SELECT 4,  '1st, 4th' UNION ALL
SELECT 5,  '1st, 5th' UNION ALL
SELECT 6,  '2nd, 1st' UNION ALL
SELECT 7,  '2nd, 2nd' UNION ALL
SELECT 8,  '2nd, 3rd' UNION ALL
SELECT 9,  '2nd, 4th' UNION ALL
SELECT 10, '2nd, 5th' UNION ALL
SELECT 11, '3rd, 1st' UNION ALL
SELECT 12, '3rd, 2nd' UNION ALL
SELECT 13, '3rd, 3rd' UNION ALL
SELECT 14, '3rd, 4th' UNION ALL
SELECT 15, '3rd, 5th' UNION ALL
SELECT 16, '4th, 1st' UNION ALL
SELECT 17, '4th, 2nd' UNION ALL
SELECT 18, '4th, 3rd' UNION ALL
SELECT 19, '4th, 4th' UNION ALL
SELECT 20, '4th, 5th';

INSERT INTO Grades (GradeID, GradeDirector)
SELECT 1, 'Grade Director Tom' UNION ALL
SELECT 2, 'Grade Director Jerry' UNION ALL
SELECT 3, 'Grade Director Jack';

INSERT INTO Classes (GradeID, ClassID, ClassRoomID, ClassDirector)
SELECT 1, 1, 1,  'Class Director Terry' UNION ALL
SELECT 1, 2, 2,  'Class Director Emily' UNION ALL
SELECT 1, 3, 3,  'Class Director Bin' UNION ALL
SELECT 1, 4, 4,  'Class Director Terry' UNION ALL
SELECT 2, 1, 6,  'Class Director Diana' UNION ALL
SELECT 2, 2, 7,  'Class Director Laura' UNION ALL
SELECT 2, 3, 8,  'Class Director Jaci' UNION ALL
SELECT 2, 4, 9,  'Class Director Stacy' UNION ALL
SELECT 3, 1, 11, 'Class Director Lilic' UNION ALL
SELECT 3, 2, 12, 'Class Director Cindy' UNION ALL
SELECT 3, 3, 13,  'Class Director Denis' UNION ALL
SELECT 3, 4, 14, 'Class Director Jerremy';

INSERT INTO Subjects (SubjectID, SubjectName)
SELECT 1, '语文' UNION ALL
SELECT 2, '数学' UNION ALL
SELECT 3, '英语' UNION ALL
SELECT 4, '科学';

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
