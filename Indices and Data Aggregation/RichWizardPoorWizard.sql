SELECT
	ABS(SUM(h.DepositAmount - g.DepositAmount)) AS [Difference]
FROM WizzardDeposits h
	JOIN WizzardDeposits g ON h.Id = g.Id + 1