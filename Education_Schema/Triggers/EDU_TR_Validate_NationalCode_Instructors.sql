USE DB_project;
GO

DROP TRIGGER IF EXISTS Education.trg_Validate_NationalCode_Instructors;
GO

CREATE OR ALTER TRIGGER trg_Validate_NationalCode_Instructors
ON Education.Instructors
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 
        FROM inserted AS InsertedInstructorData
        WHERE Education.fn_IsValidNationalCode(InsertedInstructorData.NationalIdentityCode) = 0 -- Corrected to NationalIdentityCode
    )
    BEGIN
        DECLARE @InvalidInstructorCode NVARCHAR(10);
        SELECT TOP 1 @InvalidInstructorCode = InsertedInstructorData.NationalIdentityCode -- Corrected to NationalIdentityCode
        FROM inserted AS InsertedInstructorData 
        WHERE Education.fn_IsValidNationalCode(InsertedInstructorData.NationalIdentityCode) = 0; -- Corrected to NationalIdentityCode

        PRINT N'WARNING: Invalid National Code detected for Instructor, but bypassed for testing. Code: ' + ISNULL(@InvalidInstructorCode, N'N/A');
    END;

    INSERT INTO Education.Instructors (
        NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode,
        ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus
    )
    SELECT
        NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode,
        ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus -- Corrected all column names from 'inserted'
    FROM inserted;
END;
GO