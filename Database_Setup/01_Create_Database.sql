USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'DB_project')
BEGIN
    ALTER DATABASE DB_project SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DB_project;
END;
GO

CREATE DATABASE DB_project;
GO

USE DB_project;
GO