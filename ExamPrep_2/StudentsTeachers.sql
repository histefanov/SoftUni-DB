SELECT
	FirstName,
	LastName,
	Count(*) AS TeachersCount
FROM Students s
	JOIN StudentsTeachers st ON s.Id = st.StudentId
GROUP BY FirstName, LastName