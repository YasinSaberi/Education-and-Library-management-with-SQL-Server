USE DB_project;
GO

DROP TABLE IF EXISTS Education.Semesters;

CREATE TABLE Education.Semesters (
    AcademicTermID INT PRIMARY KEY IDENTITY(2,1),
    TermIdentifier NVARCHAR(12) UNIQUE NOT NULL,         
    SemesterPeriodNumber INT NOT NULL,
    TermStartDate DATE NOT NULL,
    TermEndDate DATE NOT NULL,

    CONSTRAINT CHK_SemesterPeriod_Valid CHECK (SemesterPeriodNumber IN (1, 2, 3))
);