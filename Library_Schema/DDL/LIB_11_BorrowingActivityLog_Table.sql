USE DB_project;

DROP TABLE IF EXISTS Library.BorrowingActivityLog;

CREATE TABLE Library.BorrowingActivityLog (
    ActivityLogID INT PRIMARY KEY IDENTITY(1,1),
    RelatedBorrowingID INT,
    RelatedMemberID INT,
    RelatedCopyID INT,
    LogActivityType NVARCHAR(120),
    LogTimestamp DATETIME DEFAULT GETDATE()
);