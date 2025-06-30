USE DB_project;
GO

CREATE FUNCTION Library.fn_Top5BorrowedCopies()
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 5 
        loan_info.BorrowedCopyID, 
        COUNT(*) AS BorrowCount
    FROM 
        Library.Borrowing AS loan_info
    GROUP BY 
        loan_info.BorrowedCopyID
    ORDER BY 
        COUNT(*) DESC
);