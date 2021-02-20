CREATE PROC usp_AssignProject(@emloyeeId INT, @projectID INT)
AS
BEGIN
	BEGIN TRANSACTION
		DECLARE @employeeProjectsCount INT = (SELECT COUNT(*)
											  FROM EmployeesProjects
											  WHERE EmployeeID = @emloyeeId);

		IF @employeeProjectsCount > 3
			THROW 50001, 'The employee has too many projects!', 1;

		INSERT INTO EmployeesProjects(EmployeeID, ProjectID)
			VALUES
			(@emloyeeId, @projectID);
	COMMIT
END