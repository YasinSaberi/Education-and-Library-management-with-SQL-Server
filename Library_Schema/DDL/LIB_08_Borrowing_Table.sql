USE DB_project;

DROP TABLE IF EXISTS Library.Borrowing;

CREATE TABLE Library.Borrowing (
    BorrowingRecordID INT PRIMARY KEY IDENTITY(1,1),
    LibraryMemberID INT FOREIGN KEY REFERENCES Library.Members(MemberID),
    BorrowedCopyID INT FOREIGN KEY REFERENCES Library.BookCopies(BookCopyID),
    LoanDate DATE NOT NULL DEFAULT GETDATE(),
    ReturnDueDate DATE NOT NULL,
    IsReturnedFlag INT DEFAULT 0
);