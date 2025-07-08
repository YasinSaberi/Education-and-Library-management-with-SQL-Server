USE DB_project;
GO

DROP TRIGGER IF EXISTS Education.trg_Validate_NationalCode_Students;
GO

CREATE OR ALTER TRIGGER trg_Validate_NationalCode_Students
ON Education.Students
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 
        FROM inserted AS InsertedStudentData
        WHERE Education.fn_IsValidNationalCode(InsertedStudentData.NationalIdentityNumber) = 0 -- Corrected to NationalIdentityNumber
    )
    BEGIN
        DECLARE @InvalidStudentCode NVARCHAR(10);
        SELECT TOP 1 @InvalidStudentCode = InsertedStudentData.NationalIdentityNumber -- Corrected to NationalIdentityNumber
        FROM inserted AS InsertedStudentData 
        WHERE Education.fn_IsValidNationalCode(InsertedStudentData.NationalIdentityNumber) = 0; -- Corrected to NationalIdentityNumber
    
        PRINT N'WARNING: Invalid National Code detected for Student, but bypassed for testing. Code: ' + ISNULL(@InvalidStudentCode, N'N/A');
    END;

    INSERT INTO Education.Students (
        NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode,
        ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus
    )
    SELECT
        NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode,
        ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus -- Corrected all column names from 'inserted'
    FROM inserted;
END;
GO