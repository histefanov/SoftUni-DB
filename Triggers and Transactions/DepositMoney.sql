CREATE PROC usp_DepositMoney (@AccountId INT, @MoneyAmount MONEY)
AS
	BEGIN TRANSACTION
		IF @AccountId NOT IN (SELECT Id FROM ACCOUNTS)
			THROW 50001, 'Invalid account ID', 1;
		IF @MoneyAmount <= 0
			THROW 50002, 'Deposit amount cannot be negative or zero.', 2;

		UPDATE Accounts
		SET Balance += @MoneyAmount
		WHERE Id = @AccountId
	COMMIT
GO