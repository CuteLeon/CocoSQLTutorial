-- Single line comment
/* Multiple lins comments
 * Line 1
 Line 2
  Here is also valid */

-- 1.单表查询
SELECT * FROM Students;
SELECT StudentID, Name FROM Students;
SELECT * FROM Students s where Birthday between '2000-01-01' and '2005-12-31';
SELECT * FROM Students s where GradeID IN (1, 3);
SELECT * FROM Students s where (GradeID=1 AND ClassID=2) OR (GradeID=2 AND ClassID=3) OR (GradeID=3 AND ClassID=1);

-- 2.模糊查询
-- % : 0 or multiple characters;
-- _ : 1 character;
SELECT * FROM Students s where Name LIKE '%C%';
SELECT * FROM Students s where Name LIKE 'T%';
SELECT * FROM Students s where Name LIKE '_o%';
SELECT * FROM Students s where Name LIKE '%\\\%%';--\代表转义，每次转义一个字符

-- 3.多表联合查询
-- 3.1 展示班级信息和所有学生信息
SELECT *
FROM Classes c
LEFT JOIN Students s ON s.GradeID =c.GradeID and s.ClassID =c.ClassID;
-- 3.2 展示所有班级的考试记录
SELECT *
FROM Classes c
LEFT JOIN Exams e ON c.GradeID =e.GradeID AND c.ClassID =e.ClassID 
LEFT JOIN Subjects s ON s.SubjectID = e.SubjectID;
-- 3.3 输出所有考过科学科目的班级-方法2
SELECT *
FROM Subjects s 
LEFT JOIN Exams e ON s.SubjectID = e.SubjectID
WHERE s.SubjectName = '科学';

--3.3 输出所有考过科学科目的班级-方法2
SELECT *
FROM Classes c
INNER JOIN Exams e ON c.GradeID =e.GradeID AND c.ClassID =e.ClassID 
INNER JOIN Subjects s ON s.SubjectID = e.SubjectID AND s.SubjectName = '科学';

-- 4.嵌套查询 TBD




