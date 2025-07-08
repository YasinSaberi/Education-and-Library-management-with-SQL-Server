USE DB_project;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @AdminOutput TABLE (AdministratorID INT, NationalID NVARCHAR(10));

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0010000000', N'Amir', N'Fallahi', N'Admin', '09121111111', N'amir.fallahi@alborzuni.ac.ir'); -- NEW: 0010000000 is valid

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0010000000', N'Iran', N'Tehran', N'Tehran', N'Shahid Fallahi St.', N'Rose Alley', N'1', N'1111111111', N'Main campus office');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0020000000', N'Narges', N'Pourmand', N'Admin', '09352222222', N'narges.pourmand@alborzuni.ac.ir'); -- NEW: 0020000000 is valid

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0020000000', N'Iran', N'Alborz', N'Karaj', N'Shahid Beheshti Blvd.', N'Golshan', N'17', N'2222222222', N'Satellite campus');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0030000000', N'Kaveh', N'Afshar', N'Staff', '09193333333', N'kaveh.afshar@alborzuni.ac.ir'); -- NEW: 0030000000 is valid

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0030000000', N'Iran', N'Isfahan', N'Isfahan', N'Chaharbagh Abbasi', N'Farhang', N'22', N'3333333333', N'Admissions office');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0040000000', N'Laleh', N'Saeedi', N'Admin', '09904444444', N'laleh.saeedi@alborzuni.ac.ir'); -- NEW: 0040000000 is valid

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0040000000', N'Iran', N'Razavi Khorasan', N'Mashhad', N'Daneshgah St.', N'Fajr', N'8', N'4444444444', N'Research department');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0050000000', N'Saman', N'Vatani', N'Staff', '09105555555', N'saman.vatani@alborzuni.ac.ir'); -- NEW: 0050000000 is valid

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0050000000', N'Iran', N'East Azerbaijan', N'Tabriz', N'El-Goli Park Blvd.', N'Sahel', N'30', N'5555555555', N'Student affairs');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0060000000', N'Parisa', N'Mozaffari', N'Admin', '09306666666', N'parisa.mozaffari@alborzuni.ac.ir'); -- NEW: 0060000000 is valid

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0060000000', N'Iran', N'Yazd', N'Yazd', N'Jomhouri Blvd.', N'Golzar', N'4', N'6666666666', N'IT services');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0070000000', N'Ramin', N'Ansari', N'Staff', '09127777777', N'ramin.ansari@alborzuni.ac.ir'); -- NEW: 0070000000 is valid

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0070000000', N'Iran', N'Kerman', N'Kerman', N'Azadi Blvd.', N'Narenj', N'18', N'7777777777', N'Facilities management');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0080000000', N'Shirin', N'Vafaei', N'Admin', '09228888888', N'shirin.vafaei@alborzuni.ac.ir'); -- NEW: 0080000000 is valid

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0080000000', N'Iran', N'Gilan', N'Rasht', N'Moallem Blvd.', N'Yas', N'9', N'8888888888', N'Rectorate office');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0090000000', N'Majid', N'Davoudi', N'Admin', '09139999999', N'majid.davoudi@alborzuni.ac.ir'); -- NEW: 0090000000 is valid

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0090000000', N'Iran', N'Ardebil', N'Ardebil', N'Imam Khomeini St.', N'Baharestan', N'25', N'9999999999', N'International affairs');

    DELETE FROM @AdminOutput;

    INSERT INTO Education.Admins (NationalIdentifier, GivenName, FamilyName, UserRole, ContactNumber, EmailAddress)
    OUTPUT inserted.AdministratorID, inserted.NationalIdentifier INTO @AdminOutput
    VALUES 
    (N'0100000000', N'Mina', N'Noori', N'Staff', '09391010101', N'mina.noori@alborzuni.ac.ir'); -- NEW: 0100000000 is valid

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Admin', N'0100000000', N'Iran', N'Fars', N'Shiraz', N'Afif-Abad St.', N'Delgosha', N'11', N'0101010101', N'Registrar office');

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF (XACT_STATE()) <> 0 
    BEGIN
        ROLLBACK TRANSACTION;
    END;
    THROW;
END CATCH;