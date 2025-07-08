USE DB_project;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    -- Get actual existing Course Offering IDs dynamically
    DECLARE @ExistingCourseOfferingIDs TABLE (
        RowID INT IDENTITY(1,1),
        OfferingID INT
    );
    INSERT INTO @ExistingCourseOfferingIDs (OfferingID)
    SELECT CourseOfferingID FROM Education.CourseOfferings ORDER BY CourseOfferingID;

    DECLARE @OfferingCount INT;
    SELECT @OfferingCount = COUNT(*) FROM @ExistingCourseOfferingIDs;

    -- Ensure we have course offerings to schedule exams for
    IF @OfferingCount = 0
    BEGIN
        RAISERROR(N'No course offerings found in Education.CourseOfferings table. Cannot insert exam schedules.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Generate Exam Schedules for 300 entries
    DECLARE @i INT = 0; -- Loop counter from 0 to 299

    -- Define common exam times/durations
    DECLARE @ExamStartTimes TABLE (Idx INT PRIMARY KEY, TimeValue TIME);
    INSERT INTO @ExamStartTimes (Idx, TimeValue) VALUES
    (0, '08:30:00'), (1, '10:00:00'), (2, '13:00:00'), (3, '15:00:00');
    DECLARE @StartTimeCount INT = 4;

    DECLARE @ExamDurations TABLE (Idx INT PRIMARY KEY, DurationMinutes INT);
    INSERT INTO @ExamDurations (Idx, DurationMinutes) VALUES
    (0, 90), (1, 120), (2, 150); -- 1.5hr, 2hr, 2.5hr
    DECLARE @DurationCount INT = 3;

    -- Example locations (cycling through them)
    DECLARE @Locations TABLE (Idx INT PRIMARY KEY, LocationName NVARCHAR(150));
    INSERT INTO @Locations (Idx, LocationName) VALUES
    (0, N'Main Exam Hall A'), (1, N'Science Building Auditorium'), (2, N'Engineering Lecture Hall 1'), (3, N'Arts & Humanities Building G4'), (4, N'Library Conference Room');
    DECLARE @LocationCount INT = 5;

    WHILE @i < 300
    BEGIN
        DECLARE @CurrentScheduledOfferingID INT;
        DECLARE @ExamDateParam DATE; -- Variable for ExaminationDate
        DECLARE @Exam_StartTime TIME;
        DECLARE @Exam_EndTime TIME;
        DECLARE @ExamLocationParam NVARCHAR(150); -- Variable for ExaminationLocation
        
        -- Get IDs and values by cycling
        SELECT @CurrentScheduledOfferingID = OfferingID FROM @ExistingCourseOfferingIDs WHERE RowID = (@i % @OfferingCount) + 1;
        
        -- Generate exam date: Cycle through months, keep year mostly 2026/2027 based on current time
        DECLARE @YearCycle INT = (@i / 100) % 2; 
        DECLARE @CurrentYear INT = YEAR(GETDATE()) + @YearCycle; 
        DECLARE @MonthOffset INT = (@i % 100) / 33; 
        
        IF @MonthOffset = 0 SET @ExamDateParam = DATEFROMPARTS(@CurrentYear, 1, 10 + (@i % 10)); 
        ELSE IF @MonthOffset = 1 SET @ExamDateParam = DATEFROMPARTS(@CurrentYear, 5, 15 + (@i % 10)); 
        ELSE SET @ExamDateParam = DATEFROMPARTS(@CurrentYear, 9, 1 + (@i % 10)); 

        SELECT @Exam_StartTime = TimeValue FROM @ExamStartTimes WHERE Idx = (@i % @StartTimeCount);
        DECLARE @CurrentDurationMinutes INT;
        SELECT @CurrentDurationMinutes = DurationMinutes FROM @ExamDurations WHERE Idx = (@i % @DurationCount);
        SET @Exam_EndTime = DATEADD(minute, @CurrentDurationMinutes, @Exam_StartTime);

        SELECT @ExamLocationParam = LocationName FROM @Locations WHERE Idx = (@i % @LocationCount);

        -- Insert the exam schedule (using new column names and new variable names)
        INSERT INTO Education.ExamSchedules (ScheduledOfferingID, ExaminationDate, ExamStartTime, ExamEndTime, ExaminationLocation)
        VALUES (@CurrentScheduledOfferingID, @ExamDateParam, @Exam_StartTime, @Exam_EndTime, @ExamLocationParam);

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