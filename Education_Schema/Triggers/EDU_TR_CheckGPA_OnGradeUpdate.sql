USE DB_project;
GO

DROP TRIGGER IF EXISTS Education.trg_CheckGPA_OnGradeUpdate;
GO

CREATE TRIGGER trg_CheckGPA_OnGradeUpdate
ON Education.StudentCourses
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE StatusRecords
    SET
        GradePointAverage = Education.CalculateStudentGPA(RelevantEntities.StudentIdentifier, RelevantEntities.SemesterIdentifier),
        NewStatusType = Education.CalculateSemesterStatus(Education.CalculateStudentGPA(RelevantEntities.StudentIdentifier, RelevantEntities.SemesterIdentifier))
    FROM
        Education.StudentStatusChanges AS StatusRecords
    JOIN
        (
            SELECT DISTINCT
                Enr.EnrolledStudentID AS StudentIdentifier,
                CoOff.OfferingSemesterID AS SemesterIdentifier
            FROM
                inserted AS NewCourseEntry
            JOIN
                Education.Enrollments AS Enr
                ON NewCourseEntry.RelatedEnrollmentID = Enr.CourseEnrollmentID
            JOIN
                Education.CourseOfferings AS CoOff
                ON Enr.EnrolledOfferingID = CoOff.CourseOfferingID
            WHERE
                NewCourseEntry.FinalGrade IS NOT NULL
        ) AS RelevantEntities
        ON StatusRecords.AffectedStudentID = RelevantEntities.StudentIdentifier
        AND StatusRecords.ReportingSemesterID = RelevantEntities.SemesterIdentifier;
END;