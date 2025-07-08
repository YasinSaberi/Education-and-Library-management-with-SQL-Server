USE DB_project;
GO

DROP FUNCTION IF EXISTS Education.fn_IsValidNationalCode;
GO 

CREATE FUNCTION Education.fn_IsValidNationalCode(@IranianNationalCode NVARCHAR(10)) 
RETURNS BIT
AS
BEGIN
    -- Simplified validation: A national code is valid if it is exactly 10 digits and is entirely numeric.
    IF LEN(@IranianNationalCode) = 10 AND ISNUMERIC(@IranianNationalCode) = 1
    BEGIN
        RETURN 1; -- It meets the simplified criteria for validity
    END;

    RETURN 0; -- Otherwise, it is considered invalid
END;
GO