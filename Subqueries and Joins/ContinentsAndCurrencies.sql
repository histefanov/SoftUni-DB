SELECT cu.ContinentCode, cu.CurrencyCode, cu.CurrencyUsage
FROM
	(SELECT ContinentCode, CurrencyCode, COUNT(CurrencyCode) AS CurrencyUsage,
	DENSE_RANK() OVER(PARTITION BY ContinentCode ORDER BY COUNT(CurrencyCode) DESC) AS [Rank]
	FROM Countries
	GROUP BY ContinentCode, CurrencyCode) AS cu
WHERE CurrencyUsage > 1 AND [Rank] = 1
ORDER BY cu.ContinentCode