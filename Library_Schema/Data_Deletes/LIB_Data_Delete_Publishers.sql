USE DB_project;
GO

DELETE FROM Library.Publishers;
DBCC CHECKIDENT ('Library.Publishers', RESEED, 0);