SELECT 
	SUBSTRING(Email, CHARINDEX('@', Email, 0) + 1, LEN(Email) - CHARINDEX('@', Email, 0)) AS [Email Provider],
	COUNT(*) AS [Number Of Users]
FROM USERS
GROUP BY SUBSTRING(Email, CHARINDEX('@', Email, 0) + 1, LEN(Email) - CHARINDEX('@', Email, 0))
ORDER BY [Number Of Users] DESC, [Email Provider]