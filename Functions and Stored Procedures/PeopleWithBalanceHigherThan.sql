CREATE PROC usp_GetHoldersWithBalanceHigherThan (@Threshold DECIMAL(18,4))
AS
	SELECT FirstName, LastName
	FROM AccountHolders ah
		JOIN Accounts a ON ah.Id = a.AccountHolderId
	GROUP BY FirstName, LastName
	HAVING SUM(Balance) > @Threshold
	ORDER BY FirstName, LastName