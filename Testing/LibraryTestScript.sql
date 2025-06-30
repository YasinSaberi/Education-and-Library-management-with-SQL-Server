USE DB_project;
GO

SELECT *
FROM Library.Members;

SELECT *
FROM Library.Authors;

SELECT *
FROM Library.Publishers;

SELECT *
FROM Library.Categories;

SELECT *
FROM Library.Books;

-- Test borrowing a book
DECLARE @PlannedDueDate DATE = CAST(DATEADD(DAY, 2, GETDATE()) AS DATE);

EXEC Library.sp_BorrowBook 
    @BorrowingMemberID = 1,  -- MemberID 1 should exist from LIB_Data_07_Members_Insert.sql
    @BorrowedCopyIdentifier = 1,  -- BookCopyID 1 should exist from LIB_Data_06_BookCopies_Insert.sql
    @ReturnPlannedDate = @PlannedDueDate;

SELECT *
FROM Library.Borrowing;

-- Test returning a book (assuming BorrowingRecordID 2 exists and is not yet returned)
DECLARE @ActualReturnDate DATE = GETDATE();

EXEC Library.sp_ReturnBook 
    @BorrowingRecordIdentifier = 2, -- Adjust this ID if needed based on your Borrowing data
    @ActualReturnDateTime = @ActualReturnDate;

SELECT *
FROM Library.Returns;

-- Test sending due reminders
EXEC Library.proc_send_due_reminders;

SELECT * FROM Library.LibraryActivityLog 
WHERE LogEntryType = N'Reminder' -- Check for 'Reminder' as per modified SP
ORDER BY ActivityLogEntryID DESC;

SELECT *
FROM Library.Fines;

SELECT *
FROM Library.BookCopies;

SELECT *
FROM Library.BookAuthors;

-- Test Library functions
SELECT * FROM Library.fn_MemberBorrowingHistory(1); -- MemberID 1

SELECT * FROM Library.fn_Top5BorrowedCopies();

SELECT * FROM Library.filterCategory(N'Programming & Development'); -- Use a new category name