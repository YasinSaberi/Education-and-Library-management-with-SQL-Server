USE DB_project;
GO

DROP TABLE IF EXISTS Education.Enrollments;
GO

CREATE TABLE Education.Enrollments (
    CourseEnrollmentID INT PRIMARY KEY IDENTITY(1000,10),
    EnrolledStudentID INT NOT NULL, 
    EnrolledOfferingID INT NOT NULL, 
    DateOfEnrollment DATETIME NOT NULL DEFAULT GETDATE(),
    EnrollmentStatus NVARCHAR(25) NOT NULL DEFAULT N'Registered', 

    CONSTRAINT FK_Enrollment_Student FOREIGN KEY (EnrolledStudentID) REFERENCES Education.Students(UniversityStudentID)
    -- REMOVED: CONSTRAINT FK_Enrollment_CourseOffering FOREIGN KEY (EnrolledOfferingID) REFERENCES Education.CourseOfferings(CourseOfferingID)
);
GO