USE DB_project;
GO

CREATE TRIGGER Library.trg_prevent_deactivate_active_member
ON Library.Members
INSTEAD OF UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted AS updated_member_data
        JOIN deleted AS original_member_data 
            ON updated_member_data.LibraryMemberID = original_member_data.LibraryMemberID
        WHERE 
            updated_member_data.IsMemberAccountActive = 0 
            AND original_member_data.IsMemberAccountActive = 1
            AND EXISTS (
                SELECT 1
                FROM Library.Borrowing AS loan_record
                WHERE 
                    loan_record.LibraryMemberID = updated_member_data.LibraryMemberID
                    AND loan_record.IsReturnedFlag = 0
            )
    )
    BEGIN
        RAISERROR(N'This member has unreturned borrowed books and cannot be deactivated.', 16, 1);
        RETURN;
    END;

    UPDATE existing_member
    SET
        existing_member.AssociatedStudentID    = updated_member_data.AssociatedStudentID,
        existing_member.MemberFullName         = updated_member_data.MemberFullName,
        existing_member.RegistrationDate       = updated_member_data.RegistrationDate,
        existing_member.IsMemberAccountActive  = updated_member_data.IsMemberAccountActive
    FROM 
        Library.Members AS existing_member
    INNER JOIN 
        inserted AS updated_member_data 
        ON existing_member.LibraryMemberID = updated_member_data.LibraryMemberID;
END;