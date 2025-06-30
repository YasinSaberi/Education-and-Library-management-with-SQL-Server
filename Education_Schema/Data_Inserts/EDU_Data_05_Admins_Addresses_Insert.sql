USE DB_project;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @AdminOutput TABLE (AdministratorID INT, NationalID NVARCHAR(10));

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0012345678', N'Amir', N'Fallahi', N'Admin', '09123456789', N'amir.fallahi@university.ac.ir');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0012345678', N'Iran', N'Tehran', N'Tehran', N'Enghelab St.', N'Danesh Alley', N'5', N'1234567890', N'Main campus office');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0023456789', N'Narges', N'Pourmand', N'Admin', '09359876543', N'narges.pourmand@university.ac.ir');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0023456789', N'Iran', N'Alborz', N'Karaj', N'Shahid Beheshti Blvd.', N'Golshan', N'17', N'2345678901', N'Satellite campus');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0034567890', N'Kaveh', N'Afshar', N'Staff', '09191112233', N'kaveh.afshar@university.ac.ir');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0034567890', N'Iran', N'Isfahan', N'Isfahan', N'Chaharbagh Abbasi', N'Farhang', N'22', N'3456789012', N'Admissions office');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0045678901', N'Laleh', N'Saeedi', N'Admin', '09903334455', N'laleh.saeedi@university.ac.ir');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0045678901', N'Iran', N'Razavi Khorasan', N'Mashhad', N'Daneshgah St.', N'Fajr', N'8', N'4567890123', N'Research department');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0056789012', N'Saman', N'Vatani', N'Staff', '09105556677', N'saman.vatani@university.ac.ir');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0056789012', N'Iran', N'East Azerbaijan', N'Tabriz', N'El-Goli Park Blvd.', N'Sahel', N'30', N'5678901234', N'Student affairs');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0067890123', N'Parisa', N'Mozaffari', N'Admin', '09307778899', N'parisa.mozaffari@university.ac.ir');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0067890123', N'Iran', N'Yazd', N'Yazd', N'Jomhouri Blvd.', N'Golzar', N'4', N'6789012345', N'IT services');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0078901234', N'Ramin', N'Ansari', N'Staff', '09121002003', N'ramin.ansari@university.ac.ir');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0078901234', N'Iran', N'Kerman', N'Kerman', N'Azadi Blvd.', N'Narenj', N'18', N'7890123456', N'Facilities management');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0089012345', N'Shirin', N'Vafaei', N'Admin', '09224005006', N'shirin.vafaei@university.ac.ir');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0089012345', N'Iran', N'Gilan', N'Rasht', N'Moallem Blvd.', N'Yas', N'9', N'8901234567', N'Rectorate office');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0090123456', N'Majid', N'Davoudi', N'Admin', '09136007008', N'majid.davoudi@university.ac.ir');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0090123456', N'Iran', N'Ardebil', N'Ardebil', N'Imam Khomeini St.', N'Baharestan', N'25', N'9012345678', N'International affairs');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0101234567', N'Mina', N'Noori', N'Staff', '09398009001', N'mina.noori@university.ac.ir');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0101234567', N'Iran', N'Fars', N'Shiraz', N'Afif-Abad St.', N'Delgosha', N'11', N'0123456789', N'Registrar office');

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;