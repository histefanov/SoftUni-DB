CREATE PROC usp_GetEmployeesFromTown (@TownName NVARCHAR(100))
AS
	SELECT FirstName, LastName
	FROM Employees e
		JOIN Addresses a ON e.AddressID = a.AddressID
		JOIN Towns t ON a.TownID = t.TownID
	WHERE t.[Name] = @TownName