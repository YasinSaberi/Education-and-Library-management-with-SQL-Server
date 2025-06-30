USE DB_project;
GO

DROP PROCEDURE IF EXISTS Education.usp_RegisterAdminWithAddress;
GO

CREATE PROCEDURE usp_RegisterAdminWithAddress
    @AdminNationalID NVARCHAR(10),
    @AdminFirstName NVARCHAR(50),
    @AdminLastName NVARCHAR(50),
    @AdminRole NVARCHAR(30),
    @AdminPhone NVARCHAR(20),
    @AdminEmail NVARCHAR(100),

    @AddressCountry NVARCHAR(50),
    @AddressProvince NVARCHAR(50),
    @AddressCity NVARCHAR(50),
    @AddressStreet NVARCHAR(100),
    @AddressAlley NVARCHAR(100),
    @AddressBuildingNumber NVARCHAR(10),
    @AddressPostalCode NVARCHAR(10),
    @AddressDetails NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Education.Admins (
            NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress
        )
        VALUES (
            @AdminNationalID, @AdminFirstName, @AdminLastName, @AdminRole, @AdminPhone, @AdminEmail
        );

        DECLARE @NewAdministratorRecordID INT = SCOPE_IDENTITY();

        INSERT INTO Education.Addresses (
            AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley,
            BuildingNumber, PostalCode, AdditionalDetails
        )
        VALUES (
            'Admin', @AdminNationalID, @AddressCountry, @AddressProvince, @AddressCity, @AddressStreet, @AddressAlley,
            @AddressBuildingNumber, @AddressPostalCode, @AddressDetails
        );

        INSERT INTO Education.EventLogs (
            EventType,
            AffectedTableName,
            AffectedRecordID,
            EventDetails
        )
        VALUES (
            'INSERT',
            'Education.Admins',
            CAST(@AdminNationalID AS INT),
            N'Administrator with name ' + @AdminFirstName + N' ' + @AdminLastName + N' has been registered.'
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO