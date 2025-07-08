USE DB_project;
GO

-- Drop old function name if it exists (fn_GetStudentGPA)
DROP FUNCTION IF EXISTS Education.fn_GetStudentGPA; 
GO
-- Drop the new function name (CalculateStudentGPA) in case it was partially created
DROP FUNCTION IF EXISTS Education.CalculateStudentGPA; 
GO

CREATE FUNCTION Education.CalculateStudentGPA -- CORRECTED: Function name changed to CalculateStudentGPA
(
    @StudentIdentifier INT,
    @AcademicTermIdentifier INT
)
RETURNS DECIMAL(4,2)
AS
BEGIN
    DECLARE @CalculatedGPA DECIMAL(4,2);

    SELECT @CalculatedGPA = 
        CASE 
            WHEN SUM(course_data.CourseCreditUnits) = 0 THEN NULL
            ELSE CAST(SUM(student_course.FinalGrade * course_data.CourseCreditUnits) AS FLOAT) / SUM(course_data.CourseCreditUnits)
        END
    FROM 
        Education.StudentCourses AS student_course
    JOIN 
        Education.Enrollments AS enroll_info 
        ON student_course.RelatedEnrollmentID = enroll_info.CourseEnrollmentID
    JOIN 
        Education.CourseOfferings AS course_offer 
        ON enroll_info.EnrolledOfferingID = course_offer.CourseOfferingID
    JOIN 
        Education.Courses AS course_data 
        ON course_offer.OfferedCourseID = course_data.CurriculumCourseID
    WHERE 
        enroll_info.EnrolledStudentID = @StudentIdentifier
        AND course_offer.OfferingSemesterID = @AcademicTermIdentifier
        AND student_course.FinalGrade IS NOT NULL;

    RETURN @CalculatedGPA;
END;
GO