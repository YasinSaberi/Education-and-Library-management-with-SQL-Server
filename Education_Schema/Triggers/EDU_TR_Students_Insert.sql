USE DB_project;
GO

DROP TRIGGER IF EXISTS Education.trg_StudentAccountCreation;
GO

CREATE TRIGGER trg_StudentAccountCreation
ON Education.Students
AFTER INSERT
AS
BEGIN
    INSERT INTO Education.Userlink (LinkedEntityType, LinkedEntityNationalCode)
    SELECT 
        N'Student', 
        s.NationalIdentityNumber
    FROM inserted s;
END;