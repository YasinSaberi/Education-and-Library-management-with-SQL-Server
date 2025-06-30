USE DB_project;
GO

DROP TABLE IF EXISTS Education.StudentStatusChanges;

CREATE TABLE Education.StudentStatusChanges (
    StatusChangeLogID INT PRIMARY KEY IDENTITY(1,1),
    AffectedStudentID INT NOT NULL,
    ReportingSemesterID INT NOT NULL,
    UnitsTaken INT NOT NULL,
    NewStatusType NVARCHAR(60) NOT NULL,  
    GradePointAverage DECIMAL(4,2),
    EffectiveChangeDate DATE NOT NULL DEFAULT GETDATE(),
    ChangeDescription NVARCHAR(300) NULL,      

    CONSTRAINT FK_StatusChange_Student FOREIGN KEY (AffectedStudentID) REFERENCES Education.Students(StudentID),
    CONSTRAINT FK_StatusChange_Semester FOREIGN KEY (ReportingSemesterID) REFERENCES Education.Semesters(SemesterID)
);