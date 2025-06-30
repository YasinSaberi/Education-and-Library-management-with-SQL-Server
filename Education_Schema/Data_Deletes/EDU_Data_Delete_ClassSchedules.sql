USE DB_project;
GO

DELETE FROM Education.ClassSchedules;
DBCC CHECKIDENT ('Education.ClassSchedules', RESEED, 0);