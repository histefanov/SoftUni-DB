SELECT TOP(5) e.EmployeeId, e.JobTitle, a.AddressId, a.AddressText
FROM Employees e
	JOIN Addresses a ON e.AddressID = a.AddressID
	ORDER BY a.AddressID