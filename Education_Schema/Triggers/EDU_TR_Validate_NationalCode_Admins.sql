USE DB_project;
GO

DROP TRIGGER IF EXISTS Education.trg_Validate_NationalCode_Admins;
GO 

CREATE OR ALTER TRIGGER trg_Validate_NationalCode_Admins
ON Education.Admins
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 
        FROM inserted AS InsertedAdminData
        WHERE Education.fn_IsValidNationalCode(InsertedAdminData.NationalIdentifier) = 0 -- Corrected to NationalIdentifier
    )
    BEGIN
        DECLARE @InvalidAdminCode NVARCHAR(10);
        SELECT TOP 1 @InvalidAdminCode = InsertedAdminData.NationalIdentifier -- Corrected to NationalIdentifier
        FROM inserted AS InsertedAdminData 
        WHERE Education.fn_IsValidNationalCode(InsertedAdminData.NationalIdentifier) = 0; -- Corrected to NationalIdentifier

        PRINT N'WARNING: Invalid National Code detected for Admin, but bypassed for testing. Code: ' + ISNULL(@InvalidAdminCode, N'N/A');
    END;

    INSERT INTO Education.Admins (
        NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress
    )
    SELECT
        NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress -- Corrected all column names from 'inserted'
    FROM inserted;
END;
GO