USE DB_project;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    DELETE AdminAddress
    FROM Education.Addresses AS AdminAddress
    INNER JOIN Education.Admins AS AdministrativeEntity 
        ON AdminAddress.AssociatedEntityType = N'Admin' 
        AND AdminAddress.AssociatedEntityID = AdministrativeEntity.NationalIdentifier;

    DELETE FROM Education.Userlink
    WHERE LinkedEntityType = N'Admin';

    DELETE FROM Education.Admins;
    DBCC CHECKIDENT ('Education.Admins', RESEED, 20000);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;