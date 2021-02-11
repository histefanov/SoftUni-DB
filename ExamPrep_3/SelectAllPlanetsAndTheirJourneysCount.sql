SELECT
	p.[Name],
	COUNT(*) AS JourneysCount
FROM Journeys j
	JOIN Spaceports s ON j.DestinationSpaceportId = s.Id
	JOIN Planets p ON s.PlanetId = p.Id
GROUP BY p.[Name]
ORDER BY JourneysCount DESC, p.[Name]
