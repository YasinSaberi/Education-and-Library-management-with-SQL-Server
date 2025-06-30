USE DB_project;
GO

DROP FUNCTION IF EXISTS Library.RecommendBooksForStudent;

CREATE FUNCTION Library.RecommendBooksForStudent
(
    @TargetMemberIdentifier INT
)
RETURNS TABLE
AS
RETURN
(
    WITH CurrentMemberBooks AS (
        SELECT DISTINCT book_copy_details.AssociatedBookID
        FROM Library.Borrowing AS loan_records
        JOIN Library.BookCopies AS book_copy_details 
            ON loan_records.BorrowedCopyID = book_copy_details.BookCopyID
        WHERE loan_records.LibraryMemberID = @TargetMemberIdentifier
    ),
    CollaborativeUsers AS (
        SELECT loan_records_similar.LibraryMemberID
        FROM Library.Borrowing AS loan_records_similar
        JOIN Library.BookCopies AS book_copy_details_similar 
            ON loan_records_similar.BorrowedCopyID = book_copy_details_similar.BookCopyID
        WHERE book_copy_details_similar.AssociatedBookID IN (SELECT AssociatedBookID FROM CurrentMemberBooks)
          AND loan_records_similar.LibraryMemberID != @TargetMemberIdentifier
        GROUP BY loan_records_similar.LibraryMemberID
        HAVING COUNT(DISTINCT book_copy_details_similar.AssociatedBookID) >= 2
    ),
    PotentialRecommendations AS (
        SELECT book_copy_details_potential.AssociatedBookID, COUNT(*) AS RecommendationScore
        FROM Library.Borrowing AS loan_records_potential
        JOIN Library.BookCopies AS book_copy_details_potential 
            ON loan_records_potential.BorrowedCopyID = book_copy_details_potential.BookCopyID
        WHERE loan_records_potential.LibraryMemberID IN (SELECT LibraryMemberID FROM CollaborativeUsers)
          AND book_copy_details_potential.AssociatedBookID NOT IN (SELECT AssociatedBookID FROM CurrentMemberBooks)
        GROUP BY book_copy_details_potential.AssociatedBookID
    )
    SELECT TOP 3 
        recommended_book_info.AssociatedBookID AS BookID, 
        book_master_data.BookTitle AS Title, 
        recommended_book_info.RecommendationScore AS Score
    FROM PotentialRecommendations AS recommended_book_info
    JOIN Library.Books AS book_master_data ON recommended_book_info.AssociatedBookID = book_master_data.BookID
    ORDER BY recommended_book_info.RecommendationScore DESC
);