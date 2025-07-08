USE DB_project;
GO

DROP PROCEDURE IF EXISTS Education.usp_UpdateStudentGrade;
GO

CREATE PROCEDURE Education.usp_UpdateStudentGrade
    @CourseRecordIdentifier INT,
    @NewGradeValue DECIMAL(4,2)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Education.StudentCourses
        SET FinalGrade = @NewGradeValue,
            CourseCompletionStatus = CASE WHEN @NewGradeValue >= 10 THEN N'Passed' ELSE N'Failed' END
        WHERE StudentCourseRecordID = @CourseRecordIdentifier;

        INSERT INTO Education.EventLogs (
            EventType,
            AffectedTableName,
            AffectedRecordID,
            EventDetails
        )
        VALUES (
            N'UPDATE',
            N'Education.StudentCourses',
            @CourseRecordIdentifier,
            N'Grade updated to ' + CAST(@NewGradeValue AS NVARCHAR(10)) + N' and course status changed.'
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO