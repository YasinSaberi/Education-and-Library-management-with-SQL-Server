USE DB_project;
GO

INSERT INTO Education.Majors (MajorTitle, MajorProgramCode, AwardedDegreeLevel, ResponsibleDepartmentID)
VALUES 
(N'Software Engineering (B.Sc.)', N'SWENG01', N'Bachelor', 1),
(N'Data Science & AI (M.Sc.)', N'DSAI02', N'Master', 1),
(N'Computer Systems Engineering (B.Sc.)', N'CSYS03', N'Bachelor', 1),
(N'Cyber Defense (M.Sc.)', N'CYDEF04', N'Master', 1),

(N'Renewable Energy Systems (B.Sc.)', N'RENEW05', N'Bachelor', 2),
(N'Power Systems Automation (M.Sc.)', N'PSAUTO06', N'Master', 2),
(N'Micro-Electronics Design (B.Sc.)', N'MICRO07', N'Bachelor', 2),

(N'Advanced Manufacturing (B.Sc.)', N'ADVM08', N'Bachelor', 3),
(N'Computational Mechanics (M.Sc.)', N'COMPM09', N'Master', 3),

(N'Structural Resilience Engineering (B.Sc.)', N'SRE10', N'Bachelor', 4),
(N'Seismic Design & Mitigation (M.Sc.)', N'SDM11', N'Master', 4),

(N'Process Systems Engineering (B.Sc.)', N'PSE12', N'Bachelor', 5),
(N'Sustainable Chemical Processes (M.Sc.)', N'SCPROC13', N'Master', 5),

(N'Pure Mathematics (B.Sc.)', N'MATHP14', N'Bachelor', 6),
(N'Statistical Modeling (M.Sc.)', N'STATM15', N'Master', 6),

(N'Quantum Technologies (B.Sc.)', N'QUANT16', N'Bachelor', 7),
(N'Nanophysics (M.Sc.)', N'NANOP17', N'Master', 7),

(N'Medicinal Chemistry (B.Sc.)', N'MEDCHEM18', N'Bachelor', 8),
(N'Analytical & Forensic Chemistry (M.Sc.)', N'AFC19', N'Master', 8),

(N'Cellular & Molecular Biology (B.Sc.)', N'CMB20', N'Bachelor', 9),
(N'Genomic Sciences (M.Sc.)', N'GENOM21', N'Master', 9),

(N'Classical & Contemporary Persian Lit. (B.A.)', N'CCLPL22', N'Bachelor', 10),
(N'Literary Theory (M.A.)', N'LITTH23', N'Master', 10),

(N'Commercial & International Trade Law (B.A.)', N'CITL24', N'Bachelor', 11),
(N'Human Rights & Justice Studies (M.A.)', N'HRJS25', N'Master', 11),

(N'Political Economy (B.A.)', N'POLECON26', N'Bachelor', 12),
(N'Global Governance (M.A.)', N'GLOBGOV27', N'Master', 12),

(N'Organizational Leadership (B.A.)', N'ORGLDR28', N'Bachelor', 13),
(N'Supply Chain & Logistics Management (M.Sc.)', N'SCLM29', N'Master', 13),

(N'Behavioral Economics (B.A.)', N'BEHAECO30', N'Bachelor', 14),
(N'Development & Policy Analysis (M.A.)', N'DEVPA31', N'Master', 14),

(N'Cognitive Psychology (B.A.)', N'COGPSY32', N'Bachelor', 15),
(N'Neuropsychology & Clinical Practice (M.Sc.)', N'NCP33', N'Master', 15);