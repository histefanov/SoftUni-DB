CREATE PROC usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount MONEY)
AS
	BEGIN TRANSACTION
		IF @Amount <= 0
			THROW 50005, 'Transfer amount cannot be negative or zero.', 1;
		IF @Amount > (SELECT Balance FROM Accounts WHERE Id = @SenderId)
			THROW 50006, 'Insufficient funds', 1;
		IF @SenderId NOT IN (SELECT Id FROM Accounts)
			THROW 50007, 'Sender account ID is invalid', 1;
		IF @ReceiverId NOT IN (SELECT Id FROM Accounts)
			THROW 50008, 'Receiver account ID is invalid', 1;
		
		UPDATE Accounts
		SET Balance -= @Amount
		WHERE Id = @SenderId

		UPDATE Accounts
		SET Balance += @Amount
		WHERE Id = @ReceiverId
	COMMIT
GO
	