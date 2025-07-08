USE DB_project;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    -- Get actual existing Course IDs dynamically
    DECLARE @ExistingCourseIDs TABLE (
        RowID INT IDENTITY(1,1),
        CourseID INT
    );
    INSERT INTO @ExistingCourseIDs (CourseID)
    SELECT CurriculumCourseID FROM Education.Courses ORDER BY CurriculumCourseID;

    DECLARE @CourseCount INT;
    SELECT @CourseCount = COUNT(*) FROM @ExistingCourseIDs;

    IF @CourseCount = 0
    BEGIN
        RAISERROR(N'No courses found in Education.Courses table. Cannot insert course offerings.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Get actual existing Instructor IDs dynamically
    DECLARE @ExistingInstructorIDs TABLE (
        RowID INT IDENTITY(1,1),
        InstructorID INT
    );
    INSERT INTO @ExistingInstructorIDs (InstructorID)
    SELECT FacultyMemberID FROM Education.Instructors ORDER BY FacultyMemberID;

    DECLARE @InstructorCount INT;
    SELECT @InstructorCount = COUNT(*) FROM @ExistingInstructorIDs;

    IF @InstructorCount = 0
    BEGIN
        RAISERROR(N'No instructors found in Education.Instructors table. Cannot insert course offerings.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Get actual existing Semester IDs dynamically (assuming they are 1-9 as per DDL)
    DECLARE @ExistingSemesterIDs TABLE (
        RowID INT IDENTITY(1,1),
        SemesterID INT 
    );
    INSERT INTO @ExistingSemesterIDs (SemesterID)
    SELECT AcademicTermID FROM Education.Semesters ORDER BY AcademicTermID;
    
    DECLARE @SemesterCount INT;
    SELECT @SemesterCount = COUNT(*) FROM @ExistingSemesterIDs;

    -- Insert CourseOfferings for 302 entries (151 unique courses * 2 offerings)
    DECLARE @i INT = 0; -- Loop counter from 0 to 301

    WHILE @i < 302
    BEGIN
        DECLARE @OfferedCourseID INT;
        DECLARE @AssignedInstructorID INT;
        DECLARE @OfferingSemesterID INT;
        DECLARE @Capacity INT = 40; 

        -- Calculate which Course, Instructor, and Semester to assign by cycling through existing IDs
        SELECT @OfferedCourseID = CourseID FROM @ExistingCourseIDs WHERE RowID = ((@i / 2) % @CourseCount) + 1;
        SELECT @AssignedInstructorID = InstructorID FROM @ExistingInstructorIDs WHERE RowID = (@i % @InstructorCount) + 1;
        SELECT @OfferingSemesterID = SemesterID FROM @ExistingSemesterIDs WHERE RowID = (@i % @SemesterCount) + 1;

        -- Insert the offering
        INSERT INTO Education.CourseOfferings (OfferedCourseID, OfferingSemesterID, AssignedInstructorID, EnrollmentCapacity)
        VALUES (@OfferedCourseID, @OfferingSemesterID, @AssignedInstructorID, @Capacity);

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