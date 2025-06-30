USE DB_project;
GO

DROP TABLE IF EXISTS Education.ExamSchedules;

CREATE TABLE Education.ExamSchedules (
    ExaminationScheduleID INT PRIMARY KEY IDENTITY(101,2),
    ScheduledOfferingID INT NOT NULL,         
    ExaminationDate DATE NOT NULL,                      
    ExamStartTime TIME NOT NULL,
    ExamEndTime TIME NOT NULL,
    ExaminationLocation NVARCHAR(150) NOT NULL,        

    CONSTRAINT FK_ExamSchedule_CourseOffering FOREIGN KEY (ScheduledOfferingID) REFERENCES Education.CourseOfferings(OfferingID)
);