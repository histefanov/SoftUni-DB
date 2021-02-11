CREATE FUNCTION ufn_IsWordComprised(@SetOfLetters NVARCHAR(MAX), @Word NVARCHAR(MAX))
RETURNS BIT
AS
BEGIN
	DECLARE @Index TINYINT = 1;
	DECLARE @Result BIT = 1;

	WHILE (@Index <= LEN(@Word))
	BEGIN
		DECLARE @CurrentLetter NVARCHAR(1) = SUBSTRING(@Word, @Index, 1);

		IF CHARINDEX(@CurrentLetter, @SetOfLetters, 1) = 0
		BEGIN
			SET @Result = 0;
			BREAK;
		END

		SET @Index += 1;
	END

	RETURN @Result;
END

SELECT dbo.ufn_IsWordComprised('oistmiahf', 'xhoistf')