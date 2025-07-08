USE DB_project;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    -- Get actual existing Student IDs dynamically
    DECLARE @ExistingStudentIDs TABLE (
        RowID INT IDENTITY(1,1),
        StudentID INT
    );
    INSERT INTO @ExistingStudentIDs (StudentID)
    SELECT UniversityStudentID FROM Education.Students ORDER BY UniversityStudentID;

    DECLARE @StudentCount INT;
    SELECT @StudentCount = COUNT(*) FROM @ExistingStudentIDs;

    IF @StudentCount = 0
    BEGIN
        RAISERROR(N'No students found in Education.Students table. Cannot insert enrollments.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Get actual existing Course Offering IDs dynamically
    DECLARE @ExistingCourseOfferingIDs TABLE (
        RowID INT IDENTITY(1,1),
        OfferingID INT
    );
    INSERT INTO @ExistingCourseOfferingIDs (OfferingID)
    SELECT CourseOfferingID FROM Education.CourseOfferings ORDER BY CourseOfferingID;

    DECLARE @OfferingCount INT;
    SELECT @OfferingCount = COUNT(*) FROM @ExistingCourseOfferingIDs;

    IF @OfferingCount = 0
    BEGIN
        RAISERROR(N'No course offerings found in Education.CourseOfferings table. Cannot insert enrollments.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Insert Enrollments for 300 entries (approximate number of original entries)
    DECLARE @i INT = 0; -- Loop counter from 0 to 299

    WHILE @i < 300
    BEGIN
        DECLARE @EnrolledStudentID INT;
        DECLARE @EnrolledOfferingID INT;
        DECLARE @EnrollmentDate DATETIME;
        DECLARE @EnrollmentStatus NVARCHAR(25) = N'Registered';
        
        -- Calculate which Student and Course Offering to assign by cycling through existing IDs
        SELECT @EnrolledStudentID = StudentID FROM @ExistingStudentIDs WHERE RowID = (@i % @StudentCount) + 1;
        SELECT @EnrolledOfferingID = OfferingID FROM @ExistingCourseOfferingIDs WHERE RowID = (@i % @OfferingCount) + 1;
        
        -- Generate EnrollmentDate
        SET @EnrollmentDate = DATEADD(day, @i, '2024-09-01 10:00:00'); -- Start from a base date and add days

        -- Insert the enrollment
        INSERT INTO Education.Enrollments (EnrolledStudentID, EnrolledOfferingID, DateOfEnrollment, EnrollmentStatus)
        VALUES (@EnrolledStudentID, @EnrolledOfferingID, @EnrollmentDate, @EnrollmentStatus);

        SET @i = @i + 1;
    END;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF (XACT_STATE()) <> 0 
    BEGIN
        ROLLBACK TRANSACTION;
    END;
    THROW;
END CATCH;