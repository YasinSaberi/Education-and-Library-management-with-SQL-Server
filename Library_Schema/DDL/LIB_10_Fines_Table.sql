USE DB_project;

DROP TABLE IF EXISTS Library.Fines;

CREATE TABLE Library.Fines (
    FineRecordID INT PRIMARY KEY IDENTITY(1,1),
    MemberAccountID INT FOREIGN KEY REFERENCES Library.Members(MemberID),
    FineAmount DECIMAL(12,2),
    IsFinePaidStatus BIT DEFAULT 0,
    FineDescription NVARCHAR(250),
    FineIssuedDate DATE DEFAULT GETDATE()
);