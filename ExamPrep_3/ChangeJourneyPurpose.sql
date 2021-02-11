CREATE PROC usp_ChangeJourneyPurpose(@JourneyId INT, @NewPurpose VARCHAR(11))
AS
BEGIN
	IF @JourneyId NOT IN (SELECT Id FROM Journeys)
		THROW 50001, 'The journey does not exist!', 1;

	IF @NewPurpose = (SELECT Purpose
					  FROM Journeys
					  WHERE @JourneyId = Id)
		THROW 50001, 'You cannot change the purpose!', 1;

	UPDATE Journeys
	SET Purpose = @NewPurpose
	WHERE @JourneyId = Id
END