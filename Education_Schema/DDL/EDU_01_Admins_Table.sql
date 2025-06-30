USE DB_project;
GO

DROP TABLE IF EXISTS Education.Admins;

CREATE TABLE Education.Admins (
    AdministratorID INT IDENTITY(20000,5) PRIMARY KEY,
    NationalIdentifier NVARCHAR(10) UNIQUE NOT NULL,      
    GivenName NVARCHAR(55) NOT NULL,
    FamilyName NVARCHAR(55) NOT NULL,
    UserRole NVARCHAR(35) NOT NULL,          
    ContactNumber VARCHAR(20),                  
    EmailAddress NVARCHAR(120)
);