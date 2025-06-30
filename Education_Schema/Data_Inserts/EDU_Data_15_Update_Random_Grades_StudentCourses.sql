USE DB_project;
GO

DECLARE @currentRecordID INT = 1;

WHILE @currentRecordID <= 593
BEGIN
    UPDATE Education.StudentCourses
    SET FinalGrade = ROUND(RAND(CHECKSUM(NEWID())) * 20, 2)
    WHERE StudentCourseRecordID = @currentRecordID;

    SET @currentRecordID += 1;
END;