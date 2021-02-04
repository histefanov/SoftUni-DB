SELECT TOP(10)
	FirstName,
	LastName,
	e.DepartmentID
FROM Employees e
	JOIN (SELECT DepartmentID, AVG(Salary) AS AvgSalary
		  FROM Employees
		  GROUP BY DepartmentID) AS sqt ON e.DepartmentID = sqt.DepartmentID
WHERE e.Salary > sqt.AvgSalary
ORDER BY DepartmentID