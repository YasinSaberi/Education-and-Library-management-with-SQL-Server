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

    -- Ensure we have course offerings to schedule
    IF @OfferingCount = 0
    BEGIN
        RAISERROR(N'No course offerings found in Education.CourseOfferings table. Cannot insert class schedules.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Generate Class Schedules for 300 entries
    DECLARE @i INT = 0; -- Loop counter from 0 to 299

    -- Days of Week pattern (for cycling through schedules)
    DECLARE @DaysOfWeek TABLE (Idx INT PRIMARY KEY, DayName NVARCHAR(15));
    INSERT INTO @DaysOfWeek (Idx, DayName) VALUES
    (0, N'Monday'), (1, N'Tuesday'), (2, N'Wednesday'), (3, N'Sunday'), (4, N'Saturday'); 
    DECLARE @DayCount INT = 5;

    -- Times (for cycling through schedule times)
    DECLARE @StartTimes TABLE (Idx INT PRIMARY KEY, TimeValue TIME);
    INSERT INTO @StartTimes (Idx, TimeValue) VALUES
    (0, '08:00:00'), (1, '09:30:00'), (2, '11:00:00'), (3, '12:30:00'), (4, '14:00:00'), (5, '15:30:00');
    DECLARE @TimeCount INT = 6;

    -- Durations (for cycling through class durations)
    DECLARE @Durations TABLE (Idx INT PRIMARY KEY, EndTimeOffsetMinutes INT);
    INSERT INTO @Durations (Idx, EndTimeOffsetMinutes) VALUES
    (0, 90), (1, 90), (2, 90), (3, 90), (4, 90), (5, 90); -- All 1 hour 30 mins
    DECLARE @DurationCount INT = 6;


    WHILE @i < 300
    BEGIN
        DECLARE @CurrentCourseOfferingID INT;
        DECLARE @ScheduledDay NVARCHAR(15);
        DECLARE @ScheduleStartTime TIME;
        DECLARE @ScheduleEndTime TIME;
        DECLARE @ClassroomLocation NVARCHAR(150);
        
        -- Get IDs and values by cycling through existing data
        SELECT @CurrentCourseOfferingID = OfferingID FROM @ExistingCourseOfferingIDs WHERE RowID = (@i % @OfferingCount) + 1;
        SELECT @ScheduledDay = DayName FROM @DaysOfWeek WHERE Idx = (@i % @DayCount);
        SELECT @ScheduleStartTime = TimeValue FROM @StartTimes WHERE Idx = (@i % @TimeCount);
        SELECT @ScheduleEndTime = DATEADD(minute, EndTimeOffsetMinutes, @ScheduleStartTime) FROM @Durations WHERE Idx = (@i % @DurationCount);
        
        -- Generate simple cycling locations
        DECLARE @LocationRoomNumber INT = (@i % 20) + 101; -- Rooms 101 to 120
        DECLARE @LocationBuildingCode NVARCHAR(10) = CASE (@i / 20) % 5
                                                        WHEN 0 THEN N'A'
                                                        WHEN 1 THEN N'B'
                                                        WHEN 2 THEN N'C'
                                                        WHEN 3 THEN N'D'
                                                        WHEN 4 THEN N'E' END;
        SET @ClassroomLocation = N'Building ' + @LocationBuildingCode + N' - Room ' + CAST(@LocationRoomNumber AS NVARCHAR(10));

        -- Insert the class schedule
        INSERT INTO Education.ClassSchedules (CourseOfferingID, ScheduledDay, ScheduleStartTime, ScheduleEndTime, ClassroomLocation)
        VALUES (@CurrentCourseOfferingID, @ScheduledDay, @ScheduleStartTime, @ScheduleEndTime, @ClassroomLocation);

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