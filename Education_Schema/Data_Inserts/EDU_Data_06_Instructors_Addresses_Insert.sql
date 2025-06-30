USE DB_project;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @InstructorDataOutput TABLE (NewInstructorID INT, NewNationalCode NVARCHAR(10));

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0010000001', N'Reza', N'Fallah', N'Saeed', '1975-04-12', 'M', '09121111111', N'reza.fallah@alborzuni.ir', '2001-09-01', 1, N'Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0010000001', N'Iran', N'Tehran', N'Tehran', N'Shahid Fallahi St.', N'Rose Alley', N'1', N'1111111111', N'Faculty Office, 1st Floor');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0020000002', N'Mina', N'Moradi', N'Hassan', '1980-08-25', 'F', '09352222222', N'mina.moradi@alborzuni.ir', '2008-02-10', 1, N'Associate Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0020000002', N'Iran', N'Tehran', N'Tehran', N'Saadat Abad Blvd.', N'Orchid Alley', N'2', N'1111111112', N'Research Lab Office');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0030000003', N'Kamran', N'Mohammadi', N'Jafar', '1972-11-03', 'M', '09123333333', N'kamran.mohammadi@alborzuni.ir', '1999-05-15', 2, N'Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0030000003', N'Iran', N'Alborz', N'Karaj', N'Azadi Square', N'North Alley', N'3', N'2222222223', N'Department Head Office');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0040000004', N'Shirin', N'Nikzad', N'Amir', '1988-01-19', 'F', '09304444444', N'shirin.nikzad@alborzuni.ir', '2015-11-20', 2, N'Assistant Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0040000004', N'Iran', N'Alborz', N'Karaj', N'Gohardasht Blvd.', N'South Alley', N'4', N'2222222224', N'New Faculty Office');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0050000005', N'Farid', N'Davoodi', N'Kazem', '1978-06-01', 'M', '09195555555', N'farid.davoodi@alborzuni.ir', '2005-03-01', 3, N'Lecturer', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0050000005', N'Iran', N'Isfahan', N'Isfahan', N'Imam Sq.', N'East Alley', N'5', N'3333333335', N'Workshop Coordinator Office');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0060000006', N'Azadeh', N'Asadi', N'Amin', '1983-09-10', 'F', '09106666666', N'azadeh.asadi@alborzuni.ir', '2010-07-01', 3, N'Assistant Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0060000006', N'Iran', N'Isfahan', N'Isfahan', N'Naghsh-e Jahan St.', N'West Alley', N'6', N'3333333336', N'Materials Lab Office');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0070000007', N'Alireza', N'Saeedi', N'Reza', '1970-02-28', 'M', '09127777777', N'alireza.saeedi@alborzuni.ir', '1998-10-01', 4, N'Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0070000007', N'Iran', N'Razavi Khorasan', N'Mashhad', N'Kohsangi St.', N'Garden Alley', N'7', N'4444444447', N'Architectural Studio Office');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0080000008', N'Parvaneh', N'Afshar', N'Naser', '1985-05-05', 'F', '09228888888', N'parvaneh.afshar@alborzuni.ir', '2012-04-01', 4, N'Lecturer', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0080000008', N'Iran', N'Razavi Khorasan', N'Mashhad', N'Vakil Abad Blvd.', N'Spring Alley', N'8', N'4444444448', N'Urban Planning Desk');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0090000009', N'Behrouz', N'Ansari', N'Javad', '1977-03-15', 'M', '09139999999', N'behrouz.ansari@alborzuni.ir', '2004-06-01', 5, N'Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0090000009', N'Iran', N'East Azerbaijan', N'Tabriz', N'El-Goli St.', N'Fall Alley', N'9', N'5555555559', N'Chemical Eng. Labs');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0100000010', N'Niloufar', N'Hassanpour', N'Shahram', '1982-12-30', 'F', '09141001000', N'niloufar.hassanpour@alborzuni.ir', '2010-09-01', 5, N'Associate Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0100000010', N'Iran', N'East Azerbaijan', N'Tabriz', N'Valiasr Blvd.', N'Winter Alley', N'10', N'5555555560', N'Process Design Unit');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0110000011', N'Peyman', N'Abbasi', N'Farhad', '1971-04-05', 'M', '09121111112', N'peyman.abbasi@alborzuni.ir', '1999-08-01', 6, N'Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0110000011', N'Iran', N'Yazd', N'Yazd', N'Imam Khomeini St.', N'New Alley', N'11', N'6666666661', N'Mathematics Faculty Building');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0120000012', N'Ghazal', N'Jafari', N'Sina', '1986-11-18', 'F', '09392222223', N'ghazal.jafari@alborzuni.ir', '2013-05-01', 6, N'Assistant Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0120000012', N'Iran', N'Yazd', N'Yazd', N'Ferdowsi Blvd.', N'Old Alley', N'12', N'6666666662', N'Statistics Department');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0130000013', N'Hossein', N'Akbari', N'Vahid', '1974-07-07', 'M', '09123333334', N'hossein.akbari@alborzuni.ir', '2002-01-10', 7, N'Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0130000013', N'Iran', N'Kerman', N'Kerman', N'22 Bahman St.', N'Central Alley', N'13', N'7777777773', N'Physics Department Building');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0140000014', N'Sahar', N'Jamali', N'Navid', '1981-02-20', 'F', '09304444445', N'sahar.jamali@alborzuni.ir', '2009-07-01', 7, N'Lecturer', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0140000014', N'Iran', N'Kerman', N'Kerman', N'Pasdaran Blvd.', N'East Alley', N'14', N'7777777774', N'Quantum Physics Lab');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0150000015', N'Nima', N'Mirzaei', N'Bijan', '1979-09-09', 'M', '09195555556', N'nima.mirzaei@alborzuni.ir', '2006-03-01', 8, N'Associate Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0150000015', N'Iran', N'Gilan', N'Rasht', N'Rasht-Anzali Rd.', N'North Alley', N'15', N'8888888885', N'Organic Chemistry Lab');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0160000016', N'Yasaman', N'Sami', N'Parviz', '1984-04-04', 'F', '09106666667', N'yasaman.sami@alborzuni.ir', '2011-11-11', 8, N'Assistant Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0160000016', N'Iran', N'Gilan', N'Rasht', N'Lahijan Rd.', N'South Alley', N'16', N'8888888886', N'Biochemistry Research Unit');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0170000017', N'Siamak', N'Valizadeh', N'Farzad', '1976-10-20', 'M', '09127777778', N'siamak.valizadeh@alborzuni.ir', '2003-01-01', 9, N'Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0170000017', N'Iran', N'Fars', N'Shiraz', N'Afifabad St.', N'Spring Alley', N'17', N'9999999997', N'Molecular Biology Lab');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0180000018', N'Shabnam', N'Jahangiri', N'Bijan', '1987-07-07', 'F', '09398888889', N'shabnam.jahangiri@alborzuni.ir', '2014-02-14', 9, N'Assistant Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0180000018', N'Iran', N'Fars', N'Shiraz', N'Chamran Blvd.', N'Summer Alley', N'18', N'9999999998', N'Genetics Research Center');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0190000019', N'Arash', N'Dehghan', N'Farid', '1970-01-01', 'M', '09129999990', N'arash.dehghan@alborzuni.ir', '1998-09-01', 10, N'Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0190000019', N'Iran', N'Kerman', N'Kerman', N'Azadi Square', N'Fall Alley', N'19', N'1010101019', N'Literature Dept. Office');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0200000020', N'Sogol', N'Ahmadi', N'Saeed', '1986-06-06', 'F', '09351001001', N'sogol.ahmadi@alborzuni.ir', '2013-03-03', 10, N'Assistant Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0200000020', N'Iran', N'Kerman', N'Kerman', N'Jomhouri St.', N'Winter Alley', N'20', N'1010101020', N'Poetry Studies Center');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0210000021', N'Babak', N'Ghorbani', N'Fardin', '1973-11-20', 'M', '09121111113', N'babak.ghorbani@alborzuni.ir', '2000-04-01', 11, N'Associate Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0210000021', N'Iran', N'Yazd', N'Yazd', N'Valiasr St.', N'Freedom Alley', N'21', N'1111111121', N'Law Faculty Annex');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0220000022', N'Samira', N'Pourreza', N'Omid', '1980-08-08', 'F', '09352222224', N'samira.pourreza@alborzuni.ir', '2007-10-10', 11, N'Lecturer', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0220000022', N'Iran', N'Yazd', N'Yazd', N'Modarres St.', N'Justice Alley', N'22', N'1111111122', N'Human Rights Clinic');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0230000023', N'Ardeshir', N'Zare', N'Darius', '1975-01-05', 'M', '09123333335', N'ardeshir.zare@alborzuni.ir', '2002-06-01', 12, N'Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0230000023', N'Iran', N'Khorasan Razavi', N'Mashhad', N'Ferdowsi Ave.', N'Politics Alley', N'23', N'1212121223', N'Political Science Dept.');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0240000024', N'Yasmin', N'Sadeghi', N'Babak', '1989-10-10', 'F', '09304444446', N'yasmin.sadeghi@alborzuni.ir', '2016-01-01', 12, N'Assistant Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0240000024', N'Iran', N'Khorasan Razavi', N'Mashhad', N'Vakilabad Blvd.', N'Democracy Alley', N'24', N'1212121224', N'International Relations Center');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0250000025', N'Saman', N'Zand', N'Kian', '1970-05-15', 'M', '09195555557', N'saman.zand@alborzuni.ir', '1998-03-01', 13, N'Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0250000025', N'Iran', N'Tehran', N'Tehran', N'Shahrak-e Gharb', N'Management Alley', N'25', N'1313131325', N'MBA Program Office');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0260000026', N'Sarina', N'Rostami', N'Behrouz', '1983-02-02', 'F', '09106666668', N'sarina.rostami@alborzuni.ir', '2010-09-01', 13, N'Associate Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0260000026', N'Iran', N'Tehran', N'Tehran', N'Enghelab St.', N'Finance Alley', N'26', N'1313131326', N'Financial Studies Center');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0270000027', N'Darya', N'Ahmadi', N'Arash', '1978-07-17', 'F', '09127777779', N'darya.ahmadi@alborzuni.ir', '2005-04-01', 14, N'Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0270000027', N'Iran', N'Isfahan', N'Isfahan', N'Sepah St.', N'Economy Alley', N'27', N'1414141427', N'Economics Department Office');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0280000028', N'Pooya', N'Hashemi', N'Mehdi', '1984-01-01', 'M', '09398888890', N'pooya.hashemi@alborzuni.ir', '2011-10-10', 14, N'Lecturer', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0280000028', N'Iran', N'Isfahan', N'Isfahan', N'Jolfa Alley', N'Trade Alley', N'28', N'1414141428', N'Development Economics Unit');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0290000029', N'Negar', N'Davoudi', N'Ali', '1971-06-25', 'F', '09129999991', N'negar.davoudi@alborzuni.ir', '1999-02-01', 15, N'Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0290000029', N'Iran', N'Tehran', N'Tehran', N'Shahrak-e Gharb', N'Psychology Alley', N'29', N'1515151529', N'Clinical Psychology Center');

    DELETE FROM @InstructorDataOutput;

    INSERT INTO Education.Instructors (NationalIdentityCode, PrimaryFirstName, PrimaryLastName, FatherFullName, DateOfBirth, GenderCode, ContactPhoneNumber, InstitutionalEmail, EmploymentDate, AssignedDepartmentID, AcademicRank, EmploymentStatus)
    OUTPUT inserted.FacultyMemberID, inserted.NationalIdentityCode INTO @InstructorDataOutput
    VALUES 
    (N'0300000030', N'Arash', N'Ahmadi', N'Mehdi', '1980-03-03', 'M', '09351001002', N'arash.ahmadi@alborzuni.ir', '2007-08-08', 15, N'Assistant Professor', N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Instructor', N'0300000030', N'Iran', N'Tehran', N'Tehran', N'Valiasr St.', N'Cognitive Alley', N'30', N'1515151530', N'Educational Psychology Unit');

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;