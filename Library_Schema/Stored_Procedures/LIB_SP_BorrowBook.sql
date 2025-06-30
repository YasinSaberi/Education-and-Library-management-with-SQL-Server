USE DB_project;
GO

CREATE OR ALTER PROCEDURE Library.sp_BorrowBook
    @BorrowingMemberID INT,
    @BorrowedCopyIdentifier INT,
    @ReturnPlannedDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Library.Members WHERE LibraryMemberID = @BorrowingMemberID)
    BEGIN
        PRINT 'Invalid Member ID provided.';
        RETURN;
    END;

    IF NOT EXISTS (SELECT 1 FROM Library.BookCopies WHERE BookCopyID = @BorrowedCopyIdentifier)
    BEGIN
        PRINT 'Invalid Book Copy ID provided.';
        RETURN;
    END;

    IF NOT EXISTS (
        SELECT 1 
        FROM Library.BookCopies
        WHERE BookCopyID = @BorrowedCopyIdentifier AND CurrentAvailabilityStatus = 1
    )
    BEGIN
        PRINT 'The requested book copy is not currently available for borrowing.';
        RETURN;
    END;

    INSERT INTO Library.Borrowing (LibraryMemberID, BorrowedCopyID, ReturnDueDate)
    VALUES (@BorrowingMemberID, @BorrowedCopyIdentifier, @ReturnPlannedDate);

    UPDATE Library.BookCopies
    SET CurrentAvailabilityStatus = 0
    WHERE BookCopyID = @BorrowedCopyIdentifier;

    PRINT 'Book successfully borrowed.';
END;