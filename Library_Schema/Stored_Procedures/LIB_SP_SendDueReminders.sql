USE DB_project;
GO

DROP PROCEDURE IF EXISTS Library.proc_send_due_reminders;
GO

CREATE PROCEDURE Library.proc_send_due_reminders AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Library.LibraryActivityLog (LogEntryType, LogDescription)
    SELECT 
        N'Reminder', 
        N'Due date alert for member: ' + CAST(loan_details.LibraryMemberID AS NVARCHAR(50)) + N' - Book due soon.'
    FROM Library.Borrowing AS loan_details
    WHERE 
        loan_details.IsReturnedFlag = 0
        AND DATEDIFF(DAY, CAST(GETDATE() AS DATE), loan_details.ReturnDueDate) BETWEEN 0 AND 3;
END;