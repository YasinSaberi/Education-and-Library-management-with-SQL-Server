USE DB_project;
GO

CREATE FUNCTION Library.filterCategory
(
    @TargetCategoryName NVARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        book_details.BookID, 
        book_details.BookTitle, 
        book_details.PublishingHouseID, 
        book_details.PublicationYear
    FROM 
        Library.Books AS book_details
    JOIN 
        Library.Categories AS category_info 
        ON category_info.BookCategoryID = book_details.LiteraryCategoryID
    WHERE 
        category_info.CategoryName = @TargetCategoryName
);