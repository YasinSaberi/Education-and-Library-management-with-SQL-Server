USE DB_project;
GO

DROP PROCEDURE IF EXISTS Education.usp_GetSuggestedCourses_PriorityPast;
GO

CREATE PROCEDURE Education.usp_GetSuggestedCourses_PriorityPast
    @StudentIdentifierForSuggestion INT,
    @TargetSemesterSequence INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StudentMajorProgramID INT;

    SELECT @StudentMajorProgramID = ChosenMajorID 
    FROM Education.Students 
    WHERE UniversityStudentID = @StudentIdentifierForSuggestion;

    WITH CompletedCourses AS (
        SELECT DISTINCT course_meta.CurriculumCourseID
        FROM Education.StudentCourses AS student_course_entry
        JOIN Education.Enrollments AS enrollment_record 
            ON student_course_entry.RelatedEnrollmentID = enrollment_record.CourseEnrollmentID
        JOIN Education.CourseOfferings AS course_offering_detail 
            ON enrollment_record.EnrolledOfferingID = course_offering_detail.CourseOfferingID
        JOIN Education.Courses AS course_meta 
            ON course_offering_detail.OfferedCourseID = course_meta.CurriculumCourseID
        WHERE 
            enrollment_record.EnrolledStudentID = @StudentIdentifierForSuggestion 
            AND student_course_entry.CourseCompletionStatus = N'Passed'
    )
    SELECT 
        curriculum_plan_entry.CourseInCurriculumID, 
        course_details.OfficialCourseName, 
        course_details.CourseCreditUnits, 
        curriculum_plan_entry.RecommendedSemesterOrder
    FROM 
        Education.CurriculumPlan AS curriculum_plan_entry
    JOIN 
        Education.Courses AS course_details 
        ON curriculum_plan_entry.CourseInCurriculumID = course_details.CurriculumCourseID
    WHERE 
        curriculum_plan_entry.MajorProgramID = @StudentMajorProgramID
        AND curriculum_plan_entry.RecommendedSemesterOrder <= @TargetSemesterSequence
        AND curriculum_plan_entry.CourseInCurriculumID NOT IN (SELECT CurriculumCourseID FROM CompletedCourses)
    ORDER BY
        CASE 
            WHEN curriculum_plan_entry.RecommendedSemesterOrder < @TargetSemesterSequence THEN 0 
            ELSE 1 
        END,  
        curriculum_plan_entry.RecommendedSemesterOrder,
        curriculum_plan_entry.CourseInCurriculumID;
END;