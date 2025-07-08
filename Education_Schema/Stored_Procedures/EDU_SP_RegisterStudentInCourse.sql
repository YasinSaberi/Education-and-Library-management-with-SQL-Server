USE DB_project;
GO

DROP PROCEDURE IF EXISTS Education.usp_RegisterStudentInCourse;
GO

CREATE PROCEDURE Education.usp_RegisterStudentInCourse
    @TargetStudentID INT,
    @CourseOfferingToRegisterID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Education.Enrollments (EnrolledStudentID, EnrolledOfferingID)
        VALUES (@TargetStudentID, @CourseOfferingToRegisterID);

        DECLARE @NewlyCreatedEnrollmentID INT = SCOPE_IDENTITY();

        INSERT INTO Education.EventLogs (
            EventType,
            AffectedTableName,
            AffectedRecordID,
            EventDetails
        )
        VALUES (
            N'INSERT',
            N'Education.Enrollments',
            @NewlyCreatedEnrollmentID,
            N'Student enrollment in course offering (OfferingID = ' + CAST(@CourseOfferingToRegisterID AS NVARCHAR(10)) + N') has been recorded.'
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF (XACT_STATE()) <> 0 
        BEGIN
            ROLLBACK TRANSACTION;
        END;
        THROW;
    END CATCH
END;
GO