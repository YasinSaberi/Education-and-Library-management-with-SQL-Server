USE DB_project;
GO 

PRINT N'--- UNIVERSITY DATABASE PROJECT VIDEO DEMONSTRATION SCRIPT ---';
PRINT N'';
PRINT N'*** DEMO START: Showing key database functionalities ***';
PRINT N'';

-- ====================================================================
-- SECTION 0: INITIAL SETUP & VERIFICATION
-- Initializes variables and verifies database setup
-- ====================================================================
PRINT N'--- SECTION 0: INITIAL SETUP & VERIFICATION ---';
PRINT N'Setting up variables for the demo...';

-- Declare all variables (visible throughout the script)
DECLARE @DemoStudentID INT;
DECLARE @DemoInstructorID INT;
DECLARE @DemoCourseID INT;
DECLARE @DemoSemesterID INT;
DECLARE @DemoCourseOfferingID INT;
DECLARE @NewlyRegisteredStudentID INT;
DECLARE @NewEnrollmentID INT;
DECLARE @StudentCourseRecordID_for_GradeUpdate INT;
DECLARE @DemoLibraryMemberID INT;
DECLARE @DemoBookCopyID INT;
DECLARE @NewBorrowID INT;
DECLARE @DemoSpecificStudentNationalID NVARCHAR(10) = N'0010101021'; -- Unique ID, change for each run
DECLARE @CurrentYear INT = YEAR(GETDATE());
DECLARE @DemoNationalID_NewAdmin NVARCHAR(10) = N'0010000003'; -- Unique ID, change for each run
DECLARE @DemoNationalID_NewInstructor NVARCHAR(10) = N'0505050509'; -- Unique ID, change for each run

-- Initialize variables from populated database
BEGIN TRY
    SELECT TOP 1 @DemoStudentID = UniversityStudentID FROM Education.Students ORDER BY UniversityStudentID;
    IF @DemoStudentID IS NULL RAISERROR(N'ERROR: No students found. Check database setup.', 16, 1);

    SELECT TOP 1 @DemoInstructorID = FacultyMemberID FROM Education.Instructors ORDER BY FacultyMemberID;
    IF @DemoInstructorID IS NULL RAISERROR(N'ERROR: No instructors found. Check database setup.', 16, 1);

    SELECT TOP 1 @DemoCourseID = CurriculumCourseID FROM Education.Courses ORDER BY CurriculumCourseID;
    IF @DemoCourseID IS NULL RAISERROR(N'ERROR: No courses found. Check database setup.', 16, 1);

    SELECT TOP 1 @DemoSemesterID = AcademicTermID FROM Education.Semesters ORDER BY AcademicTermID;
    IF @DemoSemesterID IS NULL RAISERROR(N'ERROR: No semesters found. Check database setup.', 16, 1);

    SELECT TOP 1 @DemoCourseOfferingID = CourseOfferingID FROM Education.CourseOfferings ORDER BY CourseOfferingID;
    IF @DemoCourseOfferingID IS NULL RAISERROR(N'ERROR: No course offerings found. Check database setup.', 16, 1);

    SELECT TOP 1 @DemoLibraryMemberID = LibraryMemberID FROM Library.Members ORDER BY LibraryMemberID;
    IF @DemoLibraryMemberID IS NULL RAISERROR(N'ERROR: No library members found. Check database setup.', 16, 1);

    SELECT TOP 1 @DemoBookCopyID = BookCopyID FROM Library.BookCopies WHERE CurrentAvailabilityStatus = 1 ORDER BY BookCopyID;
    IF @DemoBookCopyID IS NULL RAISERROR(N'ERROR: No available book copies found. Check database setup.', 16, 1);
END TRY
BEGIN CATCH
    PRINT N'ERROR in SECTION 0: ' + ERROR_MESSAGE();
    PRINT N'Cannot proceed with demo. Please fix database setup and rerun.';
    RETURN;
END CATCH;

PRINT N'VERIFY: Demo variables initialized:';
SELECT @DemoStudentID AS DemoStudentID, @DemoInstructorID AS DemoInstructorID, @DemoCourseID AS DemoCourseID, 
       @DemoSemesterID AS DemoSemesterID, @DemoCourseOfferingID AS DemoCourseOfferingID, 
       @DemoLibraryMemberID AS DemoLibraryMemberID, @DemoBookCopyID AS DemoBookCopyID;

