USE DB_project;
GO

DROP PROCEDURE IF EXISTS Education.usp_RegisterInstructorWithAddress;
GO

CREATE PROCEDURE usp_RegisterInstructorWithAddress
    @InstructorNationalID NVARCHAR(10),
    @InstructorFirstName NVARCHAR(50),
    @InstructorLastName NVARCHAR(50),
    @InstructorFatherName NVARCHAR(50) = NULL,
    @InstructorBirthDate DATE,
    @InstructorGenderCode CHAR(1),
    @InstructorContactPhone VARCHAR(15) = NULL,
    @InstructorEmailAddress NVARCHAR(100) = NULL,
    @InstructorHireDate DATE,
    @InstructorDepartmentID INT,
    @InstructorAcademicRank NVARCHAR(50) = NULL,
    @InstructorEmploymentStatus NVARCHAR(20),

    @AddressCountry NVARCHAR(50),
    @AddressProvince NVARCHAR(50),
    @AddressCity NVARCHAR(50),
    @AddressStreetName NVARCHAR(100) = NULL,
    @AddressAlleyName NVARCHAR(100) = NULL,
    @AddressBuildingNumber NVARCHAR(10) = NULL,
    @AddressPostalCode CHAR(10) = NULL,
    @AddressAdditionalDetails NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Education.Instructors (
            NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode,
            ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus
        )
        VALUES (
            @InstructorNationalID, @InstructorFirstName, @InstructorLastName, @InstructorFatherName, @InstructorBirthDate, @InstructorGenderCode,
            @InstructorContactPhone, @InstructorEmailAddress, @InstructorHireDate, @InstructorDepartmentID, @InstructorAcademicRank, @InstructorEmploymentStatus
        );

        INSERT INTO Education.Addresses (
            AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley,
            BuildingNumber, PostalCode, AdditionalDetails
        )
        VALUES (
            'Instructor', @InstructorNationalID, @AddressCountry, @AddressProvince, @AddressCity, @AddressStreetName, @AddressAlleyName,
            @AddressBuildingNumber, @AddressPostalCode, @AddressAdditionalDetails
        );

        INSERT INTO Education.EventLogs (
            EventType,
            AffectedTableName,
            AffectedRecordID,
            EventDetails
        )
        VALUES (
            'INSERT',
            'Education.Instructors',
            CAST(@InstructorNationalID AS INT),
            N'Instructor with name ' + @InstructorFirstName + N' ' + @InstructorLastName + N' has been registered.'
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO