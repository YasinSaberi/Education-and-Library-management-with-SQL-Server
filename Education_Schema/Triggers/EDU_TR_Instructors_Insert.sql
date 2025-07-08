USE DB_project;
GO

DROP TRIGGER IF EXISTS Education.trg_InstructorAccountCreation;
GO

CREATE TRIGGER trg_InstructorAccountCreation
ON Education.Instructors
AFTER INSERT
AS
BEGIN
    INSERT INTO Education.Userlink (LinkedEntityType, LinkedEntityNationalCode)
    SELECT 
        N'Instructor', 
        ins.NationalIdentityCode
    FROM inserted ins;
END;