PRINT N'VERIFY: Table row counts:';
SELECT N'Departments' AS TableName, COUNT(*) AS [RowCount] FROM Education.Departments UNION ALL
SELECT N'Majors', COUNT(*) FROM Education.Majors UNION ALL
SELECT N'Courses', COUNT(*) FROM Education.Courses UNION ALL
SELECT N'Students', COUNT(*) FROM Education.Students UNION ALL
SELECT N'Instructors', COUNT(*) FROM Education.Instructors UNION ALL
SELECT N'Books', COUNT(*) FROM Library.Books UNION ALL
SELECT N'BookCopies', COUNT(*) FROM Library.BookCopies;
PRINT N'--- SECTION 0 COMPLETE ---';
PRINT N'';

-- ====================================================================
-- SECTION 1: EDUCATION SCHEMA FUNCTIONS
-- Demonstrates GPA, credits, and national code validation
-- ====================================================================
PRINT N'--- SECTION 1: EDUCATION SCHEMA FUNCTIONS ---';

PRINT N'--- 1.1: Calculating GPA for an existing student ---';
BEGIN TRY
    IF @DemoStudentID IS NOT NULL AND @DemoSemesterID IS NOT NULL
    BEGIN
        SELECT Education.CalculateStudentGPA(@DemoStudentID, @DemoSemesterID) AS CalculatedGPA_ExistingStudent;
        PRINT N'GPA calculated successfully.';
    END
    ELSE
        PRINT N'WARNING: Skipping GPA calculation due to missing student or semester ID.';
END TRY
BEGIN CATCH
    PRINT N'WARNING: GPA calculation failed. Error: ' + ERROR_MESSAGE();
END CATCH;
PRINT N'';

PRINT N'--- 1.2: Getting remaining credits for an existing student ---';
BEGIN TRY
    IF @DemoStudentID IS NOT NULL
    BEGIN
        SELECT Education.fn_RemainingCredits(@DemoStudentID) AS RemainingCredits_ExistingStudent;
        PRINT N'Remaining credits retrieved successfully.';
    END
    ELSE
        PRINT N'WARNING: Skipping remaining credits due to missing student ID.';
END TRY
BEGIN CATCH
    PRINT N'WARNING: Remaining credits retrieval failed. Error: ' + ERROR_MESSAGE();
END CATCH;
PRINT N'';

PRINT N'--- 1.3: Validating national codes ---';
BEGIN TRY
    SELECT Education.fn_IsValidNationalCode(N'0010000000') AS ValidCode_Test1, -- Should be 1
           Education.fn_IsValidNationalCode(N'9876543210') AS ValidCode_Test2, -- Should be 1
           Education.fn_IsValidNationalCode(N'12345') AS InvalidLength_Test,   -- Should be 0
           Education.fn_IsValidNationalCode(N'123456789A') AS InvalidChar_Test; -- Should be 0
    PRINT N'National code validation completed.';
END TRY
BEGIN CATCH
    PRINT N'WARNING: National code validation failed. Error: ' + ERROR_MESSAGE();
END CATCH;
PRINT N'--- SECTION 1 COMPLETE ---';
PRINT N'';

-- ====================================================================
-- SECTION 2: EDUCATION STORED PROCEDURES
-- Demonstrates student registration, enrollment, grading, transcript, suggestions, admin, and instructor registration
-- ====================================================================
PRINT N'--- SECTION 2: EDUCATION STORED PROCEDURES ---';

