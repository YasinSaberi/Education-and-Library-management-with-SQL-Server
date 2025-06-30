USE DB_project;
GO

DELETE FROM Education.StudentCourses;
DBCC CHECKIDENT ('Education.StudentCourses', RESEED, 0);