USE DB_project;
GO

DROP FUNCTION IF EXISTS Education.fn_GetSemesterStatus;

CREATE FUNCTION Education.fn_GetSemesterStatus
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