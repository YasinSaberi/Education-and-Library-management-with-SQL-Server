USE DB_project;
GO

DROP TABLE IF EXISTS Education.Userlink;

CREATE TABLE Education.Userlink (
    EntityLinkID INT PRIMARY KEY IDENTITY(1,1),
    LinkedEntityType NVARCHAR(60) NOT NULL,
    LinkedEntityNationalCode NVARCHAR(10) UNIQUE NOT NULL
);