PRINT N'--- 2.1: Registering a new student (auto-creates library member) ---';
BEGIN TRY
    IF @DemoSpecificStudentNationalID IS NOT NULL
    BEGIN
        BEGIN TRANSACTION;
        EXEC Education.usp_RegisterStudentWithAddress
             @StudentNationalID = @DemoSpecificStudentNationalID, 
             @StudentFirstName = N'آیدا', @StudentLastName = N'عزیزی', @StudentFatherName = N'حسین',
             @StudentBirthDate = '2004-07-20', @StudentGenderCode = 'F', @StudentContactPhone = '09121000002',
             @StudentEmailAddress = 'ayda.a@demo.uni.edu', @StudentEntryAcademicYear = @CurrentYear,
             @StudentDepartmentID = 1, @StudentMajorID = 1, @StudentEnrollmentStatus = N'Active',
             @AddressCountryName = N'ایران', @AddressProvinceName = N'تهران', @AddressCityName = N'تهران',
             @AddressStreetName = N'خیابان نمونه', @AddressAlleyName = N'کوچه تست',
             @AddressBuildingNumber = '10', @AddressPostalCode = '1234567891', @AddressAdditionalInfo = N'ساختمان اصلی';
        COMMIT TRANSACTION;
        PRINT N'New student registered successfully.';
        PRINT N'VERIFY: New student record:';
        SELECT * FROM Education.Students WHERE NationalIdentityNumber = @DemoSpecificStudentNationalID;
        PRINT N'VERIFY: Auto-created library member:';
        SELECT * FROM Library.Members WHERE AssociatedStudentID = (SELECT UniversityStudentID FROM Education.Students WHERE NationalIdentityNumber = @DemoSpecificStudentNationalID);
    END
    ELSE
        PRINT N'WARNING: Skipping student registration due to missing national ID.';
END TRY
BEGIN CATCH
    IF (XACT_STATE()) <> 0 ROLLBACK TRANSACTION;
    PRINT N'WARNING: Student registration failed (possible duplicate ID). Error: ' + ERROR_MESSAGE();
END CATCH;
SELECT TOP 1 @NewlyRegisteredStudentID = UniversityStudentID FROM Education.Students WHERE NationalIdentityNumber = @DemoSpecificStudentNationalID ORDER BY UniversityStudentID DESC;
IF @NewlyRegisteredStudentID IS NULL PRINT N'WARNING: Student registration failed. Subsequent steps may fail.';
PRINT N'';

PRINT N'--- 2.2: Enrolling new student in a course offering ---';
BEGIN TRY
    IF @NewlyRegisteredStudentID IS NOT NULL AND @DemoCourseOfferingID IS NOT NULL
    BEGIN
        BEGIN TRANSACTION;
        INSERT INTO Education.Enrollments (EnrolledStudentID, EnrolledOfferingID, DateOfEnrollment, EnrollmentStatus)
        VALUES (@NewlyRegisteredStudentID, @DemoCourseOfferingID, GETDATE(), N'Registered');
        COMMIT TRANSACTION;
        PRINT N'Student enrolled successfully.';
        PRINT N'VERIFY: New enrollment record:';
        SELECT * FROM Education.Enrollments WHERE EnrolledStudentID = @NewlyRegisteredStudentID AND EnrolledOfferingID = @DemoCourseOfferingID;
    END
    ELSE
        PRINT N'WARNING: Skipping enrollment due to missing student or course offering ID.';
END TRY
BEGIN CATCH
    IF (XACT_STATE()) <> 0 ROLLBACK TRANSACTION;
    PRINT N'WARNING: Enrollment failed (possible ID mismatch or existing enrollment). Error: ' + ERROR_MESSAGE();
END CATCH;
SELECT TOP 1 @NewEnrollmentID = CourseEnrollmentID FROM Education.Enrollments WHERE EnrolledStudentID = @NewlyRegisteredStudentID AND EnrolledOfferingID = @DemoCourseOfferingID ORDER BY CourseEnrollmentID DESC;
IF @NewEnrollmentID IS NULL PRINT N'WARNING: Enrollment failed. Subsequent steps may fail.';
PRINT N'';

PRINT N'--- 2.3: Updating student grade ---';
BEGIN TRY
    IF @NewEnrollmentID IS NOT NULL
    BEGIN
        BEGIN TRANSACTION;
        INSERT INTO Education.StudentCourses (RelatedEnrollmentID, CourseCompletionStatus, FinalGrade) 
        VALUES (@NewEnrollmentID, N'Registered', NULL);
        SELECT TOP 1 @StudentCourseRecordID_for_GradeUpdate = StudentCourseRecordID 
        FROM Education.StudentCourses 
        WHERE RelatedEnrollmentID = @NewEnrollmentID AND FinalGrade IS NULL 
        ORDER BY StudentCourseRecordID DESC;

        IF @StudentCourseRecordID_for_GradeUpdate IS NOT NULL
        BEGIN
            EXEC Education.usp_UpdateStudentGrade
                 @CourseRecordIdentifier = @StudentCourseRecordID_for_GradeUpdate,
                 @NewGradeValue = 18.50;
            COMMIT TRANSACTION;
            PRINT N'Grade updated successfully.';
            PRINT N'VERIFY: Updated student course record (status should be "Passed"):';
            SELECT * FROM Education.StudentCourses WHERE StudentCourseRecordID = @StudentCourseRecordID_for_GradeUpdate;
            PRINT N'VERIFY: Recent event log (should show grade update):';
            SELECT TOP 5 * FROM Education.EventLogs ORDER BY LogEntryID DESC;
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT N'WARNING: No student course record created. Grade update skipped.';
        END
    END
    ELSE
        PRINT N'WARNING: Skipping grade update due to missing enrollment ID.';
