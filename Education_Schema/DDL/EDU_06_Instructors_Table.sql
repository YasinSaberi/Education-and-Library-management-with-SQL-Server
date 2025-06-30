USE DB_project;
GO

DROP TABLE IF EXISTS Education.Instructors;

CREATE TABLE Education.Instructors (
    FacultyMemberID INT PRIMARY KEY IDENTITY(30000,10),
    NationalIdentityCode NVARCHAR(10) UNIQUE NOT NULL,       
    PrimaryFirstName NVARCHAR(60) NOT NULL,              
    PrimaryLastName NVARCHAR(60) NOT NULL,              
    FatherFullName NVARCHAR(60),                      
    DateOfBirth DATE NOT NULL,                      
    GenderCode CHAR(1),
    ContactPhoneNumber VARCHAR(20),                      
    InstitutionalEmail NVARCHAR(120),                          
    EmploymentDate DATE NOT NULL,                       
    AssignedDepartmentID INT NOT NULL,               
    AcademicRank NVARCHAR(60),                            
    EmploymentStatus NVARCHAR(25),  

    CONSTRAINT CHK_FacultyGender_Valid CHECK (GenderCode IN ('M', 'F')),
    CONSTRAINT CHK_FacultyStatus_Valid CHECK (EmploymentStatus IN ('Active', 'Retired', 'Resigned')),
    CONSTRAINT FK_Faculty_DepartmentAssignment FOREIGN KEY (AssignedDepartmentID) REFERENCES Education.Departments(DepartmentID)
);