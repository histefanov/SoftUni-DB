CREATE PROC usp_GetEmployeesSalaryAboveNumber (@Threshold DECIMAL(18,4))
AS
	SELECT FirstName, LastName
		FROM Employees
		WHERE Salary >= @Threshold