END TRY
BEGIN CATCH
    IF (XACT_STATE()) <> 0 ROLLBACK TRANSACTION;
    PRINT N'WARNING: Grade update failed (possible existing grade). Error: ' + ERROR_MESSAGE();
END CATCH;
PRINT N'';

PRINT N'--- 2.4: Getting student transcript ---';
BEGIN TRY
    IF @NewlyRegisteredStudentID IS NOT NULL AND @DemoSemesterID IS NOT NULL
    BEGIN
        EXEC Education.usp_GetStudentTranscript
             @TargetStudentID = @NewlyRegisteredStudentID,
             @AcademicSemesterID = @DemoSemesterID;
        PRINT N'Transcript retrieved successfully.';
    END
    ELSE
        PRINT N'WARNING: Skipping transcript retrieval due to missing student or semester ID.';
END TRY
BEGIN CATCH
    PRINT N'WARNING: Transcript retrieval failed. Error: ' + ERROR_MESSAGE();
END CATCH;
PRINT N'';

PRINT N'--- 2.5: Getting course suggestions for student ---';
BEGIN TRY
    IF @NewlyRegisteredStudentID IS NOT NULL
    BEGIN
        EXEC Education.usp_GetSuggestedCourses_PriorityPast 
             @StudentIdentifierForSuggestion = @NewlyRegisteredStudentID, 
             @TargetSemesterSequence = 2;
        PRINT N'Course suggestions retrieved successfully.';
    END
    ELSE
        PRINT N'WARNING: Skipping course suggestions due to missing student ID.';
END TRY
BEGIN CATCH
    PRINT N'WARNING: Course suggestions failed. Error: ' + ERROR_MESSAGE();
END CATCH;
PRINT N'';

PRINT N'--- 2.6: Registering a new admin ---';
BEGIN TRY
    IF @DemoNationalID_NewAdmin IS NOT NULL
    BEGIN
        BEGIN TRANSACTION;
        EXEC Education.usp_RegisterAdminWithAddress
             @AdminNationalID = @DemoNationalID_NewAdmin, 
             @AdminFirstName = N'سارا', @AdminLastName = N'حاتمی', @AdminRole = N'Admin',
             @AdminPhone = '09123000000', @AdminEmail = 'sara.h@demo.uni.edu',
             @AddressCountry = N'ایران', @AddressProvince = N'البرز', @AddressCity = N'کرج',
             @AddressStreetName = N'بلوار دانشگاه', @AddressAlleyName = N'کوچه نور',
             @AddressBuildingNumber = '20', @AddressPostalCode = '1234567892', @AddressDetails = N'دفتر مدیریت';
        COMMIT TRANSACTION;
        PRINT N'Admin registered successfully.';
        PRINT N'VERIFY: New admin record:';
        SELECT * FROM Education.Admins WHERE NationalIdentifier = @DemoNationalID_NewAdmin;
    END
    ELSE
        PRINT N'WARNING: Skipping admin registration due to missing national ID.';
END TRY
BEGIN CATCH
    IF (XACT_STATE()) <> 0 ROLLBACK TRANSACTION;
    PRINT N'WARNING: Admin registration failed (possible duplicate ID). Error: ' + ERROR_MESSAGE();
END CATCH;
PRINT N'';

