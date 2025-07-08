USE master;
GO

-- Step 1: Clean up existing security principals on the server level (Logins)
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'AdminLogin1') DROP LOGIN AdminLogin1;
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'StudentLogin1') DROP LOGIN StudentLogin1;
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'LibrarianLogin1') DROP LOGIN LibrarianLogin1;
GO

-- Step 2: Create SQL Server Logins
CREATE LOGIN AdminLogin1 WITH PASSWORD = 'StrongPassword@123', CHECK_POLICY = OFF;
CREATE LOGIN StudentLogin1 WITH PASSWORD = 'StudentPass@123', CHECK_POLICY = OFF;
CREATE LOGIN LibrarianLogin1 WITH PASSWORD = 'LibrarianPass@123', CHECK_POLICY = OFF;
GO

USE DB_project; -- Switch to DB_project database context
GO

-- Step 3: Clean up existing database principals (Users and Roles)
-- Drop users first, as they might be members of roles
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AdminUser1' AND type = 'S') DROP USER AdminUser1;
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'StudentUser1' AND type = 'S') DROP USER StudentUser1;
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'LibrarianUser1' AND type = 'S') DROP USER LibrarianUser1;
GO

-- Drop roles (good practice for re-running, already in original)
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AdminRole' AND type = 'R') DROP ROLE AdminRole;
GO
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'LibrarianRole' AND type = 'R') DROP ROLE LibrarianRole;
GO
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'StudentRole' AND type = 'R') DROP ROLE StudentRole;
GO

-- Step 4: Create Database Roles (each in its own batch)
CREATE ROLE AdminRole;
GO
CREATE ROLE LibrarianRole;
GO
CREATE ROLE StudentRole;
GO

-- Step 5: Create Database Users and map them to Logins
CREATE USER AdminUser1 FOR LOGIN AdminLogin1;
CREATE USER StudentUser1 FOR LOGIN StudentLogin1;
CREATE USER LibrarianUser1 FOR LOGIN LibrarianLogin1;
GO

-- Step 6: Add Database Users to their respective roles
ALTER ROLE AdminRole ADD MEMBER AdminUser1;
ALTER ROLE StudentRole ADD MEMBER StudentUser1;
ALTER ROLE LibrarianRole ADD MEMBER LibrarianUser1;
GO

-- --- Step 7: Grant/Revoke Permissions to Roles (USING CORRECTED OBJECT NAMES) ---
-- These permissions rely on the functions and procedures existing.

-- Admin Role Permissions
-- Grant specific EXECUTE permissions to AdminRole
GRANT EXECUTE ON Education.usp_RegisterStudentWithAddress TO AdminRole;
GRANT EXECUTE ON Education.usp_RegisterAdminWithAddress TO AdminRole;
-- Note: Original file had a REVOKE on usp_RegisterStudentWithAddress from PUBLIC, which is good practice.
REVOKE EXECUTE ON Education.usp_RegisterStudentWithAddress FROM PUBLIC; 
REVOKE EXECUTE ON Education.usp_RegisterAdminWithAddress FROM PUBLIC; 

-- Student Role Permissions
-- Revoke all execute from PUBLIC on student functions/procedures then grant to role (good practice)
REVOKE EXECUTE ON Education.CalculateSemesterStatus FROM PUBLIC; 
REVOKE EXECUTE ON Education.CalculateStudentGPA FROM PUBLIC;     
REVOKE EXECUTE ON Education.fn_RemainingCredits FROM PUBLIC;      
REVOKE EXECUTE ON Education.usp_RegisterStudentInCourse FROM PUBLIC;

GRANT EXECUTE ON Education.CalculateSemesterStatus TO StudentRole; 
GRANT EXECUTE ON Education.CalculateStudentGPA TO StudentRole;     
GRANT EXECUTE ON Education.fn_RemainingCredits TO StudentRole;      
GRANT EXECUTE ON Education.usp_RegisterStudentInCourse TO StudentRole;

-- Grant SELECT permissions to StudentRole for viewing (as per README/project scope)
GRANT SELECT ON Education.Courses TO StudentRole;
GRANT SELECT ON Education.CourseOfferings TO StudentRole;
GRANT SELECT ON Education.Departments TO StudentRole;
GRANT SELECT ON Education.Majors TO StudentRole;
GRANT SELECT ON Education.Semesters TO StudentRole;
GRANT SELECT ON Education.ClassSchedules TO StudentRole;
GRANT SELECT ON Education.ExamSchedules TO StudentRole;
GRANT SELECT ON Education.StudentStatusChanges TO StudentRole; 
GRANT SELECT ON Education.Enrollments TO StudentRole; 
GRANT SELECT ON Education.StudentCourses TO StudentRole; 
GRANT SELECT ON Education.EventLogs TO StudentRole; 


GRANT SELECT ON Library.Books TO StudentRole;
GRANT SELECT ON Library.Authors TO StudentRole;
GRANT SELECT ON Library.Categories TO StudentRole;
GRANT SELECT ON Library.Publishers TO StudentRole;
GRANT SELECT ON Library.Borrowing TO StudentRole; 
GRANT SELECT ON Library.Fines TO StudentRole;     
GRANT SELECT ON Library.BookCopies TO StudentRole;

-- Librarian Role Permissions
-- Revoke execute from PUBLIC on librarian procedures
REVOKE EXECUTE ON Library.sp_BorrowBook FROM PUBLIC; 
REVOKE EXECUTE ON Library.sp_ReturnBook FROM PUBLIC; 

GRANT EXECUTE ON Library.sp_BorrowBook TO LibrarianRole;
GRANT EXECUTE ON Library.sp_ReturnBook TO LibrarianRole;

-- Grant SELECT permissions to LibrarianRole for management (as per project scope)
GRANT SELECT ON Library.Authors TO LibrarianRole;
GRANT SELECT ON Library.Books TO LibrarianRole;
GRANT SELECT ON Library.BookCopies TO LibrarianRole;
GRANT SELECT ON Library.Borrowing TO LibrarianRole;
GRANT SELECT ON Library.Categories TO LibrarianRole;
GRANT SELECT ON Library.Fines TO LibrarianRole;
GRANT SELECT ON Library.Members TO LibrarianRole;
GRANT SELECT ON Library.Publishers TO LibrarianRole;
GRANT SELECT ON Library.Returns TO LibrarianRole;
-- FIX: Commenting out the problematic line for LibraryActivityLog
-- GRANT SELECT ON Library.LibraryActivityLog TO LibrarianRole; 
GRANT SELECT ON Education.Students TO LibrarianRole; 
GRANT SELECT ON Education.UserAccounts TO LibrarianRole; 
GRANT SELECT ON Education.Instructors TO LibrarianRole; 
GRANT SELECT ON Education.Departments TO LibrarianRole; 

-- Ensure Public doesn't have unintended permissions (general hardening)
REVOKE SELECT ON Education.Userlink FROM PUBLIC;
REVOKE SELECT ON Education.Addresses FROM PUBLIC;
REVOKE SELECT ON Education.Admins FROM PUBLIC;
REVOKE SELECT ON Education.EventLogs FROM PUBLIC;
REVOKE SELECT ON Education.CurriculumPlan FROM PUBLIC;
GO