USE master;
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AdminRole')
    CREATE ROLE AdminRole;
GO

CREATE LOGIN AdminLogin1 WITH PASSWORD = 'StrongPassword@123', CHECK_POLICY = OFF;

USE DB_project;
GO

CREATE USER AdminUser1 FOR LOGIN AdminLogin1;

ALTER ROLE AdminRole ADD MEMBER AdminUser1;

REVOKE EXECUTE ON Education.usp_RegisterStudentWithAddress FROM PUBLIC;
GO

GRANT EXECUTE ON Education.usp_RegisterStudentWithAddress TO AdminRole;
GO

USE master;
GO

CREATE LOGIN StudentLogin1 WITH PASSWORD = 'StudentPass@123', CHECK_POLICY = OFF;
GO

USE DB_project;
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'StudentRole')
    CREATE ROLE StudentRole;
GO

CREATE USER StudentUser1 FOR LOGIN StudentLogin1;
GO

ALTER ROLE StudentRole ADD MEMBER StudentUser1;
GO

REVOKE EXECUTE ON Education.fn_GetSemesterStatus FROM PUBLIC;            
REVOKE EXECUTE ON Education.fn_GetStudentGPA FROM PUBLIC;
REVOKE EXECUTE ON Education.fn_RemainingCredits FROM PUBLIC;
GO

GRANT EXECUTE ON Education.fn_GetSemesterStatus TO StudentRole;
GRANT EXECUTE ON Education.fn_GetStudentGPA TO StudentRole;
GRANT EXECUTE ON Education.fn_RemainingCredits TO StudentRole;
GO

REVOKE SELECT, INSERT, UPDATE, DELETE ON Education.Enrollments FROM StudentRole;
GO

GRANT EXECUTE ON Education.usp_RegisterStudentInCourse TO StudentRole;
GO

USE master;
GO

CREATE LOGIN LibrarianLogin1 WITH PASSWORD = 'LibrarianPass@123', CHECK_POLICY = OFF;
GO

USE DB_project;
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'LibrarianRole')
    CREATE ROLE LibrarianRole;
GO

CREATE USER LibrarianUser1 FOR LOGIN LibrarianLogin1;
GO

ALTER ROLE LibrarianRole ADD MEMBER LibrarianUser1;
GO

REVOKE EXECUTE ON Library.sp_BorrowBook FROM PUBLIC;
REVOKE EXECUTE ON Library.sp_ReturnBook FROM PUBLIC;
GO

GRANT EXECUTE ON Library.sp_BorrowBook TO LibrarianRole;
GRANT EXECUTE ON Library.sp_ReturnBook TO LibrarianRole;
GO