USE DB_project;
GO

DROP TABLE IF EXISTS Education.EventLogs;

CREATE TABLE Education.EventLogs (
    LogEntryID INT PRIMARY KEY IDENTITY(1,1),
    EventType NVARCHAR(50),        
    AffectedTableName NVARCHAR(50),          
    AffectedRecordID INT,                  
    EventDetails NVARCHAR(255),
    LogTimestamp DATETIME DEFAULT GETDATE(),
    OriginatingUser NVARCHAR(100) DEFAULT SYSTEM_USER
);