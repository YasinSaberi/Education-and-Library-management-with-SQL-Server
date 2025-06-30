USE DB_project;
GO

CREATE FUNCTION Library.fn_MemberBorrowingHistory(@LibraryCardMemberID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        loan_record.BorrowingRecordID,
        book_copy.BookCopyID,
        book_info.BookID,
        book_info.BookTitle,
        loan_record.LoanDate,
        loan_record.ReturnDueDate
    FROM 
        Library.Borrowing AS loan_record
    JOIN 
        Library.BookCopies AS book_copy 
        ON loan_record.BorrowedCopyID = book_copy.BookCopyID
    JOIN 
        Library.Books AS book_info 
        ON book_copy.AssociatedBookID = book_info.BookID
    WHERE 
        loan_record.LibraryMemberID = @LibraryCardMemberID
);