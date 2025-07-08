USE DB_project;
GO

DROP TRIGGER IF EXISTS Education.trg_Insert_StudentCourses;
GO

CREATE TRIGGER trg_Insert_StudentCourses
ON Education.Enrollments
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Education.StudentCourses (RelatedEnrollmentID)
    SELECT 
        new_enrollment.CourseEnrollmentID
    FROM 
        inserted AS new_enrollment
    WHERE 
        new_enrollment.EnrollmentStatus = N'Registered';
END;