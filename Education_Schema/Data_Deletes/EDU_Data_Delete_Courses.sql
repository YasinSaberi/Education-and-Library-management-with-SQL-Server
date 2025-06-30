USE DB_project;
GO

DELETE FROM Education.Courses;
DBCC CHECKIDENT ('Education.Courses', RESEED, 0);