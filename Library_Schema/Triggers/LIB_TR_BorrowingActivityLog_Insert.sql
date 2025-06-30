USE DB_project;
GO

CREATE TRIGGER trg_Borrow_Log_Insert
ON Library.Borrowing
AFTER INSERT
AS
BEGIN
    INSERT INTO Library.BorrowingActivityLog (RelatedBorrowingID, RelatedMemberID, RelatedCopyID, LogActivityType)
    SELECT 
        new_borrow_entry.BorrowingRecordID, 
        new_borrow_entry.LibraryMemberID, 
        new_borrow_entry.BorrowedCopyID, 
        N'Borrowed'
    FROM 
        inserted AS new_borrow_entry;
END;