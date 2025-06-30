USE DB_project;

DROP TABLE IF EXISTS Library.Returns;

CREATE TABLE Library.Returns (
    BookReturnID INT PRIMARY KEY IDENTITY(1,1),
    RelatedBorrowingRecordID INT FOREIGN KEY REFERENCES Library.Borrowing(BorrowingRecordID),
    ActualReturnDate DATE NOT NULL,
    IsReturnLateFlag BIT,
    NumberOfDaysLate INT
);