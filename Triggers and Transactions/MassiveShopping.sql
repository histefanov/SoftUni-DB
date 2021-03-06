CREATE PROC usp_BuyItemsForStamat (@LowerLevel INT, @UpperLevel INT)
AS
BEGIN TRANSACTION
	DECLARE @UsersGameId INT = (SELECT ug.Id
								FROM UsersGames ug
									JOIN Users u ON ug.UserId = u.Id
									JOIN Games g ON ug.GameId = g.Id
								WHERE u.Username = 'Stamat' AND g.[Name] = 'Safflower');

	DECLARE @UserLevel INT = (SELECT [Level]
						      FROM UsersGames
							  WHERE Id = @UsersGameId);

	DECLARE @MaxItemLevel INT = (SELECT MAX(MinLevel)
								FROM Items
								WHERE MinLevel BETWEEN @LowerLevel AND @UpperLevel);

	DECLARE @UserCash MONEY = (SELECT Cash
							   FROM UsersGames ug
							   WHERE Id = @UsersGameId);

	DECLARE @TotalPrice MONEY = (SELECT SUM(Price)
								 FROM Items
								 WHERE MinLevel BETWEEN @LowerLevel AND @UpperLevel);

	IF @UserCash < @TotalPrice
		THROW 50001, 'Insufficient cash', 1;

	IF @UserLevel < @MaxItemLevel
		THROW 50002, 'User level is too low to buy these items.', 1;

	UPDATE UsersGames
	SET Cash -= @TotalPrice
	WHERE Id = @UsersGameId;

	INSERT INTO UserGameItems(ItemId, UserGameId)
		SELECT Id, @UsersGameId
		FROM Items
		WHERE MinLevel BETWEEN @LowerLevel AND @UpperLevel
COMMIT

EXEC dbo.usp_BuyItemsForStamat 11, 12
EXEC dbo.usp_BuyItemsForStamat 19, 21

SELECT
	i.[Name] AS [Item Name]
FROM Items i
	JOIN UserGameItems ugi ON i.Id = ugi.ItemId
	JOIN UsersGames ug ON ugi.UserGameId = ug.Id
	JOIN Users u ON ug.UserId = u.Id
	JOIN Games g ON ug.GameId = g.Id
WHERE u.Username = 'Stamat' AND g.[Name] = 'Safflower'