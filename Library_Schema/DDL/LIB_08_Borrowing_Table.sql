USE DB_project;
GO

DROP TABLE IF EXISTS Library.Borrowing;

CREATE TABLE Library.Borrowing (
    BorrowingRecordID INT PRIMARY KEY IDENTITY(1,1),
    LibraryMemberID INT FOREIGN KEY REFERENCES Library.Members(LibraryMemberID), -- Corrected column name here
    BorrowedCopyID INT FOREIGN KEY REFERENCES Library.BookCopies(BookCopyID),    -- Corrected column name here
    LoanDate DATE NOT NULL DEFAULT GETDATE(),
    ReturnDueDate DATE NOT NULL,
    IsReturnedFlag INT DEFAULT 0
);