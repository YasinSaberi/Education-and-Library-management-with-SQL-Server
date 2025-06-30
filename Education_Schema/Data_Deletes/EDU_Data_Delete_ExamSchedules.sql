USE DB_project;
GO

DELETE FROM Education.ExamSchedules;
DBCC CHECKIDENT ('Education.ExamSchedules', RESEED, 0);