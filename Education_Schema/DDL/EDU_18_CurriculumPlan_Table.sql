USE DB_project;
GO

DROP TABLE IF EXISTS Education.CurriculumPlan;

CREATE TABLE Education.CurriculumPlan (
    CurriculumPlanRecordID INT IDENTITY(1,1) PRIMARY KEY,
    MajorProgramID INT NOT NULL,            
    CourseInCurriculumID INT UNIQUE NOT NULL,      
    RecommendedSemesterOrder INT NOT NULL      

    CONSTRAINT FK_CurriculumPlan_MajorProgram FOREIGN KEY (MajorProgramID) REFERENCES Education.Majors(AcademicMajorID),
    CONSTRAINT FK_CurriculumPlan_Courses FOREIGN KEY (CourseInCurriculumID) REFERENCES Education.Courses(CurriculumCourseID)
);