USE DB_project;
GO

DROP PROCEDURE IF EXISTS Education.usp_RegisterStudentWithAddress;
GO

CREATE PROCEDURE Education.usp_RegisterStudentWithAddress
    @StudentNationalID NVARCHAR(10),
    @StudentFirstName NVARCHAR(50),
    @StudentLastName NVARCHAR(50),
    @StudentFatherName NVARCHAR(50),
    @StudentBirthDate DATE,
    @StudentGenderCode CHAR(1),
    @StudentContactPhone NVARCHAR(20),
    @StudentEmailAddress NVARCHAR(100),
    @StudentEntryAcademicYear INT,
    @StudentDepartmentID INT,
    @StudentMajorID INT,
    @StudentEnrollmentStatus NVARCHAR(20),

    @AddressCountryName NVARCHAR(50),
    @AddressProvinceName NVARCHAR(50),
    @AddressCityName NVARCHAR(50),
    @AddressStreetName NVARCHAR(100),
    @AddressAlleyName NVARCHAR(100),
    @AddressBuildingNumber NVARCHAR(10),
    @AddressPostalCode NVARCHAR(10),
    @AddressAdditionalInfo NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Education.Students (
            NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode,
            ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus
        )
        VALUES (
            @StudentNationalID, @StudentFirstName, @StudentLastName, @StudentFatherName, @StudentBirthDate, @StudentGenderCode,
            @StudentContactPhone, @StudentEmailAddress, @StudentEntryAcademicYear, @StudentDepartmentID, @StudentMajorID, @StudentEnrollmentStatus
        );

        INSERT INTO Education.Addresses (
            AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley,
            BuildingNumber, PostalCode, AdditionalDetails
        )
        VALUES (
            N'Student', @StudentNationalID, @AddressCountryName, @AddressProvinceName, @AddressCityName, @AddressStreetName, @AddressAlleyName,
            @AddressBuildingNumber, @AddressPostalCode, @AddressAdditionalInfo
        );

        INSERT INTO Education.EventLogs (
            EventType,
            AffectedTableName,
            AffectedRecordID,
            EventDetails
        )
        VALUES (
            'INSERT',
            'Education.Students',
            CAST(@StudentNationalID AS INT),
            N'Student with name ' + @StudentFirstName + N' ' + @StudentLastName + N' has been registered.'
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF (XACT_STATE()) <> 0 
        BEGIN
            ROLLBACK TRANSACTION;
        END;
        THROW;
    END CATCH
END;
GO