SELECT TOP(10)
	FirstName,
	LastName,
	CAST(AVG(Grade) AS DECIMAL(3,2)) AS [Grade]
FROM Students s
	JOIN StudentsExams se ON s.Id = se.StudentId
GROUP BY FirstName, LastName
ORDER BY [Grade] DESC, FirstName, LastName