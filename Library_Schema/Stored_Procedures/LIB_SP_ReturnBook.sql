USE DB_project;
GO

DROP PROCEDURE IF EXISTS Library.sp_ReturnBook;
GO

CREATE OR ALTER PROCEDURE Library.sp_ReturnBook
    @BorrowingRecordIdentifier INT,
    @ActualReturnDateTime DATE
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Library.Borrowing WHERE BorrowingRecordID = @BorrowingRecordIdentifier)
    BEGIN
        PRINT 'Provided Borrowing Record ID is not valid.';
        RETURN;
    END;

    DECLARE @OriginalDueDate DATE, @BookCopyIdentifier INT, @BorrowingMemberID INT;
    DECLARE @CalculatedDaysLate INT = 0;

    SELECT 
        @OriginalDueDate = ReturnDueDate, 
        @BookCopyIdentifier = BorrowedCopyID, 
        @BorrowingMemberID = LibraryMemberID
    FROM Library.Borrowing
    WHERE BorrowingRecordID = @BorrowingRecordIdentifier;

    SET @CalculatedDaysLate = DATEDIFF(DAY, @OriginalDueDate, @ActualReturnDateTime);

    INSERT INTO Library.Returns (RelatedBorrowingRecordID, ActualReturnDate, IsReturnLateFlag, NumberOfDaysLate)
    VALUES (
        @BorrowingRecordIdentifier,
        @ActualReturnDateTime,
        CASE WHEN @CalculatedDaysLate > 0 THEN 1 ELSE 0 END,
        CASE WHEN @CalculatedDaysLate > 0 THEN @CalculatedDaysLate ELSE 0 END
    );
    
    UPDATE Library.Borrowing
    SET IsReturnedFlag = 1
    WHERE BorrowingRecordID = @BorrowingRecordIdentifier;

    UPDATE Library.BookCopies
    SET CurrentAvailabilityStatus = 1
    WHERE BookCopyID = @BookCopyIdentifier;

    IF @CalculatedDaysLate > 0
    BEGIN
        DECLARE @CalculatedFineAmount DECIMAL(10,2);
        SET @CalculatedFineAmount = @CalculatedDaysLate * 1000;

        INSERT INTO Library.Fines (MemberAccountID, FineAmount, FineDescription)
        VALUES (
            @BorrowingMemberID,
            @CalculatedFineAmount,
            CONCAT('Late return of book copy ID ', @BookCopyIdentifier, ' by ', @CalculatedDaysLate, ' day(s).')
        );
    END;

    PRINT 'Book return process completed successfully.';
END;