USE DB_project;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    -- Get actual existing Library Member IDs dynamically
    DECLARE @ExistingMemberIDs TABLE (
        RowID INT IDENTITY(1,1),
        MemberID INT
    );
    INSERT INTO @ExistingMemberIDs (MemberID)
    SELECT LibraryMemberID FROM Library.Members ORDER BY LibraryMemberID;

    DECLARE @MemberCount INT;
    SELECT @MemberCount = COUNT(*) FROM @ExistingMemberIDs;

    IF @MemberCount = 0
    BEGIN
        RAISERROR(N'No library members found in Library.Members table. Cannot insert borrowings.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Get actual existing Book Copy IDs dynamically
    DECLARE @ExistingBookCopyIDs TABLE (
        RowID INT IDENTITY(1,1),
        CopyID INT
    );
    INSERT INTO @ExistingBookCopyIDs (CopyID)
    SELECT BookCopyID FROM Library.BookCopies ORDER BY BookCopyID;

    DECLARE @CopyCount INT;
    SELECT @CopyCount = COUNT(*) FROM @ExistingBookCopyIDs;

    IF @CopyCount = 0
    BEGIN
        RAISERROR(N'No book copies found in Library.BookCopies table. Cannot insert borrowings.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    -- Insert Borrowing data for 15 entries (as per original script)
    DECLARE @i INT = 0; -- Loop counter from 0 to 14

    WHILE @i < 15
    BEGIN
        DECLARE @LibraryMemberID INT;
        DECLARE @BorrowedCopyID INT;
        DECLARE @LoanDate DATE;
        DECLARE @ReturnDueDate DATE;
        
        -- Get MemberID and CopyID by cycling through existing IDs
        SELECT @LibraryMemberID = MemberID FROM @ExistingMemberIDs WHERE RowID = (@i % @MemberCount) + 1;
        SELECT @BorrowedCopyID = CopyID FROM @ExistingBookCopyIDs WHERE RowID = (@i % @CopyCount) + 1;
        
        -- Generate LoanDate and DueDate (mimicking original relative dates)
        -- Cycle through statuses: overdue, due soon, current/future
        IF @i % 5 = 0 SET @LoanDate = DATEADD(DAY, -45, GETDATE()); -- Overdue (45 days ago)
        ELSE IF @i % 5 = 1 SET @LoanDate = DATEADD(DAY, -30, GETDATE()); -- Overdue (30 days ago)
        ELSE IF @i % 5 = 2 SET @LoanDate = DATEADD(DAY, -10, GETDATE()); -- Overdue (10 days ago)
        ELSE IF @i % 5 = 3 SET @LoanDate = DATEADD(DAY, -5, GETDATE());  -- Due soon (5 days ago)
        ELSE SET @LoanDate = GETDATE(); -- Today

        SET @ReturnDueDate = DATEADD(DAY, 14, @LoanDate); -- Due 14 days after loan date

        -- Adjust overdue DueDates to be in the past, matching the original logic
        IF @LoanDate < CAST(GETDATE() AS DATE) AND @ReturnDueDate >= CAST(GETDATE() AS DATE) AND @i % 5 IN (0,1,2,3) 
        BEGIN
            -- If it was meant to be overdue/due soon, make DueDate reflect that from GETDATE()
            IF @i % 5 = 0 SET @ReturnDueDate = DATEADD(DAY, -30, CAST(GETDATE() AS DATE)); 
            ELSE IF @i % 5 = 1 SET @ReturnDueDate = DATEADD(DAY, -15, CAST(GETDATE() AS DATE));
            ELSE IF @i % 5 = 2 SET @ReturnDueDate = DATEADD(DAY, -5, CAST(GETDATE() AS DATE));
            ELSE IF @i % 5 = 3 SET @ReturnDueDate = DATEADD(DAY, 2, CAST(GETDATE() AS DATE)); -- Due in 2 days from GETDATE()
        END
        
        -- Insert the borrowing record
        INSERT INTO Library.Borrowing (LibraryMemberID, BorrowedCopyID, LoanDate, ReturnDueDate)
        VALUES (@LibraryMemberID, @BorrowedCopyID, @LoanDate, @ReturnDueDate);

        SET @i = @i + 1;
    END;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF (XACT_STATE()) <> 0 
    BEGIN
        ROLLBACK TRANSACTION;
    END;
    THROW;
END CATCH;