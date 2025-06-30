USE DB_project;

DROP TABLE IF EXISTS Library.Publishers;

CREATE TABLE Library.Publishers (
    BookPublisherID INT PRIMARY KEY IDENTITY(1,1),
    PublisherName NVARCHAR(150) NOT NULL
);