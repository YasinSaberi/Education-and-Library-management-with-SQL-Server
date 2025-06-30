USE DB_project;

DROP TABLE IF EXISTS Library.BookCopies;

CREATE TABLE Library.BookCopies (
    BookCopyID INT PRIMARY KEY IDENTITY(100,1),
    AssociatedBookID INT FOREIGN KEY REFERENCES Library.Books(BookID),
    CopyBarcode NVARCHAR(60) UNIQUE NOT NULL,
    CurrentAvailabilityStatus BIT DEFAULT 1
);