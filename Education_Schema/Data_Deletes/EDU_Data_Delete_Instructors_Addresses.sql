USE DB_project;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    DELETE FROM Education.Userlink
    WHERE LinkedEntityType = N'Instructor';

    DELETE InstructorAddressEntry
    FROM Education.Addresses AS InstructorAddressEntry
    INNER JOIN Education.Instructors AS InstructorsData 
        ON InstructorAddressEntry.AssociatedEntityType = N'Instructor' 
        AND InstructorAddressEntry.AssociatedEntityID = InstructorsData.NationalIdentityCode;

    DELETE FROM Education.Instructors;
    DBCC CHECKIDENT ('Education.Instructors', RESEED, 30000);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;