PRINT N'--- 2.7: Registering a new instructor ---';
BEGIN TRY
    IF @DemoNationalID_NewInstructor IS NOT NULL
    BEGIN
        BEGIN TRANSACTION;
        EXEC Education.usp_RegisterInstructorWithAddress
             @InstructorNationalID = @DemoNationalID_NewInstructor, 
             @InstructorFirstName = N'علی', @InstructorLastName = N'رضایی', @InstructorFatherName = N'احمد',
             @InstructorBirthDate = '1980-05-01', @InstructorGenderCode = 'M', @InstructorContactPhone = '09124000000',
             @InstructorEmailAddress = 'ali.r@demo.uni.edu', @InstructorHireDate = '2010-09-01',
             @InstructorDepartmentID = 1, @InstructorAcademicRank = N'Assistant Professor', @InstructorEmploymentStatus = N'Active',
             @AddressCountryName = N'ایران', @AddressProvinceName = N'تهران', @AddressCityName = N'تهران',
             @AddressStreetName = N'خیابان استاد', @AddressAlleyName = N'کوچه قلم',
             @AddressBuildingNumber = '15', @AddressPostalCode = '1234567893', @AddressAdditionalDetails = N'دفتر هیئت علمی';
        COMMIT TRANSACTION;
        PRINT N'Instructor registered successfully.';
        PRINT N'VERIFY: New instructor record:';
        SELECT * FROM Education.Instructors WHERE NationalIdentityCode = @DemoNationalID_NewInstructor;
    END
    ELSE
        PRINT N'WARNING: Skipping instructor registration due to missing national ID.';
END TRY
BEGIN CATCH
    IF (XACT_STATE()) <> 0 ROLLBACK TRANSACTION;
    PRINT N'WARNING: Instructor registration failed (possible duplicate ID). Error: ' + ERROR_MESSAGE();
END CATCH;
PRINT N'--- SECTION 2 COMPLETE ---';
PRINT N'';
-- ====================================================================
-- SECTION 3: DEMONSTRATING LIBRARY SCHEMA FUNCTIONALITIES
-- Demonstrates book borrowing, returning, and recommendations.
-- ====================================================================
PRINT N'--- SECTION 3: DEMONSTRATING LIBRARY ---';

-- 3.1: Live Demo - Borrowing a Book (Demonstrates SP and Triggers)
PRINT N'--- 3.1: Live Demo - Borrowing a Book ---';
BEGIN TRY
    -- We use the pre-initialized @DemoLibraryMemberID and @DemoBookCopyID from Section 0
    IF @DemoLibraryMemberID IS NOT NULL AND @DemoBookCopyID IS NOT NULL
    BEGIN
        BEGIN TRANSACTION;
        DECLARE @BorrowDueDate DATE = DATEADD(DAY, 14, GETDATE());
        EXEC Library.sp_BorrowBook
             @BorrowingMemberID = @DemoLibraryMemberID,
             @BorrowedCopyIdentifier = @DemoBookCopyID,
             @ReturnPlannedDate = @BorrowDueDate;
        COMMIT TRANSACTION;
        
        PRINT N'Book borrowed successfully.';
        PRINT N'VERIFY: Book copy status is now Unavailable (0):';
        SELECT BookCopyID, CurrentAvailabilityStatus FROM Library.BookCopies WHERE BookCopyID = @DemoBookCopyID;
        PRINT N'VERIFY: Library activity log shows "Borrowed":';
        SELECT TOP 1 * FROM Library.BorrowingActivityLog ORDER BY ActivityLogEntryID DESC;
        
        -- Get the ID of this new borrowing record for the return demo
        SELECT TOP 1 @NewBorrowID = BorrowingRecordID 
        FROM Library.Borrowing 
        WHERE LibraryMemberID = @DemoLibraryMemberID AND BorrowedCopyID = @DemoBookCopyID
        ORDER BY BorrowingRecordID DESC;
    END
    ELSE
        PRINT N'WARNING: Skipping book borrowing due to missing member or available book copy ID.';
END TRY
BEGIN CATCH
    IF (XACT_STATE()) <> 0 ROLLBACK TRANSACTION;
    PRINT N'ERROR: Book borrowing failed! Check if the book is already borrowed. Error: ' + ERROR_MESSAGE();
END CATCH;
PRINT N'';

