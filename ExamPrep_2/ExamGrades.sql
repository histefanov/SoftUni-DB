CREATE FUNCTION udf_ExamGradesToUpdate(@studentId INT, @grade DECIMAL(3,2))
RETURNS NVARCHAR(200)
AS
BEGIN
	IF @studentId NOT IN (SELECT Id
						  FROM Students)
		RETURN 'The student with provided id does not exist in the school!';

	IF @grade > 6
		RETURN 'Grade cannot be above 6.00!';

	DECLARE @count INT = (SELECT COUNT(*)
						  FROM StudentsSubjects
						  WHERE StudentId = @studentId AND
								Grade > @grade AND
								Grade < @grade + 0.5);

	DECLARE @studentName NVARCHAR(30) = (SELECT FirstName
										 FROM Students
										 WHERE Id = @studentId);

	DECLARE @result NVARCHAR(200) = CONCAT('You have to update ', @count, ' grades for the student ', @studentName);
	RETURN @result;
END
