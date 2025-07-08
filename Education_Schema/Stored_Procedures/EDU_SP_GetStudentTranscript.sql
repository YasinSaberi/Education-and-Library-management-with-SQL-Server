USE DB_project;
GO

DROP PROCEDURE IF EXISTS Education.usp_GetStudentTranscript;
GO

CREATE PROCEDURE Education.usp_GetStudentTranscript
    @TargetStudentID INT,
    @AcademicSemesterID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        course_definition.OfficialCourseName,
        course_definition.CourseCreditUnits,
        student_course_record.FinalGrade,
        student_course_record.CourseCompletionStatus
    FROM 
        Education.StudentCourses AS student_course_record
    JOIN 
        Education.Enrollments AS enrollment_detail 
        ON student_course_record.RelatedEnrollmentID = enrollment_detail.CourseEnrollmentID
    JOIN 
        Education.CourseOfferings AS course_offering_info 
        ON enrollment_detail.EnrolledOfferingID = course_offering_info.CourseOfferingID
    JOIN 
        Education.Courses AS course_definition 
        ON course_offering_info.OfferedCourseID = course_definition.CurriculumCourseID
    WHERE 
        enrollment_detail.EnrolledStudentID = @TargetStudentID
        AND course_offering_info.OfferingSemesterID = @AcademicSemesterID;

    INSERT INTO Education.EventLogs (
        EventType,
        AffectedTableName,
        AffectedRecordID,
        EventDetails
    )
    VALUES (
        N'SELECT',
        N'Education.StudentCourses',
        @TargetStudentID,
        N'درخواست کارنامه برای ترم شماره ' + CAST(@AcademicSemesterID AS NVARCHAR(10))
    );
END;
GO