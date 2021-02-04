SELECT
	DISTINCT DepartmentID,
	Salary
FROM
	(SELECT
		DepartmentID,
		Salary,
		DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS [Ranked]
	FROM Employees) AS sqt
WHERE sqt.Ranked = 3