-- ====================================================================
-- SECTION 3.2: Return a Book
-- ====================================================================
PRINT N'--- 3.2: Returning a Book ---';
BEGIN TRY
    -- Check if @NewBorrowID was successfully set in the borrowing step
    IF @NewBorrowID IS NOT NULL
    BEGIN
        BEGIN TRANSACTION;

        -- Calculate a return date based on the loan date from the record
        DECLARE @ReturnDate DATE = DATEADD(DAY, 5, (SELECT LoanDate FROM Library.Borrowing WHERE BorrowingRecordID = @NewBorrowID));

        -- Execute the stored procedure to return the book
        EXEC Library.sp_ReturnBook
             @BorrowingRecordIdentifier = @NewBorrowID,
             @ActualReturnDateTime = @ReturnDate;

        COMMIT TRANSACTION;
        
        PRINT N'Book returned successfully.';
        PRINT N'VERIFY: Check book copy status and borrowing record:';
        SELECT BookCopyID, CurrentAvailabilityStatus FROM Library.BookCopies WHERE BookCopyID = @DemoBookCopyID;
        SELECT IsReturnedFlag FROM Library.Borrowing WHERE BorrowingRecordID = @NewBorrowID;
    END
    ELSE
    BEGIN
        PRINT N'WARNING: Skipping book return because the borrowing step failed to get a new BorrowID.';
    END
END TRY
BEGIN CATCH
    -- Rollback the transaction if it's still active
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;
    PRINT N'ERROR: Book return failed! Error: ' + ERROR_MESSAGE();
END CATCH;
PRINT N'';
-- ====================================================================
-- SECTION 3.3: Generate Book Recommendations
-- ====================================================================
PRINT N'--- 3.3: Generating Book Recommendations ---';
PRINT N'First, we will create a specific borrowing history to test the collaborative filtering function.';

BEGIN TRY
    -- Declare variables for the setup
    DECLARE @CollaboratorMemberID INT;
    DECLARE @BookID_Common1 INT = 5;
    DECLARE @BookID_Common2 INT = 6;
    DECLARE @BookID_Recommendation INT = 7;

    DECLARE @CopyID_User1_Book1 INT, @CopyID_User1_Book2 INT;
    DECLARE @CopyID_User2_Book1 INT, @CopyID_User2_Book2 INT, @CopyID_User2_Book3 INT;

    -- Step 1: Find a second user (the "collaborator")
    SELECT TOP 1 @CollaboratorMemberID = LibraryMemberID 
    FROM Library.Members 
    WHERE LibraryMemberID != @DemoLibraryMemberID 
    ORDER BY LibraryMemberID;

    IF @CollaboratorMemberID IS NULL
    BEGIN
        RAISERROR('SETUP FAILED: Could not find a second library member to act as a collaborator.', 16, 1);
    END

    -- Step 2: Find distinct, available copies of the books
    SELECT TOP 1 @CopyID_User1_Book1 = BookCopyID FROM Library.BookCopies WHERE AssociatedBookID = @BookID_Common1 AND CurrentAvailabilityStatus = 1;
    SELECT TOP 1 @CopyID_User1_Book2 = BookCopyID FROM Library.BookCopies WHERE AssociatedBookID = @BookID_Common2 AND CurrentAvailabilityStatus = 1;
    SELECT TOP 1 @CopyID_User2_Book1 = BookCopyID FROM Library.BookCopies WHERE AssociatedBookID = @BookID_Common1 AND CurrentAvailabilityStatus = 1 AND BookCopyID != @CopyID_User1_Book1;
    SELECT TOP 1 @CopyID_User2_Book2 = BookCopyID FROM Library.BookCopies WHERE AssociatedBookID = @BookID_Common2 AND CurrentAvailabilityStatus = 1 AND BookCopyID != @CopyID_User1_Book2;
    SELECT TOP 1 @CopyID_User2_Book3 = BookCopyID FROM Library.BookCopies WHERE AssociatedBookID = @BookID_Recommendation AND CurrentAvailabilityStatus = 1;

    IF @CopyID_User1_Book1 IS NULL OR @CopyID_User1_Book2 IS NULL OR @CopyID_User2_Book1 IS NULL OR @CopyID_User2_Book2 IS NULL OR @CopyID_User2_Book3 IS NULL
    BEGIN
        RAISERROR('SETUP FAILED: Not enough distinct, available book copies for the recommendation scenario.', 16, 1);
    END

    PRINT N'Setup: Found all necessary users and book copies. Inserting historical data...';

    -- Step 3: Insert historical borrowing records.
    -- FIXED: Added 'ReturnDueDate' to the column list and VALUES
    INSERT INTO Library.Borrowing (LibraryMemberID, BorrowedCopyID, LoanDate, ReturnDueDate, IsReturnedFlag) VALUES
    (@DemoLibraryMemberID, @CopyID_User1_Book1, GETDATE()-10, DATEADD(DAY, 14, GETDATE()-10), 1),
    (@DemoLibraryMemberID, @CopyID_User1_Book2, GETDATE()-10, DATEADD(DAY, 14, GETDATE()-10), 1);

    -- FIXED: Added 'ReturnDueDate' to the column list and VALUES
    INSERT INTO Library.Borrowing (LibraryMemberID, BorrowedCopyID, LoanDate, ReturnDueDate, IsReturnedFlag) VALUES
    (@CollaboratorMemberID, @CopyID_User2_Book1, GETDATE()-10, DATEADD(DAY, 14, GETDATE()-10), 1),
    (@CollaboratorMemberID, @CopyID_User2_Book2, GETDATE()-10, DATEADD(DAY, 14, GETDATE()-10), 1),
    (@CollaboratorMemberID, @CopyID_User2_Book3, GETDATE()-10, DATEADD(DAY, 14, GETDATE()-10), 1);
    
    PRINT N'Setup successful: Created historical borrowing data.';
    PRINT N'';
    
    -- Step 4: Now, run the recommendation function
    PRINT N'--- Calling RecommendBooksForStudent ---';
    SELECT * FROM Library.RecommendBooksForStudent(@DemoLibraryMemberID);

    IF @@ROWCOUNT = 0
    BEGIN
       PRINT N'WARNING: The recommendation function returned an empty set. This can happen if the setup data was deleted or changed.';
    END

