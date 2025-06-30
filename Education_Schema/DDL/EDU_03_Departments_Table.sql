USE DB_project;
GO

DROP TABLE IF EXISTS Education.Departments;

CREATE TABLE Education.Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),   
    DepartmentName NVARCHAR(110) UNIQUE NOT NULL,      
    HeadOfDepartmentName NVARCHAR(100),         
    DepartmentContactPhone VARCHAR(20),         
    DepartmentEmail NVARCHAR(120)          
);