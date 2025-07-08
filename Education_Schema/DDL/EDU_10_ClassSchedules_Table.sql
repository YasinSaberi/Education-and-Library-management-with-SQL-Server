USE DB_project;
GO

DROP TABLE IF EXISTS Education.ClassSchedules;

CREATE TABLE Education.ClassSchedules (
    ClassScheduleID INT PRIMARY KEY IDENTITY(50,10),
    CourseOfferingID INT NOT NULL, -- This column's type/name is correct; the FK reference is what needs updating
    ScheduledDay NVARCHAR(15) NOT NULL,  
    ScheduleStartTime TIME NOT NULL,        
    ScheduleEndTime TIME NOT NULL,        
    ClassroomLocation NVARCHAR(150) NOT NULL, 

    CONSTRAINT FK_ClassSchedule_CourseOffering FOREIGN KEY (CourseOfferingID) REFERENCES Education.CourseOfferings(CourseOfferingID) -- Corrected column name here
);