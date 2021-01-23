SELECT Peaks.PeakName, Rivers.RiverName,
	   LOWER(CONCAT(Peaks.PeakName, RIGHT(Rivers.RiverName, LEN(Rivers.RiverName) - 1))) AS Mix
	FROM Peaks
	JOIN Rivers ON RIGHT(Peaks.PeakName, 1) = LEFT(Rivers.RiverName, 1)
	ORDER BY Mix