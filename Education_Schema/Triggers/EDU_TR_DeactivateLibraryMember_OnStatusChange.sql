USE DB_project;
GO

DROP TRIGGER IF EXISTS Education.trg_DeactivateLibraryMember_OnStatusChange;
GO -- This GO is crucial for separating the DROP from the CREATE

CREATE TRIGGER trg_DeactivateLibraryMember_OnStatusChange
ON Education.Students
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE library_member_profile
    SET library_member_profile.IsMemberAccountActive = 0
    FROM 
        Library.Members AS library_member_profile
    INNER JOIN 
        inserted AS updated_student_record 
        ON library_member_profile.AssociatedStudentID = updated_student_record.UniversityStudentID
    INNER JOIN 
        deleted AS original_student_state 
        ON updated_student_record.UniversityStudentID = original_student_state.UniversityStudentID
    WHERE 
        updated_student_record.EnrollmentStatus IN (N'Expelled', N'Graduated', N'Dropped') 
        AND original_student_state.EnrollmentStatus = N'Active';
END;
GO -- This GO is crucial to end the trigger definition batch