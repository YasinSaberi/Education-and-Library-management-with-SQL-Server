USE DB_project;
GO

DROP TRIGGER IF EXISTS Library.trg_Borrow_Log_UpdateIsReturnd;
GO

CREATE OR ALTER TRIGGER trg_Borrow_Log_UpdateIsReturnd
ON Library.Borrowing
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Library.BorrowingActivityLog (RelatedBorrowingID, RelatedMemberID, RelatedCopyID, LogActivityType)
    SELECT 
        current_borrow.BorrowingRecordID, 
        current_borrow.LibraryMemberID, 
        current_borrow.BorrowedCopyID, 
        N'Returned'
    FROM 
        inserted AS current_borrow
    INNER JOIN 
        deleted AS previous_borrow 
        ON current_borrow.BorrowingRecordID = previous_borrow.BorrowingRecordID
    WHERE 
        previous_borrow.IsReturnedFlag = 0 
        AND current_borrow.IsReturnedFlag = 1;
END;