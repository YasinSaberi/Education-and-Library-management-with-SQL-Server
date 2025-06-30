USE DB_project;
GO

DELETE FROM Library.Borrowing;
DBCC CHECKIDENT ('Library.Borrowing', RESEED, 0);