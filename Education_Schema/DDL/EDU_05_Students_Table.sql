USE DB_project;
GO

DROP TABLE IF EXISTS Education.Students;

CREATE TABLE Education.Students (
    UniversityStudentID INT PRIMARY KEY IDENTITY(10000,2),
    NationalIdentityNumber NVARCHAR(10) UNIQUE NOT NULL,       
    StudentFirstName NVARCHAR(60) NOT NULL,              
    StudentLastName NVARCHAR(60) NOT NULL,              
    StudentFatherName NVARCHAR(60),                      
    DateOfBirth DATE NOT NULL,                      
    GenderCode CHAR(1),  
    ContactPhoneNumber VARCHAR(20),                      
    StudentEmailAddress NVARCHAR(120),                          
    AcademicEntryYear INT NOT NULL,      
    EnrolledDepartmentID INT,
    ChosenMajorID INT,          
    EnrollmentStatus NVARCHAR(25),

    CONSTRAINT CHK_StudentGender_Valid CHECK (GenderCode IN ('M', 'F')),
    CONSTRAINT CHK_StudentEnrollmentStatus_Valid CHECK (EnrollmentStatus IN ('Active', 'Expelled', 'Graduated', 'Dropped')),
    CONSTRAINT FK_Student_DepartmentEnrollment FOREIGN KEY (EnrolledDepartmentID) REFERENCES Education.Departments(DepartmentID),
    CONSTRAINT FK_Student_MajorSelection FOREIGN KEY (ChosenMajorID) REFERENCES Education.Majors(AcademicMajorID) -- Corrected column name here
);