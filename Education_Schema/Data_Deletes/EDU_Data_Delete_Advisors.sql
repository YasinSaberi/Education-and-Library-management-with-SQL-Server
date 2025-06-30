USE DB_project;
GO

DELETE FROM Education.Advisors;
DBCC CHECKIDENT ('Education.Advisors', RESEED, 0);