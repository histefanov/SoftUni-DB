SELECT 
	SUM(d.[Difference])
FROM
	(SELECT
		h.FirstName AS [Host Wizard],
		h.DepositAmount AS [Host Wizard Deposit],
		g.FirstName AS [Guest Wizard],
		g.DepositAmount AS [Guest Wizard Deposit],
		h.DepositAmount - g.DepositAmount AS [Difference]
	FROM WizzardDeposits h
		JOIN WizzardDeposits g ON g.Id = h.Id + 1) AS d