SELECT 
	p.FirstName + ' ' + p.LastName AS [Full Name],
	pl.[Name] AS [Plane Name],
	f.Origin + ' - ' + f.Destination AS Trip,
	lt.[Type] AS [Luggage Type]
FROM Passengers p
	LEFT JOIN Tickets t ON p.Id = t.PassengerId
	LEFT JOIN Flights f ON t.FlightId = f.Id
	LEFT JOIN Planes pl ON f.PlaneId = pl.Id
	LEFT JOIN Luggages l ON t.LuggageId = l.Id
	LEFT JOIN LuggageTypes lt ON l.LuggageTypeId = lt.Id
WHERE t.PassengerId IS NOT NULL
ORDER BY [Full Name], [Plane Name], f.Origin, f.Destination, [Luggage Type]