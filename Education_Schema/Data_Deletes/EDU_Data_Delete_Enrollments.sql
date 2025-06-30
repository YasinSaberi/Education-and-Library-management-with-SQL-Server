USE DB_project;
GO

DELETE FROM Education.Enrollments;
DBCC CHECKIDENT ('Education.Enrollments', RESEED, 0);