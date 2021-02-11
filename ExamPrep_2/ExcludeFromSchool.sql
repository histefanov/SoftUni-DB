CREATE PROC usp_ExcludeFromSchool(@StudentId INT)
AS
	IF @StudentId NOT IN (SELECT Id FROM Students)
		THROW 50001, 'This school has no student with the provided id!', 1;

	DELETE FROM StudentsExams
	WHERE @StudentId = StudentId;

	DELETE FROM StudentsSubjects
	WHERE @StudentId = StudentId;

	DELETE FROM StudentsTeachers
	WHERE @StudentId = StudentId;

	DELETE FROM Students
	WHERE @StudentId = Id;