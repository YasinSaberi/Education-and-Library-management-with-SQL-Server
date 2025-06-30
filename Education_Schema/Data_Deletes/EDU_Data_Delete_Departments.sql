USE DB_project;
GO

DELETE FROM Education.Departments;
DBCC CHECKIDENT ('Education.Departments', RESEED, 0);