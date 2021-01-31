SELECT TOP(5)
	EmployeeID,
	FirstName,
	Salary,
	d.Name
FROM Employees e
	JOIN Departments d ON e.DepartmentID = d.DepartmentID
	WHERE Salary > 15000
	ORDER BY e.DepartmentID