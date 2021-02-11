CREATE FUNCTION udf_CalculateTickets (@origin NVARCHAR(50), @destination NVARCHAR(50), @peopleCount INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	IF @peopleCount <= 0
		RETURN 'Invalid people count!';

	DECLARE @flightId INT = (SELECT Id
							 FROM Flights
							 WHERE @origin = Origin AND
								   @destination = Destination)

	IF @flightId IS NOT NULL
	BEGIN
		DECLARE @price DECIMAL(6,2) = (SELECT Price
									   FROM Tickets
						               WHERE FlightId = @flightId);
		RETURN CONCAT('Total price ', CAST((@peopleCount * @price) AS NVARCHAR(MAX)));
	END

	RETURN 'Invalid flight!'
END
