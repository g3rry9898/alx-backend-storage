-- Function to safely divide two integers
-- Returns 0 if the divisor is 0
CREATE FUNCTION SafeDiv (
    @a INT,
    @b INT
)
RETURNS FLOAT
AS
BEGIN
    IF @b = 0
        RETURN 0
    ELSE
        RETURN CAST(@a AS FLOAT) / @b
END;

