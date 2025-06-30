USE DB_project;

DROP TABLE IF EXISTS Library.Books;

CREATE TABLE Library.Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    BookTitle NVARCHAR(250) NOT NULL,
    InternationalStandardBookNumber VARCHAR(17) UNIQUE,
    PublishingHouseID INT FOREIGN KEY REFERENCES Library.Publishers(PublisherID),
    LiteraryCategoryID INT FOREIGN KEY REFERENCES Library.Categories(CategoryID),
    PublicationYear INT
);