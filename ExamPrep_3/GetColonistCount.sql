CREATE FUNCTION udf_GetColonistsCount (@planetName VARCHAR (30))
RETURNS INT
AS
BEGIN
	RETURN 
		(SELECT COUNT(*)
		 FROM TravelCards tc
			 JOIN Journeys j ON tc.JourneyId = j.Id
			 JOIN Spaceports s ON j.DestinationSpaceportId = s.Id
			 JOIN Planets p ON s.PlanetId = p.Id
		 WHERE p.[Name] = @planetName)
END

