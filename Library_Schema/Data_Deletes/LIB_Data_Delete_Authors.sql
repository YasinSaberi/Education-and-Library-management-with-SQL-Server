USE DB_project;
GO

DELETE FROM Library.Authors;
DBCC CHECKIDENT ('Library.Authors', RESEED, 0);