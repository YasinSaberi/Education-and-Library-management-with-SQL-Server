USE DB_project;
GO

CREATE TRIGGER trg_AfterInsert_Borrowing
ON Library.Borrowing
AFTER INSERT
AS
BEGIN
    UPDATE BookCopyStatus
    SET BookCopyStatus.CurrentAvailabilityStatus = 0
    FROM Library.BookCopies AS BookCopyStatus
    JOIN inserted AS NewBorrowingRecord ON BookCopyStatus.BookCopyID = NewBorrowingRecord.BorrowedCopyID;
END;