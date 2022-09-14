-- Single line comment
/* Multiple lins comments
 * Line 1
 Line 2
  Here is also valid */

-- 1.单表查询
SELECT * FROM Students;
SELECT StudentID, Name FROM Students;
SELECT * FROM Students s WHERE Birthday between '2000-01-01' AND '2005-12-31';
SELECT * FROM Students s WHERE GradeID IN (1, 3);
SELECT * FROM Students s WHERE (GradeID=1 AND ClassID=2) OR (GradeID=2 AND ClassID=3) OR (GradeID=3 AND ClassID=1);

-- 2.模糊查询
-- % : 0 OR multiple characters;
-- _ : 1 character;
SELECT * FROM Students s WHERE Name LIKE '%C%';
SELECT * FROM Students s WHERE Name LIKE 'T%';
SELECT * FROM Students s WHERE Name LIKE '_o%';
SELECT * FROM Students s WHERE Name LIKE '%\\\%%';--\代表转义，每次转义一个字符

-- 3.多表联合查询
-- 3.1 展示班级信息和所有学生信息
SELECT *
FROM Classes c
LEFT JOIN Students s ON s.GradeID =c.GradeID AND s.ClassID =c.ClassID;
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

-- Day2
-- 4. 1 单维度Group BY
SELECT Gender, COUNT(1)
FROM Students s 
GROUP BY s.Gender;

-- 4.2 多维度分组求count
SELECT s.Gender, s.GradeID, s.ClassID, COUNT(1)
FROM Students s 
GROUP BY s.Gender, s.GradeID, s.ClassID;

--4.3 只输出满足上述条件，且count的结果>10的信息--> 对于set的filter用having
SELECT s.Gender, s.GradeID, s.ClassID, COUNT(1)
FROM Students s 
GROUP BY s.Gender, s.GradeID, s.ClassID
HAVING COUNT(1) > 10;

--4.4 输出每个班级所有考试的最高分和最低分是几分？不用知道学生是谁
SELECT e.GradeID, e.ClassID, ROUND(MAX(s.Score)/10, 2), ROUND(MIN，(s.Score), 4)
FROM Exams e
LEFT JOIN Scores s ON e.ExamID =s.ExamID 
GROUP BY e.GradeID, e.ClassID;

-- 5.嵌套查询 
-- 5.1 学生所在班级的最高分和最低分，需要知道学生的名字

SELECT s3.GradeID, s3.ClassID, s3.Name, t.MaxScore, t.MinScore
FROM Students s3 
LEFT JOIN (
	SELECT s.ClassID, s.GradeID, MAX(s2.Score) AS MAXScore, MIN(s2.Score) AS MINScore
	FROM Students s 
	LEFT JOIN Scores s2 ON s.StudentID = s2.StudentID 
	GROUP BY s.ClassID, s.GradeID) t
	ON s3.GradeID =t.GradeID AND s3.ClassID =t.ClassID;

-- 一年级一班男生数学平均分数和一年级三班数学平均分数
-- 每个班级举行的第一场考试是什么科目
-- 每个班级第一场考试的前五名学生的名字和分数
-- 每一场考试第1-10名和第11-20名的平均分数
-- 每一场考试超过平均分的人数
-- 每一场考试最高分数和最低分数的差值
-- 没有举办过科学科目考试的班级
-- 举办过任一科目超过一次的班级（不需要重复的记录）
