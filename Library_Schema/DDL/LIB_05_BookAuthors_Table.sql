USE DB_project;

DROP TABLE IF EXISTS Library.BookAuthors;

CREATE TABLE Library.BookAuthors (
    BookID INT FOREIGN KEY REFERENCES Library.Books(BookID),
    AuthorID INT FOREIGN KEY REFERENCES Library.Authors(AuthorIdentifier),
    PRIMARY KEY (BookID, AuthorID)
);