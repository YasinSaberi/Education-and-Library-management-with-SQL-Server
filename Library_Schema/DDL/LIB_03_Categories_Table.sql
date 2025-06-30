USE DB_project;

DROP TABLE IF EXISTS Library.Categories;

CREATE TABLE Library.Categories (
    BookCategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(120) NOT NULL
);