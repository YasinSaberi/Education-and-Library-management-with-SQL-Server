USE DB_project;
GO

DROP TRIGGER IF EXISTS Education.trg_UpdateStudentCourseStatus;
GO

CREATE TRIGGER trg_UpdateStudentCourseStatus
ON Education.StudentCourses
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE CourseRecord
    SET CourseRecord.CourseCompletionStatus = 
        CASE 
            WHEN UpdatedInfo.FinalGrade IS NOT NULL AND UpdatedInfo.FinalGrade >= 10 THEN N'Passed'
            WHEN UpdatedInfo.FinalGrade IS NOT NULL AND UpdatedInfo.FinalGrade < 10 THEN N'Failed'
            ELSE CourseRecord.CourseCompletionStatus
        END
    FROM Education.StudentCourses AS CourseRecord
    JOIN inserted AS UpdatedInfo ON CourseRecord.StudentCourseRecordID = UpdatedInfo.StudentCourseRecordID;
END;