USE DB_project;
GO

DROP TRIGGER IF EXISTS Education.trg_InsertLibraryMember_OnNewStudent;
GO 

CREATE TRIGGER trg_InsertLibraryMember_OnNewStudent
ON Education.Students
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Library.Members (AssociatedStudentID, MemberFullName)
    SELECT 
        newly_enrolled_student.UniversityStudentID,
        newly_enrolled_student.StudentFirstName + N' ' + newly_enrolled_student.StudentLastName
    FROM inserted AS newly_enrolled_student;
END;
GO 