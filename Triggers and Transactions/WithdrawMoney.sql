CREATE PROC usp_WithdrawMoney (@AccountId INT, @MoneyAmount MONEY)
AS
	BEGIN TRANSACTION
		IF @AccountId NOT IN (SELECT Id FROM Accounts)
			THROW 50003, 'Invalid account ID', 1;
		IF @MoneyAmount <= 0
			THROW 50004, 'Withdrawal amount cannot be negative or zero.', 1;
		IF @MoneyAmount > (SELECT Balance FROM Accounts WHERE Id = @AccountId)
			THROW 50005, 'Insufficient funds', 1;

		UPDATE Accounts
		SET Balance -= @MoneyAmount
		WHERE Id = @AccountId
	COMMIT
GO