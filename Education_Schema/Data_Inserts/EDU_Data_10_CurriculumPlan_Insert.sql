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

    -- Ensure we have courses to define curriculum for
    IF @CourseCount = 0
    BEGIN
        RAISERROR(N'No courses found in Education.Courses table. Cannot insert curriculum plan.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Insert Curriculum Plan entries (151 entries, as per original project requirement)
    DECLARE @i INT = 0; -- Loop counter from 0 to 150

    WHILE @i < 151
    BEGIN
        DECLARE @MajorProgramID INT = 1; -- Assuming MajorID 1 for Computer Science curriculum
        DECLARE @CourseInCurriculumID INT;
        DECLARE @RecommendedSemesterOrder INT;

        -- Calculate which Course to pick by cycling through @ExistingCourseIDs
        SELECT @CourseInCurriculumID = CourseID FROM @ExistingCourseIDs WHERE RowID = (@i % @CourseCount) + 1;
        
        -- Determine RecommendedSemesterOrder (cycling 1 to 8, or 1 to 9 if needed)
        SET @RecommendedSemesterOrder = (@i % 8) + 1; -- Cycles 1 to 8 based on position

        -- Insert the curriculum plan entry
        INSERT INTO Education.CurriculumPlan (MajorProgramID, CourseInCurriculumID, RecommendedSemesterOrder)
        VALUES (@MajorProgramID, @CourseInCurriculumID, @RecommendedSemesterOrder);

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