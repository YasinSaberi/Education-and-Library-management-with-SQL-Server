USE DB_project;
GO

DROP TABLE IF EXISTS Library.BorrowingActivityLog;
GO

CREATE TABLE Library.BorrowingActivityLog (
    ActivityLogEntryID INT PRIMARY KEY IDENTITY(1,1),
    RelatedBorrowingID INT,
    RelatedMemberID INT,
    RelatedCopyID INT,
    LogActivityType NVARCHAR(120),
    LogTimestamp DATETIME DEFAULT GETDATE()
);
GO