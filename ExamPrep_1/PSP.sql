SELECT 
	p.[Name],
	Seats,
	COUNT(t.Id) AS [Passengers Count]
FROM Planes p
	LEFT JOIN Flights f ON p.Id = f.PlaneId
	LEFT JOIN Tickets t ON f.Id = t.FlightId
GROUP BY p.[Name], Seats
ORDER BY [Passengers Count] DESC, p.[Name], Seats