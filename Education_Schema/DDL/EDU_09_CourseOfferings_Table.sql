USE DB_project;
GO

DROP TABLE IF EXISTS Education.CourseOfferings;
GO

CREATE TABLE Education.CourseOfferings (
    CourseOfferingID INT PRIMARY KEY IDENTITY(100,5),
    OfferedCourseID INT NOT NULL,
    OfferingSemesterID INT NOT NULL,
    AssignedInstructorID INT NULL,
    EnrollmentCapacity INT NULL, -- THIS CRITICAL LINE MUST BE PRESENT

    CONSTRAINT FK_Offering_Course FOREIGN KEY (OfferedCourseID) REFERENCES Education.Courses(CurriculumCourseID),
    CONSTRAINT FK_Offering_Instructor FOREIGN KEY (AssignedInstructorID) REFERENCES Education.Instructors(FacultyMemberID),
    CONSTRAINT FK_Offering_Semester FOREIGN KEY (OfferingSemesterID) REFERENCES Education.Semesters(AcademicTermID)
);
GO