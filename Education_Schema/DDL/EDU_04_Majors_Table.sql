USE DB_project;
GO

DROP TABLE IF EXISTS Education.Majors;
GO

CREATE TABLE Education.Majors (
    AcademicMajorID INT PRIMARY KEY IDENTITY(1,1),
    MajorTitle NVARCHAR(120) NOT NULL,
    MajorProgramCode NVARCHAR(15) UNIQUE NOT NULL,
    AwardedDegreeLevel NVARCHAR(25) NOT NULL,
    ResponsibleDepartmentID INT NOT NULL,

    CONSTRAINT FK_Major_ResponsibleDepartment FOREIGN KEY (ResponsibleDepartmentID) REFERENCES Education.Departments(DepartmentID)
);
GO