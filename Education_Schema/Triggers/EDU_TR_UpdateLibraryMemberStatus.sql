USE DB_project;
GO

DROP TRIGGER IF EXISTS Education.trg_UpdateMemberIsActive;
GO

CREATE OR ALTER TRIGGER trg_UpdateMemberIsActive
ON Education.Students
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE library_member_profile -- Changed alias to full name for clarity
    SET library_member_profile.IsMemberAccountActive = 0 -- Corrected column name IsActive to IsMemberAccountActive
    FROM 
        Library.Members AS library_member_profile
    INNER JOIN 
        inserted AS updated_student_record -- Renamed alias
        ON library_member_profile.AssociatedStudentID = updated_student_record.UniversityStudentID -- FIX: Corrected column name here
    INNER JOIN 
        deleted AS original_student_state -- Renamed alias
        ON updated_student_record.UniversityStudentID = original_student_state.UniversityStudentID
    WHERE 
        updated_student_record.EnrollmentStatus IN (N'Expelled', N'Graduated', N'Dropped') -- Corrected column name Status_Education to EnrollmentStatus
        AND original_student_state.EnrollmentStatus = N'Active'; -- Corrected column name Status_Education to EnrollmentStatus
END;