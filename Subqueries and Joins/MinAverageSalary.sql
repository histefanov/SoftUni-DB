SELECT 
	MIN(a.AvgSalary) AS MinAverageSalary
	FROM
	(
		SELECT Avg(Salary) AS AvgSalary
		FROM Employees
		GROUP BY DepartmentID
	) AS a