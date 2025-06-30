USE DB_project;
GO

DROP FUNCTION IF EXISTS Education.fn_RemainingCredits;
GO

CREATE FUNCTION Education.fn_RemainingCredits
(
    @StudentIDIdentifier INT
)
RETURNS INT
AS
BEGIN
    DECLARE @CompletedCreditUnits INT;

    SELECT @CompletedCreditUnits = ISNULL(SUM(curriculum_info.CourseCreditUnits), 0)
    FROM 
        Education.StudentCourses AS student_course_entry
    JOIN 
        Education.Enrollments AS enrollment_details 
        ON student_course_entry.RelatedEnrollmentID = enrollment_details.CourseEnrollmentID
    JOIN 
        Education.CourseOfferings AS course_schedule 
        ON enrollment_details.EnrolledOfferingID = course_schedule.CourseOfferingID
    JOIN 
        Education.Courses AS curriculum_info 
        ON course_schedule.OfferedCourseID = curriculum_info.CurriculumCourseID
    WHERE 
        enrollment_details.EnrolledStudentID = @StudentIDIdentifier
        AND student_course_entry.CourseCompletionStatus = N'Passed';

    RETURN 140 - @CompletedCreditUnits;
END;