USE DB_project;
GO

DELETE FROM Library.Books;
DBCC CHECKIDENT ('Library.Books', RESEED, 0);