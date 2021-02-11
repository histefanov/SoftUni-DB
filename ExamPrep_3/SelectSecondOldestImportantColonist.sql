SELECT *
FROM
	(SELECT
		tc.JobDuringJourney,
		c.FirstName + ' ' + c.LastName AS [FullName],
		DENSE_RANK() OVER (PARTITION BY tc.JobDuringJourney ORDER BY c.Birthdate) AS [Rank]
	FROM Colonists c
		JOIN TravelCards tc ON c.Id = tc.ColonistId) AS sqt
WHERE [Rank] = 2
	