END TRY
BEGIN CATCH
    PRINT N'ERROR in recommendation setup or execution: ' + ERROR_MESSAGE();
END CATCH;
PRINT N'--- SECTION 3 COMPLETE ---';
PRINT N'';
-- ====================================================================
-- SECTION 4: CROSS-SCHEMA DEACTIVATION
-- Demonstrates student status change and library account deactivation
-- ====================================================================
PRINT N'--- SECTION 4: CROSS-SCHEMA DEACTIVATION ---';

PRINT N'--- 4.1: Checking library account status before graduation ---';
BEGIN TRY
    IF @NewlyRegisteredStudentID IS NOT NULL
    BEGIN
        PRINT N'VERIFY: Initial library account status:';
        SELECT IsMemberAccountActive FROM Library.Members WHERE AssociatedStudentID = @NewlyRegisteredStudentID;
        PRINT N'Library account status checked successfully.';
    END
    ELSE
        PRINT N'WARNING: Skipping library account status check due to missing student ID.';
END TRY
BEGIN CATCH
    PRINT N'WARNING: Library account status check failed. Error: ' + ERROR_MESSAGE();
END CATCH;
PRINT N'';

PRINT N'--- 4.2: Changing student status to graduated ---';
BEGIN TRY
    IF @NewlyRegisteredStudentID IS NOT NULL
    BEGIN
        BEGIN TRANSACTION;
        UPDATE Education.Students
        SET EnrollmentStatus = N'Graduated'
        WHERE UniversityStudentID = @NewlyRegisteredStudentID;
        COMMIT TRANSACTION;
        PRINT N'Student status updated to Graduated.';
        PRINT N'VERIFY: Library account status after graduation:';
        SELECT IsMemberAccountActive FROM Library.Members WHERE AssociatedStudentID = @NewlyRegisteredStudentID;
    END
    ELSE
        PRINT N'WARNING: Skipping status update due to missing student ID.';
END TRY
BEGIN CATCH
    IF (XACT_STATE()) <> 0 ROLLBACK TRANSACTION;
    PRINT N'WARNING: Status update failed. Error: ' + ERROR_MESSAGE();
END CATCH;
PRINT N'--- SECTION 4 COMPLETE ---';
PRINT N'';

PRINT N'--- DEMONSTRATION COMPLETE ---';
PRINT N'All database functionalities demonstrated successfully!';


