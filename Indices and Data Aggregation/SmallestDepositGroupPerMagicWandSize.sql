SELECT TOP(2) 
	d.DepositGroup 
FROM 
	(SELECT
		DepositGroup, AVG(MagicWandSize) AS Size
	FROM WizzardDeposits
	GROUP BY DepositGroup) AS d
ORDER BY d.Size