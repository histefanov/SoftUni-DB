CREATE TRIGGER tr_RestrictBuyingItemsAccordingToLevel
ON UserGameItems INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO UserGameItems
		SELECT
			i.ItemId, i.UserGameId
		FROM inserted i
			JOIN Items it ON i.ItemId = it.Id
			JOIN UsersGames ug ON i.UserGameId = ug.Id
 	   	WHERE ug.[Level] >= it.MinLevel
END

UPDATE UsersGames
SET Cash += 50000
WHERE GameId = (SELECT Id FROM Games WHERE [Name] = 'Bali')
      AND UserId In 
		(SELECT Id FROM Users 
		 WHERE [Username] IN
			('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos'));

CREATE PROC usp_BuyItem(@ItemId INT, @Username VARCHAR(100))
AS
BEGIN
	DECLARE @GameId INT = (SELECT Id FROM Games WHERE [Name] = 'Bali');
	DECLARE @UserId INT = (SELECT Id FROM Users WHERE Username = @Username);
	DECLARE @ItemPrice MONEY = (SELECT Price FROM Items WHERE Id = @ItemId);
	
	DECLARE @UsersGameId INT = (SELECT Id 
							   FROM UsersGames 
							   WHERE UserId = @UserId AND GameId = @GameId);

	DECLARE @CashBalance MONEY = (SELECT Cash FROM UsersGames WHERE Id = @UsersGameId);


	DECLARE @ItemLevel INT = (SELECT MinLevel FROM Items WHERE Id = @ItemId);
	DECLARE @UserLevel INT = (SELECT [Level] FROM UsersGames WHERE Id = @UserId);
			

	IF @CashBalance >= @ItemPrice AND
	   @UserLevel >= @ItemLevel
	BEGIN
		INSERT INTO UserGameItems(ItemId, UserGameId)
			VALUES
			(@ItemId, @UsersGameId)

		UPDATE UsersGames
		SET Cash -= @ItemPrice
		WHERE Id = @UsersGameId
	END
END

DECLARE @CurrentId INT = 251 --501
DECLARE @LargestId INT = 299 --539
WHILE @CurrentId <= @LargestId
BEGIN
	EXEC dbo.usp_BuyItem @CurrentId, 'baleremuda';
	EXEC dbo.usp_BuyItem @CurrentId, 'loosenoise';
	EXEC dbo.usp_BuyItem @CurrentId, 'inguinalself';
	EXEC dbo.usp_BuyItem @CurrentId, 'buildingdeltoid';
	EXEC dbo.usp_BuyItem @CurrentId, 'monoxidecos';

	SET @CurrentId += 1;
END

SELECT 
	u.Username,
	g.[Name],
	ug.Cash,
	i.[Name] AS ItemName
FROM
	Games g
		JOIN UsersGames ug ON g.Id = ug.GameId
		JOIN Users u ON ug.UserId = u.Id
		JOIN UserGameItems ugi ON ug.Id = ugi.UserGameId
		JOIN Items i ON ugi.ItemId = i.Id
WHERE g.[Name] = 'Bali'
ORDER BY u.Username, i.[Name]