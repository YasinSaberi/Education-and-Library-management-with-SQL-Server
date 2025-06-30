USE DB_project;
GO

DELETE FROM Education.Semesters;
DBCC CHECKIDENT ('Education.Semesters', RESEED, 0);