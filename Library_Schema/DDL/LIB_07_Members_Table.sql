USE DB_project;

DROP TABLE IF EXISTS Library.Members;

CREATE TABLE Library.Members (
    LibraryMemberID INT PRIMARY KEY IDENTITY(1,1),
    AssociatedStudentID INT NOT NULL FOREIGN KEY REFERENCES Education.Students(UniversityStudentID),
    MemberFullName NVARCHAR(120) NOT NULL,
    RegistrationDate DATE DEFAULT GETDATE(),
    IsMemberAccountActive BIT DEFAULT 1
);