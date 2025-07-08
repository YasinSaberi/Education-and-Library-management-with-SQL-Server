USE DB_project;
GO

DELETE FROM Library.Returns;
DBCC CHECKIDENT ('Library.Returns', RESEED, 0);