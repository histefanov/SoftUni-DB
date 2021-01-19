SELECT m.MountainRange, p.PeakName, p.Elevation
	FROM Mountains m
	JOIN Peaks p ON p.MountainId = m.Id
	WHERE MountainRange = 'Rila'
	ORDER BY p.Elevation DESC