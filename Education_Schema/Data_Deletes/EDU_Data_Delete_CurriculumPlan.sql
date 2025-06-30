USE DB_project;
GO

DELETE FROM Education.CurriculumPlan;
DBCC CHECKIDENT ('Education.CurriculumPlan', RESEED, 0);