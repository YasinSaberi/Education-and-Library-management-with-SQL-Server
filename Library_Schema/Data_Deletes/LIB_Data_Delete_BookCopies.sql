USE DB_project;
GO

DELETE FROM Library.BookCopies;
DBCC CHECKIDENT ('Library.BookCopies', RESEED, 0);