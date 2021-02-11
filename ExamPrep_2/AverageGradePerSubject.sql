SELECT sqt.[Name], sqt.AverageGrade
FROM
	(SELECT
		s.Id,
		s.[Name],
		AVG(ss.Grade) AS AverageGrade
	FROM Subjects s
		JOIN StudentsSubjects ss ON s.Id = ss.SubjectId
	GROUP BY s.Id, s.[Name]) AS sqt
ORDER BY sqt.Id