USE DB_project;
GO

DROP TABLE IF EXISTS Library.Books;

CREATE TABLE Library.Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    BookTitle NVARCHAR(250) NOT NULL,
    InternationalStandardBookNumber VARCHAR(17) UNIQUE,
    PublishingHouseID INT FOREIGN KEY REFERENCES Library.Publishers(BookPublisherID), -- Corrected column name here
    LiteraryCategoryID INT FOREIGN KEY REFERENCES Library.Categories(BookCategoryID), -- Corrected column name here
    PublicationYear INT
);