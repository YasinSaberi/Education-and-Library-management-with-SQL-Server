USE DB_project;
GO

DROP TABLE IF EXISTS Education.Courses;
GO

CREATE TABLE Education.Courses (
    CurriculumCourseID INT PRIMARY KEY IDENTITY(10,2),
    OfficialCourseName NVARCHAR(120) UNIQUE NOT NULL,
    CourseIdentifierCode NVARCHAR(25) UNIQUE NOT NULL,
    CourseCreditUnits INT NOT NULL,
    AcademicCourseType NVARCHAR(25) NOT NULL,
    TargetDegreeLevel NVARCHAR(25) NOT NULL,
    AssociatedMajorID INT NULL,
    OwningDepartmentID INT NOT NULL,

    CONSTRAINT CHK_CourseCredits_Range CHECK (CourseCreditUnits BETWEEN 0 AND 6),
    CONSTRAINT FK_Course_MajorAssociation FOREIGN KEY (AssociatedMajorID) REFERENCES Education.Majors(AcademicMajorID),
    CONSTRAINT FK_Course_DepartmentOwnership FOREIGN KEY (OwningDepartmentID) REFERENCES Education.Departments(DepartmentID)
);
GO