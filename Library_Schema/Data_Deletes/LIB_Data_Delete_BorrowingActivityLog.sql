USE DB_project;
GO

DELETE FROM Library.BorrowingActivityLog;
DBCC CHECKIDENT ('Library.BorrowingActivityLog', RESEED, 0);