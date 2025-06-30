USE DB_project;
GO

DROP TABLE IF EXISTS Education.Addresses;

CREATE TABLE Education.Addresses (
    AddressIdentifier INT PRIMARY KEY IDENTITY(100,1), 
    AssociatedEntityType NVARCHAR(35) NOT NULL,  
    AssociatedEntityID NVARCHAR(12) UNIQUE NOT NULL,          
    Country NVARCHAR(60) NOT NULL,        
    Province NVARCHAR(60) NOT NULL,        
    City NVARCHAR(60) NOT NULL,            
    Street NVARCHAR(120),              
    Alley NVARCHAR(120),        
    BuildingNumber NVARCHAR(15),            
    PostalCode CHAR(10),                  
    AdditionalDetails NVARCHAR(300)
);