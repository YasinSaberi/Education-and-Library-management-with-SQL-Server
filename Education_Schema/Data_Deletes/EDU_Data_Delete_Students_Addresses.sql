USE DB_project;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    DELETE FROM Education.Userlink
    WHERE LinkedEntityType = N'Student';

    DELETE StudentAddressEntry
    FROM Education.Addresses AS StudentAddressEntry
    INNER JOIN Education.Students AS StudentData 
        ON StudentAddressEntry.AssociatedEntityType = N'Student' 
        AND StudentAddressEntry.AssociatedEntityID = StudentData.NationalIdentityNumber;

    DELETE FROM Education.Students;
    DBCC CHECKIDENT ('Education.Students', RESEED, 10000);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;