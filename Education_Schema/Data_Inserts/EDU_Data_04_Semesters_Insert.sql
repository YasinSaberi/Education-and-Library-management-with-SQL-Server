USE DB_project;
GO

INSERT INTO Education.Semesters (TermIdentifier, SemesterPeriodNumber, TermStartDate, TermEndDate)
VALUES
(N'Fall 2025', 1, '2025-09-23', '2026-01-15'),
(N'Spring 2026', 2, '2026-01-25', '2026-05-20'),
(N'Summer 2026', 3, '2026-06-05', '2026-08-20'),
(N'Fall 2026', 1, '2026-09-23', '2027-01-15'),
(N'Spring 2027', 2, '2027-01-25', '2027-05-20'),
(N'Summer 2027', 3, '2027-06-05', '2027-08-20'),
(N'Fall 2027', 1, '2027-09-23', '2028-01-15'),
(N'Spring 2028', 2, '2028-01-25', '2028-05-20'),
(N'Summer 2028', 3, '2028-06-05', '2028-08-20');