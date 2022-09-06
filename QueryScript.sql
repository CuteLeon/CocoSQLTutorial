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