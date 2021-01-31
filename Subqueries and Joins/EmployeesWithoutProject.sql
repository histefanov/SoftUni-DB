SELECT TOP(3)
	e.EmployeeID, e.FirstName
FROM Employees e
	WHERE e.EmployeeID NOT IN
		(
		SELECT ep.EmployeeID
		FROM EmployeesProjects ep
		)
	ORDER BY EmployeeID