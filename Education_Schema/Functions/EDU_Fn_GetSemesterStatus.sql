USE DB_project;
GO

-- Drop old function name if it exists (fn_GetSemesterStatus)
DROP FUNCTION IF EXISTS Education.fn_GetSemesterStatus; 
GO
-- Drop the new function name (CalculateSemesterStatus) in case it was partially created
DROP FUNCTION IF EXISTS Education.CalculateSemesterStatus; 
GO

CREATE FUNCTION Education.CalculateSemesterStatus -- CORRECTED: Function name changed to CalculateSemesterStatus
(
    @InputGradePointAverage DECIMAL(4,2)
)
RETURNS NVARCHAR(20)
AS
BEGIN
    RETURN (
        CASE 
            WHEN @InputGradePointAverage < 12 THEN N'Probationary'
            ELSE N'Normal'
        END
    )
END;
GO