USE DB_project;
GO

SELECT *
FROM Education.Admins;

SELECT *
FROM Education.Addresses;

SELECT *
FROM Education.Userlink;

SELECT *
FROM Education.Students;

SELECT *
FROM Education.Majors;

SELECT *
FROM Education.Courses;

SELECT *
FROM Education.UserAccounts;

SELECT *
FROM Education.Departments;

SELECT *
FROM Education.Semesters;

SELECT *
FROM Education.Instructors;

SELECT *
FROM Education.CourseOfferings;

SELECT *
FROM Education.ClassSchedules;

SELECT *
FROM Education.ExamSchedules;

SELECT *
FROM Education.Enrollments
WHERE EnrolledStudentID = 10000;

SELECT *
FROM Education.StudentCourses
WHERE RelatedEnrollmentID = 100;

SELECT *
FROM Education.EventLogs;

SELECT *
FROM Education.StudentStatusChanges
WHERE AffectedStudentID = 10000;

SELECT Education.fn_GetStudentGPA(10000, 1) AS CalculatedStudentGPA;

SELECT Education.fn_RemainingCredits(10000) AS RemainingCreditUnits;

SELECT 
    course_entry.EnrolledStudentID,
    student_course_record.StudentCourseRecordID,
    student_course_record.FinalGrade,
    student_course_record.CourseCompletionStatus,
    offering_details.OfferingSemesterID,
    course_metadata.CurriculumCourseID
FROM 
    Education.StudentCourses AS student_course_record
JOIN 
    Education.Enrollments AS course_entry ON student_course_record.RelatedEnrollmentID = course_entry.CourseEnrollmentID
JOIN 
    Education.CourseOfferings AS offering_details ON course_entry.EnrolledOfferingID = offering_details.CourseOfferingID
JOIN 
    Education.Courses AS course_metadata ON offering_details.OfferedCourseID = course_metadata.CurriculumCourseID
WHERE 
    offering_details.OfferingSemesterID = 1 AND course_entry.EnrolledStudentID = 10000;

EXEC Education.usp_RegisterStudentInCourse 
    @TargetStudentID = 10000, 
    @CourseOfferingToRegisterID = 100;

EXEC Education.usp_UpdateStudentGrade 
    @CourseRecordIdentifier = 1, 
    @NewGradeValue = 16.50;

EXEC Education.usp_GetStudentTranscript 
    @TargetStudentID = 10000, 
    @AcademicSemesterID = 1;

EXEC Education.usp_RegisterStudentWithAddress
    @StudentNationalID = N'0404040404',
    @StudentFirstName = N'????',
    @StudentLastName = N'??????',
    @StudentFatherName = N'????',
    @StudentBirthDate = '2004-08-10',
    @StudentGenderCode = 'M',
    @StudentContactPhone = '09120101010',
    @StudentEmailAddress = 'amir.norouzi@alborzuni.ac.ir',
    @StudentEntryAcademicYear = 2022,
    @StudentDepartmentID = 1,
    @StudentMajorID = 1,
    @StudentEnrollmentStatus = N'Active',
    @AddressCountryName = N'?????',
    @AddressProvinceName = N'?????',
    @AddressCityName = N'?????',
    @AddressStreetName = N'?????? ??????',
    @AddressAlleyName = N'???? ????',
    @AddressBuildingNumber = '25',
    @AddressPostalCode = '1234567800',
    @AddressAdditionalInfo = N'???????? ?????';

EXEC Education.usp_RegisterInstructorWithAddress
    @InstructorNationalID = N'0505050505',
    @InstructorFirstName = N'?????',
    @InstructorLastName = N'?????',
    @InstructorFatherName = N'????',
    @InstructorBirthDate = '1982-03-05',
    @InstructorGenderCode = 'F',
    @InstructorContactPhone = '09390202020',
    @InstructorEmailAddress = 'fariba.hashemi@alborzuni.ac.ir',
    @InstructorHireDate = '2015-02-01',
    @InstructorDepartmentID = 2,
    @InstructorAcademicRank = N'Assistant Professor',
    @InstructorEmploymentStatus = N'Active',
    @AddressCountryName = N'?????',
    @AddressProvinceName = N'?????',
    @AddressCityName = N'???',
    @AddressStreetName = N'????? ???',
    @AddressAlleyName = N'???? ????',
    @AddressBuildingNumber = '30',
    @AddressPostalCode = '2345678900',
    @AddressAdditionalDetails = N'???? ???? ???? ?';

EXEC Education.usp_RegisterAdminWithAddress
    @AdminNationalID = N'0606060606',
    @AdminFirstName = N'?????',
    @AdminLastName = N'?????',
    @AdminRole = N'Admin',
    @AdminPhone = '09120303030',
    @AdminEmail = 'saman.azizi@alborzuni.ac.ir',
    @AddressCountry = N'?????',
    @AddressProvince = N'????',
    @AddressCity = N'?????',
    @AddressStreet = N'?????? ?????',
    @AddressAlley = N'???? ?????',
    @AddressPlaqueNumber = '15',
    @AddressPostalCode = '3456789010',
    @AddressExtraDescription = N'???? ?????';