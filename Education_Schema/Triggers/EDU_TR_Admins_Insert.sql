USE DB_project;
GO

DROP TRIGGER IF EXISTS Education.trg_AdminAccountCreation;
GO

CREATE TRIGGER trg_AdminAccountCreation
ON Education.Admins
AFTER INSERT
AS
BEGIN
    INSERT INTO Education.Userlink (LinkedEntityType, LinkedEntityNationalCode)
    SELECT 
        N'Admin', 
        i.NationalIdentifier
    FROM inserted i;
END;