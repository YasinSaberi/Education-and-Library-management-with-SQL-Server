USE DB_project;
GO

DROP FUNCTION IF EXISTS Education.fn_IsValidNationalCode;

CREATE OR ALTER FUNCTION Education.fn_IsValidNationalCode(@IranianNationalCode CHAR(10))
RETURNS BIT
AS
BEGIN
    DECLARE @ValidationResult BIT = 0;

    IF LEN(@IranianNationalCode) = 10
    BEGIN
        DECLARE @CalculatedSum INT =
            CAST(SUBSTRING(@IranianNationalCode,1,1) AS INT) * 10 +
            CAST(SUBSTRING(@IranianNationalCode,2,1) AS INT) * 9 +
            CAST(SUBSTRING(@IranianNationalCode,3,1) AS INT) * 8 +
            CAST(SUBSTRING(@IranianNationalCode,4,1) AS INT) * 7 +
            CAST(SUBSTRING(@IranianNationalCode,5,1) AS INT) * 6 +
            CAST(SUBSTRING(@IranianNationalCode,6,1) AS INT) * 5 +
            CAST(SUBSTRING(@IranianNationalCode,7,1) AS INT) * 4 +
            CAST(SUBSTRING(@IranianNationalCode,8,1) AS INT) * 3 +
            CAST(SUBSTRING(@IranianNationalCode,9,1) AS INT) * 2;

        DECLARE @ModulusResult INT = @CalculatedSum % 11;
        DECLARE @LastDigit INT = CAST(SUBSTRING(@IranianNationalCode,10,1) AS INT);

        IF @LastDigit BETWEEN 0 AND 9
        BEGIN
            IF (@ModulusResult < 2 AND @LastDigit = @ModulusResult) OR
               (@ModulusResult >= 2 AND @LastDigit = (11 - @ModulusResult))
            BEGIN
                SET @ValidationResult = 1;
            END;
        END;
    END;

    RETURN @ValidationResult;
END;
GO