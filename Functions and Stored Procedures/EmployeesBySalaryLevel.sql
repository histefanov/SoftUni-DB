CREATE OR ALTER PROC usp_EmployeesBySalaryLevel (@Level VARCHAR(10))
AS
	SELECT FirstName, LastName
	FROM Employees
	WHERE [dbo].[ufn_GetSalaryLevel] (Salary) = @Level