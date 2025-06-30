USE DB_project;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @StudentDataOutput TABLE (NewStudentID INT, NewNationalCode NVARCHAR(10));

    -- Batch 1: Computer Science & Engineering Students
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0010101010', N'Sina', N'Ahmadi', N'Reza', '2003-09-10', 'M', '09121000000', N'sina.ahmadi@alborzuni.ac.ir', 2021, 1, 1, N'Active'),
    (N'0010101011', N'Nika', N'Mohammadi', N'Ali', '2004-03-22', 'F', '09351000001', N'nika.mohammadi@alborzuni.ac.ir', 2022, 1, 1, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0010101010', N'Iran', N'Tehran', N'Tehran', N'Shahrak-e Gharb', N'Golriz Alley', N'1A', N'1234510000', N'Main residence'),
    (N'Student', N'0010101011', N'Iran', N'Alborz', N'Karaj', N'Chamran Blvd', N'Baharan Alley', N'2B', N'1234510001', N'Student dormitory');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0010101012', N'Arash', N'Karimi', N'Mehran', '2002-07-05', 'M', '09122000000', N'arash.karimi@alborzuni.ac.ir', 2020, 1, 2, N'Active'),
    (N'0010101013', N'Darya', N'Hosseini', N'Saeed', '2005-01-18', 'F', '09902000001', N'darya.hosseini@alborzuni.ac.ir', 2023, 1, 2, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0010101012', N'Iran', N'Tehran', N'Tehran', N'Valiasr Ave', N'Shahin Alley', N'3C', N'1234510002', N'City apartment'),
    (N'Student', N'0010101013', N'Iran', N'Mazandaran', N'Sari', N'Ferdowsi St.', N'Lotus Alley', N'4D', N'1234510003', N'Parental home');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0010101014', N'Pouria', N'Fallahi', N'Kamran', '2001-11-29', 'M', '09193000000', N'pouria.fallahi@alborzuni.ac.ir', 2019, 1, 3, N'Active'),
    (N'0010101015', N'Tara', N'Norouzi', N'Majid', '2003-05-01', 'F', '09103000001', N'tara.norouzi@alborzuni.ac.ir', 2021, 1, 3, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0010101014', N'Iran', N'Isfahan', N'Isfahan', N'Chaharbagh St.', N'Narenj Alley', N'5E', N'1234510004', N'Rent in city center'),
    (N'Student', N'0010101015', N'Iran', N'Fars', N'Shiraz', N'Mollasadra St.', N'Jasmine Alley', N'6F', N'1234510005', N'Shared accommodation');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0010101016', N'Kian', N'Nasiri', N'Ghasem', '2002-02-14', 'M', '09124000000', N'kian.nasiri@alborzuni.ac.ir', 2020, 1, 4, N'Active'),
    (N'0010101017', N'Shabnam', N'Jafari', N'Behnam', '2004-10-08', 'F', '09354000001', N'shabnam.jafari@alborzuni.ac.ir', 2022, 1, 4, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0010101016', N'Iran', N'Tehran', N'Tehran', N'Karim Khan Zand St.', N'Safire Doosti', N'7G', N'1234510006', N'Campus housing'),
    (N'Student', N'0010101017', N'Iran', N'Gilan', N'Rasht', N'Imam Khomeini Blvd.', N'Green Alley', N'8H', N'1234510007', N'Near local market');

    DELETE FROM @StudentDataOutput;

    -- Batch 2: Electrical Engineering Students
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0020202020', N'Arman', N'Ranjbar', N'Sohrab', '2003-04-20', 'M', '09125000000', N'arman.ranjbar@alborzuni.ac.ir', 2021, 2, 5, N'Active'),
    (N'0020202021', N'Kimia', N'Samiei', N'Parviz', '2005-09-12', 'F', '09305000001', N'kimia.samiei@alborzuni.ac.ir', 2023, 2, 5, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0020202020', N'Iran', N'Tehran', N'Tehran', N'Jomhouri St.', N'Power Alley', N'9I', N'1234520000', N'Close to university'),
    (N'Student', N'0020202021', N'Iran', N'Kerman', N'Kerman', N'Azadi Blvd.', N'Energy Alley', N'10J', N'1234520001', N'Shared house');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0020202022', N'Behnam', N'Sadeghi', N'Farid', '2002-10-30', 'M', '09196000000', N'behnam.sadeghi@alborzuni.ac.ir', 2020, 2, 6, N'Active'),
    (N'0020202023', N'Nasim', N'Abbasi', N'Hadi', '2004-04-04', 'F', '09106000001', N'nasim.abbasi@alborzuni.ac.ir', 2022, 2, 6, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0020202022', N'Iran', N'Tehran', N'Tehran', N'Modarres St.', N'Control Alley', N'11K', N'1234520002', N'Near metro station'),
    (N'Student', N'0020202023', N'Iran', N'Yazd', N'Yazd', N'Shahid Beheshti St.', N'Signal Alley', N'12L', N'1234520003', N'University accommodation');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0020202024', N'Amirali', N'Asadi', N'Akbar', '2001-08-11', 'M', '09127000000', N'amirali.asadi@alborzuni.ac.ir', 2019, 2, 7, N'Active'),
    (N'0020202025', N'Yasaman', N'Saeedi', N'Kambiz', '2003-02-09', 'F', '09357000001', N'yasaman.saeedi@alborzuni.ac.ir', 2021, 2, 7, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0020202024', N'Iran', N'Tehran', N'Tehran', N'Enghelab St.', N'Micro Alley', N'13M', N'1234520004', N'Student flat'),
    (N'Student', N'0020202025', N'Iran', N'Gilan', N'Lahijan', N'Fajr St.', N'Circuit Alley', N'14N', N'1234520005', N'Outside city campus');

    DELETE FROM @StudentDataOutput;

    -- Batch 3: Mechanical Engineering Students
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0030303030', N'Soroush', N'Bagheri', N'Saman', '2004-01-25', 'M', '09198000000', N'soroush.bagheri@alborzuni.ac.ir', 2022, 3, 8, N'Active'),
    (N'0030303031', N'Narges', N'Rajabi', N'Soroush', '2006-06-19', 'F', '09108000001', N'narges.rajabi@alborzuni.ac.ir', 2024, 3, 8, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0030303030', N'Iran', N'Isfahan', N'Isfahan', N'Daneshgah Blvd.', N'Gear Alley', N'15O', N'1234530000', N'Near workshop'),
    (N'Student', N'0030303031', N'Iran', N'Mazandaran', N'Amol', N'Shahid Motahari St.', N'Force Alley', N'16P', N'1234530001', N'Industrial area residence');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0030303032', N'Parsa', N'Ahmadi', N'Hasan', '2003-11-02', 'M', '09129000000', N'parsa.ahmadi@alborzuni.ac.ir', 2021, 3, 9, N'Active'),
    (N'0030303033', N'Kimiya', N'Ghorbani', N'Farid', '2005-05-15', 'F', '09359000001', N'kimiya.ghorbani@alborzuni.ac.ir', 2023, 3, 9, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0030303032', N'Iran', N'Tehran', N'Tehran', N'Shariati Ave', N'Fluid Alley', N'17Q', N'1234530002', N'South Tehran'),
    (N'Student', N'0030303033', N'Iran', N'East Azerbaijan', N'Tabriz', N'Valiasr Blvd.', N'Heat Alley', N'18R', N'1234530003', N'Engineering campus');

    DELETE FROM @StudentDataOutput;

    -- Batch 4: Civil Engineering Students
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0040404040', N'Ramin', N'Vahidi', N'Ali', '2002-06-28', 'M', '09191000000', N'ramin.vahidi@alborzuni.ac.ir', 2020, 4, 10, N'Active'),
    (N'0040404041', N'Shima', N'Ansari', N'Behrouz', '2004-12-10', 'F', '09101000001', N'shima.ansari@alborzuni.ac.ir', 2022, 4, 10, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0040404040', N'Iran', N'Tehran', N'Tehran', N'Azadi Sq.', N'Structure Alley', N'19S', N'1234540000', N'Construction site office'),
    (N'Student', N'0040404041', N'Iran', N'Fars', N'Shiraz', N'Afifabad St.', N'Cement Alley', N'20T', N'1234540001', N'Central district flat');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0040404042', N'Farzad', N'Jamali', N'Parviz', '2001-09-01', 'M', '09122000001', N'farzad.jamali@alborzuni.ac.ir', 2019, 4, 11, N'Active'),
    (N'0040404043', N'Yasmin', N'Mozaffari', N'Sohrab', '2003-03-15', 'F', '09352000002', N'yasmin.mozaffari@alborzuni.ac.ir', 2021, 4, 11, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0040404042', N'Iran', N'Tehran', N'Tehran', N'Enghelab St.', N'Earthquake Alley', N'21U', N'1234540002', N'University district'),
    (N'Student', N'0040404043', N'Iran', N'Kerman', N'Rafsanjan', N'Valiasr St.', N'Seismic Alley', N'22V', N'1234540003', N'Family farm');

    DELETE FROM @StudentDataOutput;

    -- Batch 5: Chemical Engineering Students
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0050505050', N'Arash', N'Sami', N'Javad', '2004-02-05', 'M', '09193000002', N'arash.sami@alborzuni.ac.ir', 2022, 5, 12, N'Active'),
    (N'0050505051', N'Niloufar', N'Shams', N'Navid', '2006-07-29', 'F', '09103000003', N'niloufar.shams@alborzuni.ac.ir', 2024, 5, 12, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0050505050', N'Iran', N'Tehran', N'Tehran', N'Sattar Khan St.', N'Process Alley', N'23W', N'1234550000', N'Near Chemical Labs'),
    (N'Student', N'0050505051', N'Iran', N'Alborz', N'Karaj', N'Gohardasht', N'Reactor Alley', N'24X', N'1234550001', N'Home with garden');

    DELETE FROM @StudentDataOutput;

    -- Batch 6: Mathematics Students
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0060606060', N'Parsa', N'Ahmadian', N'Mehdi', '2003-03-18', 'M', '09124000002', N'parsa.ahmadian@alborzuni.ac.ir', 2021, 6, 14, N'Active'),
    (N'0060606061', N'Zahra', N'Dabiri', N'Kian', '2005-09-01', 'F', '09354000003', N'zahra.dabiri@alborzuni.ac.ir', 2023, 6, 14, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0060606060', N'Iran', N'Tehran', N'Tehran', N'Keshavarz Blvd.', N'Formula Alley', N'25Y', N'1234560000', N'Mathematical institute'),
    (N'Student', N'0060606061', N'Iran', N'Razavi Khorasan', N'Mashhad', N'Daneshgah Blvd.', N'Equation Alley', N'26Z', N'1234560001', N'Quiet neighborhood');

    DELETE FROM @StudentDataOutput;

    -- Batch 7: Physics Students
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0070707070', N'Kourosh', N'Shirazi', N'Babak', '2002-05-10', 'M', '09195000002', N'kourosh.shirazi@alborzuni.ac.ir', 2020, 7, 16, N'Active'),
    (N'0070707071', N'Sepideh', N'Foroughi', N'Farzad', '2004-11-20', 'F', '09105000003', N'sepideh.foroughi@alborzuni.ac.ir', 2022, 7, 16, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0070707070', N'Iran', N'Tehran', N'Tehran', N'Fatemi St.', N'Quantum Alley', N'27AA', N'1234570000', N'Near Physics Dept.'),
    (N'Student', N'0070707071', N'Iran', N'Isfahan', N'Isfahan', N'Amadegah St.', N'Light Alley', N'28BB', N'1234570001', N'High rise apartment');

    DELETE FROM @StudentDataOutput;

    -- Batch 8: Chemistry Students
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0080808080', N'Saman', N'Zarei', N'Ghasem', '2003-06-15', 'M', '09126000000', N'saman.zarei@alborzuni.ac.ir', 2021, 8, 18, N'Active'),
    (N'0080808081', N'Sanaz', N'Daneshjoo', N'Alireza', '2005-12-01', 'F', '09356000001', N'sanaz.daneshjoo@alborzuni.ac.ir', 2023, 8, 18, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0080808080', N'Iran', N'Tehran', N'Tehran', N'Pasdaran St.', N'Atom Alley', N'29CC', N'1234580000', N'Near Chemistry Labs'),
    (N'Student', N'0080808081', N'Iran', N'Yazd', N'Yazd', N'Jomhouri Blvd.', N'Molecule Alley', N'30DD', N'1234580001', N'Historical neighborhood');

    DELETE FROM @StudentDataOutput;

    -- Batch 9: Biology Students
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0090909090', N'Peyman', N'Amini', N'Vahid', '2002-08-20', 'M', '09197000000', N'peyman.amini@alborzuni.ac.ir', 2020, 9, 20, N'Active'),
    (N'0090909091', N'Saba', N'Nikoukar', N'Arash', '2004-02-28', 'F', '09107000001', N'saba.nikoukar@alborzuni.ac.ir', 2022, 9, 20, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0090909090', N'Iran', N'Tehran', N'Tehran', N'Fajr St.', N'Gene Alley', N'31EE', N'1234590000', N'Biology building area'),
    (N'Student', N'0090909091', N'Iran', N'Gilan', N'Bandar Anzali', N'Pasdaran St.', N'Cell Alley', N'32FF', N'1234590001', N'Seaside town');

    DELETE FROM @StudentDataOutput;

    -- Batch 10: Humanities Students (Literature & Law)
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0101010101', N'Nima', N'Ansari', N'Javad', '2003-09-01', 'M', '09128000000', N'nima.ansari@alborzuni.ac.ir', 2021, 10, 21, N'Active'),
    (N'0101010102', N'Parisa', N'Nazari', N'Saman', '2005-03-10', 'F', '09358000001', N'parisa.nazari@alborzuni.ac.ir', 2023, 10, 21, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0101010101', N'Iran', N'Tehran', N'Tehran', N'North Kargar St.', N'Poet Alley', N'33GG', N'1234510101', N'Humanities campus'),
    (N'Student', N'0101010102', N'Iran', N'Tehran', N'Tehran', N'Fatemi St.', N'Verse Alley', N'34HH', N'1234510102', N'Literary Society');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0111111111', N'Farhad', N'Shabani', N'Amir', '2002-11-15', 'M', '09199000000', N'farhad.shabani@alborzuni.ac.ir', 2020, 11, 23, N'Active'),
    (N'0111111112', N'Sahar', N'Karimi', N'Mehran', '2004-05-27', 'F', '09109000001', N'sahar.karimi@alborzuni.ac.ir', 2022, 11, 23, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0111111111', N'Iran', N'Tehran', N'Tehran', N'Mottahari St.', N'Justice Alley', N'35II', N'1234511111', N'Law firm internship'),
    (N'Student', N'0111111112', N'Iran', N'Alborz', N'Karaj', N'Shahid Beheshti', N'Court Alley', N'36JJ', N'1234511112', N'Legal studies dorm');

    DELETE FROM @StudentDataOutput;

    -- Batch 11: Political Science Students
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0121212121', N'Behzad', N'Hashemi', N'Majid', '2003-01-08', 'M', '09121000002', N'behzad.hashemi@alborzuni.ac.ir', 2021, 12, 24, N'Active'),
    (N'0121212122', N'Elham', N'Ebrahimi', N'Vahid', '2005-07-20', 'F', '09351000003', N'elham.ebrahimi@alborzuni.ac.ir', 2023, 12, 24, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0121212121', N'Iran', N'Tehran', N'Tehran', N'Qeytarieh St.', N'Policy Alley', N'37KK', N'1234512121', N'Government liaison office'),
    (N'Student', N'0121212122', N'Iran', N'Isfahan', N'Isfahan', N'Mirdamad St.', N'Debate Alley', N'38LL', N'1234512122', N'Think tank building');

    DELETE FROM @StudentDataOutput;

    -- Batch 12: Management Students
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0131313131', N'Omid', N'Davoodi', N'Farhad', '2002-04-12', 'M', '09192000002', N'omid.davoodi@alborzuni.ac.ir', 2020, 13, 26, N'Active'),
    (N'0131313132', N'Sepideh', N'Foroughi', N'Behrouz', '2004-10-24', 'F', '09102000003', N'sepideh.foroughi@alborzuni.ac.ir', 2022, 13, 26, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0131313131', N'Iran', N'Tehran', N'Tehran', N'Vanak St.', N'Finance Alley', N'39MM', N'1234513131', N'Business district'),
    (N'Student', N'0131313132', N'Iran', N'Razavi Khorasan', N'Mashhad', N'Sajjad Blvd.', N'Market Alley', N'40NN', N'1234513132', N'Commercial center');

    DELETE FROM @StudentDataOutput;

    -- Batch 13: Economics Students
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0141414141', N'Siavash', N'Zamani', N'Ali', '2003-05-18', 'M', '09123000002', N'siavash.zamani@alborzuni.ac.ir', 2021, 14, 28, N'Active'),
    (N'0141414142', N'Shahrzad', N'Pourmand', N'Reza', '2005-11-30', 'F', '09353000003', N'shahrzad.pourmand@alborzuni.ac.ir', 2023, 14, 28, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0141414141', N'Iran', N'Tehran', N'Tehran', N'North Sohrevardi St.', N'Economy Alley', N'41OO', N'1234514141', N'Central Bank area'),
    (N'Student', N'0141414142', N'Iran', N'East Azerbaijan', N'Tabriz', N'El-Goli St.', N'Growth Alley', N'42PP', N'1234514142', N'Development agency');

    DELETE FROM @StudentDataOutput;

    -- Batch 14: Psychology Students
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0151515151', N'Kianoush', N'Etemadi', N'Hasan', '2002-06-05', 'M', '09194000002', N'kianoush.etemadi@alborzuni.ac.ir', 2020, 15, 30, N'Active'),
    (N'0151515152', N'Setareh', N'Kazemi', N'Javad', '2004-12-17', 'F', '09104000003', N'setareh.kazemi@alborzuni.ac.ir', 2022, 15, 30, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0151515151', N'Iran', N'Tehran', N'Tehran', N'Shahid Fallahi St.', N'Mind Alley', N'43QQ', N'1234515151', N'Psychology clinic'),
    (N'Student', N'0151515152', N'Iran', N'Fars', N'Shiraz', N'Hafez Blvd.', N'Behavior Alley', N'44RR', N'1234515152', N'Counseling center');

    DELETE FROM @StudentDataOutput;

    -- Additional Students for other majors/departments to reach 60 total
    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0161616161', N'Siamak', N'Faramarzi', N'Soroush', '2003-02-01', 'M', '09125000002', N'siamak.faramarzi@alborzuni.ac.ir', 2021, 1, 3, N'Active'),
    (N'0161616162', N'Negin', N'Aslani', N'Nima', '2004-08-13', 'F', '09355000003', N'negin.aslani@alborzuni.ac.ir', 2022, 1, 4, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0161616161', N'Iran', N'Tehran', N'Tehran', N'Valiasr Ave', N'Programmer Alley', N'45SS', N'1234516161', N'Tech hub'),
    (N'Student', N'0161616162', N'Iran', N'Alborz', N'Karaj', N'Azadi Blvd.', N'Cyber Alley', N'46TT', N'1234516162', N'Security firm');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0171717171', N'Majid', N'Sanei', N'Ramin', '2002-05-09', 'M', '09196000002', N'majid.sanei@alborzuni.ac.ir', 2020, 2, 6, N'Active'),
    (N'0171717172', N'Roya', N'Fallahzadeh', N'Bahram', '2004-11-21', 'F', '09106000003', N'roya.fallahzadeh@alborzuni.ac.ir', 2022, 2, 7, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0171717171', N'Iran', N'Tehran', N'Tehran', N'Jomhouri St.', N'Electric Alley', N'47UU', N'1234517171', N'Power grid office'),
    (N'Student', N'0171717172', N'Iran', N'Isfahan', N'Kashan', N'Feyz Blvd.', N'Control Alley', N'48VV', N'1234517172', N'Sensor factory');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0181818181', N'Farshid', N'Davoudi', N'Sina', '2001-08-03', 'M', '09127000002', N'farshid.davoudi@alborzuni.ac.ir', 2019, 3, 9, N'Active'),
    (N'0181818182', N'Nahid', N'Ansari', N'Behrouz', '2003-02-15', 'F', '09357000003', N'nahid.ansari@alborzuni.ac.ir', 2021, 3, 8, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0181818181', N'Iran', N'Tehran', N'Tehran', N'Piroozi St.', N'Mechanical Alley', N'49WW', N'1234518181', N'Auto parts factory'),
    (N'Student', N'0181818182', N'Iran', N'Kerman', N'Sirjan', N'Enghelab St.', N'Design Alley', N'50XX', N'1234518182', N'Home office');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0191919191', N'Sohrab', N'Kiani', N'Majid', '2004-03-01', 'M', '09198000002', N'sohrab.kiani@alborzuni.ac.ir', 2022, 4, 11, N'Active'),
    (N'0191919192', N'Mahsa', N'Ranjbar', N'Sina', '2006-09-12', 'F', '09108000003', N'mahsa.ranjbar@alborzuni.ac.ir', 2024, 4, 10, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0191919191', N'Iran', N'Tehran', N'Tehran', N'Dolat St.', N'Construction Alley', N'51YY', N'1234519191', N'Building site'),
    (N'Student', N'0191919192', N'Iran', N'Fars', N'Marvdasht', N'Pasargad Blvd.', N'Earthquake Alley', N'52ZZ', N'1234519192', N'Rural area');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0202020202', N'Peyman', N'Hasanzadeh', N'Ramin', '2003-04-20', 'M', '09129000002', N'peyman.hasanzadeh@alborzuni.ac.ir', 2021, 5, 12, N'Active'),
    (N'0202020203', N'Saba', N'Bahrami', N'Farid', '2005-10-02', 'F', '09359000003', N'saba.bahrami@alborzuni.ac.ir', 2023, 5, 13, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0202020202', N'Iran', N'Tehran', N'Tehran', N'Shariati Ave', N'Chemical Alley', N'53AAA', N'1234520202', N'Process plant'),
    (N'Student', N'0202020203', N'Iran', N'Alborz', N'Hashtgerd', N'Fajr Blvd.', N'Polymer Alley', N'54BBB', N'1234520203', N'Industrial Park');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0212121212', N'Kianoush', N'Ebrahimi', N'Amir', '2002-05-15', 'M', '09191000002', N'kianoush.ebrahimi@alborzuni.ac.ir', 2020, 6, 14, N'Active'),
    (N'0212121213', N'Setareh', N'Davoudi', N'Ramin', '2004-11-25', 'F', '09101000003', N'setareh.davoudi@alborzuni.ac.ir', 2022, 6, 15, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0212121212', N'Iran', N'Tehran', N'Tehran', N'North Kargar St.', N'Math Alley', N'55CCC', N'1234521212', N'University Research Center'),
    (N'Student', N'0212121213', N'Iran', N'Razavi Khorasan', N'Mashhad', N'Vakilabad Blvd.', N'Analysis Alley', N'56DDD', N'1234521213', N'Statistics Office');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0222222222', N'Amirali', N'Ansari', N'Behzad', '2003-06-01', 'M', '09122000002', N'amirali.ansari@alborzuni.ac.ir', 2021, 7, 16, N'Active'),
    (N'0222222223', N'Yasaman', N'Zamani', N'Kamran', '2005-12-13', 'F', '09352000003', N'yasaman.zamani@alborzuni.ac.ir', 2023, 7, 17, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0222222222', N'Iran', N'Tehran', N'Tehran', N'Ferdowsi Ave', N'Quantum Alley', N'57EEE', N'1234522222', N'Physics research institute'),
    (N'Student', N'0222222223', N'Iran', N'Isfahan', N'Isfahan', N'Sheykh Bahaee St.', N'Nano Alley', N'58FFF', N'1234522223', N'Advanced materials lab');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0232323232', N'Farid', N'Aslani', N'Nima', '2002-07-20', 'M', '09193000002', N'farid.aslani@alborzuni.ac.ir', 2020, 8, 18, N'Active'),
    (N'0232323233', N'Negin', N'Sanei', N'Reza', '2004-01-30', 'F', '09103000003', N'negin.sanei@alborzuni.ac.ir', 2022, 8, 19, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0232323232', N'Iran', N'Tehran', N'Tehran', N'Pasdaran St.', N'Chemistry Alley', N'59GGG', N'1234523232', N'Chemical R&D center'),
    (N'Student', N'0232323233', N'Iran', N'Alborz', N'Karaj', N'Shahid Beheshti Blvd.', N'Organic Alley', N'60HHH', N'1234523233', N'Industrial chemistry campus');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0242424242', N'Parsa', N'Vatani', N'Amir', '2003-08-11', 'M', '09124000002', N'parsa.vatani@alborzuni.ac.ir', 2021, 9, 20, N'Active'),
    (N'0242424243', N'Shirin', N'Nikzad', N'Babak', '2005-02-23', 'F', '09354000003', N'shirin.nikzad@alborzuni.ac.ir', 2023, 9, 21, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0242424242', N'Iran', N'Tehran', N'Tehran', N'Qeytarieh St.', N'Bio Alley', N'61III', N'1234524242', N'Biotech park'),
    (N'Student', N'0242424243', N'Iran', N'Kerman', N'Kerman', N'Azadi Blvd.', N'Cell Alley', N'62JJJ', N'1234524243', N'Genetics lab');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0252525252', N'Kian', N'Norouzi', N'Sohrab', '2002-09-01', 'M', '09195000002', N'kian.norouzi@alborzuni.ac.ir', 2020, 10, 22, N'Active'),
    (N'0252525253', N'Sara', N'Jafari', N'Saman', '2004-03-13', 'F', '09105000003', N'sara.jafari@alborzuni.ac.ir', 2022, 10, 23, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0252525252', N'Iran', N'Tehran', N'Tehran', N'Valiasr Ave', N'Literature Alley', N'63KKK', N'1234525252', N'Library district'),
    (N'Student', N'0252525253', N'Iran', N'Fars', N'Shiraz', N'Hafez Blvd.', N'Poetry Alley', N'64LLL', N'1234525253', N'Artistic Quarter');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0262626262', N'Pouria', N'Mirzaei', N'Mehran', '2003-10-20', 'M', '09126000002', N'pouria.mirzaei@alborzuni.ac.ir', 2021, 11, 24, N'Active'),
    (N'0262626263', N'Laleh', N'Mohammadi', N'Javad', '2005-04-01', 'F', '09356000003', N'laleh.mohammadi@alborzuni.ac.ir', 2023, 11, 25, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0262626262', N'Iran', N'Tehran', N'Tehran', N'Enghelab St.', N'Law Alley', N'65MMM', N'1234526262', N'Judiciary area'),
    (N'Student', N'0262626263', N'Iran', N'Gilan', N'Rasht', N'Moallem Blvd.', N'Justice Alley', N'66NNN', N'1234526263', N'Court district');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0272727272', N'Majid', N'Karimi', N'Amir', '2002-11-10', 'M', '09197000002', N'majid.karimi@alborzuni.ac.ir', 2020, 12, 26, N'Active'),
    (N'0272727273', N'Nika', N'Hosseini', N'Saeed', '2004-05-22', 'F', '09107000003', N'nika.hosseini@alborzuni.ac.ir', 2022, 12, 27, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0272727272', N'Iran', N'Tehran', N'Tehran', N'Shahrak-e Gharb', N'Politics Alley', N'67OOO', N'1234527272', N'Embassy district'),
    (N'Student', N'0272727273', N'Iran', N'Alborz', N'Karaj', N'Gohardasht', N'Global Alley', N'68PPP', N'1234527273', N'International Relations office');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0282828282', N'Parsa', N'Ahmadi', N'Hasan', '2003-12-01', 'M', '09128000002', N'parsa.ahmadi@alborzuni.ac.ir', 2021, 13, 28, N'Active'),
    (N'0282828283', N'Zahra', N'Ghorbani', N'Farid', '2005-06-13', 'F', '09358000003', N'zahra.ghorbani@alborzuni.ac.ir', 2023, 13, 29, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0282828282', N'Iran', N'Tehran', N'Tehran', N'Valiasr Ave', N'Management Alley', N'69QQQ', N'1234528282', N'Business Park'),
    (N'Student', N'0282828283', N'Iran', N'Isfahan', N'Isfahan', N'Chaharbagh St.', N'Supply Chain Alley', N'70RRR', N'1234528283', N'Logistics center');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0292929292', N'Amirali', N'Asadi', N'Akbar', '2002-01-08', 'M', '09199000002', N'amirali.asadi@alborzuni.ac.ir', 2020, 14, 30, N'Active'),
    (N'0292929293', N'Yasaman', N'Saeedi', N'Kambiz', '2004-07-20', 'F', '09109000003', N'yasaman.saeedi@alborzuni.ac.ir', 2022, 14, 31, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0292929292', N'Iran', N'Tehran', N'Tehran', N'Enghelab St.', N'Economic Alley', N'71SSS', N'1234529292', N'Financial district'),
    (N'Student', N'0292929293', N'Iran', N'Fars', N'Shiraz', N'Afifabad St.', N'Market Alley', N'72TTT', N'1234529293', N'Trade hub');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0303030303', N'Soroush', N'Bagheri', N'Saman', '2003-02-14', 'M', '09121000003', N'soroush.bagheri@alborzuni.ac.ir', 2021, 15, 32, N'Active'),
    (N'0303030304', N'Narges', N'Rajabi', N'Soroush', '2005-08-26', 'F', '09351000004', N'narges.rajabi@alborzuni.ac.ir', 2023, 15, 33, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0303030303', N'Iran', N'Tehran', N'Tehran', N'Shariati Ave', N'Mind Alley', N'73UUU', N'1234530303', N'Psychology clinic'),
    (N'Student', N'0303030304', N'Iran', N'Kerman', N'Kerman', N'Azadi Blvd.', N'Brain Alley', N'74VVV', N'1234530304', N'Neuroscience center');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0313131313', N'Parsa', N'Ahmadi', N'Hasan', '2002-03-01', 'M', '09192000003', N'parsa.ahmadi@alborzuni.ac.ir', 2020, 1, 1, N'Active'),
    (N'0313131314', N'Kimiya', N'Ghorbani', N'Farid', '2004-09-12', 'F', '09102000004', N'kimiya.ghorbani@alborzuni.ac.ir', 2022, 1, 2, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0313131313', N'Iran', N'Tehran', N'Tehran', N'Valiasr Ave', N'Computer Alley', N'75WWW', N'1234531313', N'Software house'),
    (N'Student', N'0313131314', N'Iran', N'Alborz', N'Karaj', N'Chamran Blvd', N'Data Alley', N'76XXX', N'1234531314', N'AI research institute');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0323232323', N'Ramin', N'Vahidi', N'Ali', '2003-04-20', 'M', '09123000003', N'ramin.vahidi@alborzuni.ac.ir', 2021, 2, 5, N'Active'),
    (N'0323232324', N'Shima', N'Ansari', N'Behrouz', '2005-10-02', 'F', '09353000004', N'shima.ansari@alborzuni.ac.ir', 2023, 2, 7, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0323232323', N'Iran', N'Tehran', N'Tehran', N'Jomhouri St.', N'Electric Alley', N'77YYY', N'1234532323', N'Power company'),
    (N'Student', N'0323232324', N'Iran', N'Mazandaran', N'Sari', N'Ferdowsi St.', N'Circuit Alley', N'78ZZZ', N'1234532324', N'Electronics shop');

    DELETE FROM @StudentDataOutput;

    INSERT INTO Education.Students (NationalIdentityNumber, StudentFirstName, StudentLastName, StudentFatherName, DateOfBirth, GenderCode, ContactPhoneNumber, StudentEmailAddress, AcademicEntryYear, EnrolledDepartmentID, ChosenMajorID, EnrollmentStatus)
    OUTPUT inserted.UniversityStudentID, inserted.NationalIdentityNumber INTO @StudentDataOutput
    VALUES 
    (N'0333333333', N'Farzad', N'Jamali', N'Parviz', '2002-05-15', 'M', '09194000003', N'farzad.jamali@alborzuni.ac.ir', 2020, 3, 8, N'Active'),
    (N'0333333334', N'Yasmin', N'Mozaffari', N'Sohrab', '2004-11-25', 'F', '09104000004', N'yasmin.mozaffari@alborzuni.ac.ir', 2022, 3, 9, N'Active');

    INSERT INTO Education.Addresses (AssociatedEntityType, AssociatedEntityID, Country, Province, City, Street, Alley, BuildingNumber, PostalCode, AdditionalDetails)
    VALUES 
    (N'Student', N'0333333333', N'Iran', N'Tehran', N'Tehran', N'Karim Khan Zand St.', N'Mechanic Alley', N'79AAAA', N'1234533333', N'Automotive factory'),
    (N'Student', N'0333333334', N'Iran', N'Isfahan', N'Isfahan', N'Chaharbagh St.', N'Fluid Dynamics Alley', N'80BBBB', N'1234533334', N'Aerospace company');

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;