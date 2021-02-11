SELECT
	c.Id,
	CONCAT(c.FirstName, ' ', c.LastName) AS full_name
FROM Colonists c
	JOIN TravelCards tc ON c.Id = tc.ColonistId
WHERE tc.JobDuringJourney = 'Pilot'
ORDER BY c.Id