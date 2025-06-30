USE DB_project;

DROP TABLE IF EXISTS Library.Authors;

CREATE TABLE Library.Authors (
    AuthorIdentifier INT PRIMARY KEY IDENTITY(10,1),
    AuthorFullName NVARCHAR(110) NOT NULL
);