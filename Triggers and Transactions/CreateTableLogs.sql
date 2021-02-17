CREATE TRIGGER Logger
ON Accounts AFTER UPDATE
AS
BEGIN
	INSERT INTO Logs (AccountId, OldSum, NewSum)
		SELECT 
			d.Id AS AccountId,
			d.Balance,
			i.Balance
		FROM deleted d
			JOIN inserted i ON d.Id = i.Id
		WHERE i.Balance != d.Balance
END