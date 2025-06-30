USE DB_project;
GO

DROP TABLE IF EXISTS Education.StudentCourses;

CREATE TABLE Education.StudentCourses (
    StudentCourseRecordID INT PRIMARY KEY IDENTITY(1,1),
    RelatedEnrollmentID INT NOT NULL,
    CourseCompletionStatus NVARCHAR(25) NOT NULL DEFAULT N'Registered',    
    FinalGrade DECIMAL(4,2),

    CONSTRAINT FK_StudentCourse_EnrollmentLink FOREIGN KEY (RelatedEnrollmentID) REFERENCES Education.Enrollments(EnrollmentID)
);