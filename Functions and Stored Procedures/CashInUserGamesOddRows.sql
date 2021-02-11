CREATE FUNCTION ufn_CashInUsersGames (@GameName VARCHAR(MAX))
RETURNS TABLE
AS
	RETURN
		SELECT SUM(Cash) AS SumCash
		FROM
			(SELECT 
				ROW_NUMBER() OVER (ORDER BY ug.Cash DESC) AS [Row Number],
				ug.Cash
			FROM Games g
				JOIN UsersGames ug ON g.Id = ug.GameId
			WHERE g.Name = @GameName) AS sqt
		WHERE sqt.[Row Number] % 2 = 1