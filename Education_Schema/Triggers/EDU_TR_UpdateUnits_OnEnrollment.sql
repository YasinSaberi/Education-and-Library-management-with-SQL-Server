USE DB_project;
GO

DROP TRIGGER IF EXISTS Education.trg_UpdateUnits_OnEnrollment;
GO

CREATE TRIGGER trg_UpdateUnits_OnEnrollment
ON Education.Enrollments
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SemesterUnitAccumulation TABLE (
        StudentEnrollmentID INT,
        CurrentSemesterID INT,
        TotalNewCredits INT
    );

    INSERT INTO @SemesterUnitAccumulation (StudentEnrollmentID, CurrentSemesterID, TotalNewCredits)
    SELECT
        inserted_enrollment.EnrolledStudentID,
        course_offering_detail.OfferingSemesterID,
        SUM(course_curriculum.CourseCreditUnits)
    FROM inserted AS inserted_enrollment
    JOIN Education.CourseOfferings AS course_offering_detail 
        ON inserted_enrollment.EnrolledOfferingID = course_offering_detail.CourseOfferingID
    JOIN Education.Courses AS course_curriculum 
        ON course_offering_detail.OfferedCourseID = course_curriculum.CurriculumCourseID
    GROUP BY 
        inserted_enrollment.EnrolledStudentID, 
        course_offering_detail.OfferingSemesterID;

    INSERT INTO Education.StudentStatusChanges (AffectedStudentID, ReportingSemesterID, UnitsTaken, NewStatusType)
    SELECT
        semester_units.StudentEnrollmentID,
        semester_units.CurrentSemesterID,
        semester_units.TotalNewCredits,
        N'Normal'
    FROM @SemesterUnitAccumulation AS semester_units
    WHERE NOT EXISTS (
        SELECT 1 
        FROM Education.StudentStatusChanges AS existing_entry
        WHERE existing_entry.AffectedStudentID = semester_units.StudentEnrollmentID 
          AND existing_entry.ReportingSemesterID = semester_units.CurrentSemesterID
    );

    UPDATE status_record
    SET status_record.UnitsTaken = status_record.UnitsTaken + semester_units_update.TotalNewCredits
    FROM Education.StudentStatusChanges AS status_record
    JOIN @SemesterUnitAccumulation AS semester_units_update 
        ON status_record.AffectedStudentID = semester_units_update.StudentEnrollmentID 
       AND status_record.ReportingSemesterID = semester_units_update.CurrentSemesterID;
END;