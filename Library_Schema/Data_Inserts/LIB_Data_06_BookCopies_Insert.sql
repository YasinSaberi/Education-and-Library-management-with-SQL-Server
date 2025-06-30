USE DB_project;
GO

INSERT INTO Library.BookCopies (AssociatedBookID, CopyBarcode, CurrentAvailabilityStatus) VALUES
(1, N'LIB-C001-B01', 1),
(1, N'LIB-C002-B01', 1),
(1, N'LIB-C003-B01', 0), -- Book 1, copy 3 is currently unavailable
(2, N'LIB-C004-B02', 1),
(2, N'LIB-C005-B02', 1),
(3, N'LIB-C006-B03', 1),
(3, N'LIB-C007-B03', 0), -- Book 3, copy 2 is currently unavailable
(4, N'LIB-C008-B04', 1),
(4, N'LIB-C009-B04', 1),
(5, N'LIB-C010-B05', 1),
(5, N'LIB-C011-B05', 1),
(6, N'LIB-C012-B06', 1),
(6, N'LIB-C013-B06', 0), -- Book 6, copy 2 is currently unavailable
(7, N'LIB-C014-B07', 1),
(7, N'LIB-C015-B07', 1),
(8, N'LIB-C016-B08', 1),
(8, N'LIB-C017-B08', 1),
(9, N'LIB-C018-B09', 1),
(9, N'LIB-C019-B09', 0), -- Book 9, copy 2 is currently unavailable
(10, N'LIB-C020-B10', 1),
(10, N'LIB-C021-B10', 1),
(11, N'LIB-C022-B11', 1),
(11, N'LIB-C023-B11', 1),
(12, N'LIB-C024-B12', 1),
(12, N'LIB-C025-B12', 0), -- Book 12, copy 2 is currently unavailable
(13, N'LIB-C026-B13', 1),
(13, N'LIB-C027-B13', 1),
(14, N'LIB-C028-B14', 1),
(14, N'LIB-C029-B14', 0), -- Book 14, copy 2 is currently unavailable
(15, N'LIB-C030-B15', 1),
(15, N'LIB-C031-B15', 1),
(16, N'LIB-C032-B16', 1),
(16, N'LIB-C033-B16', 0), -- Book 16, copy 2 is currently unavailable
(17, N'LIB-C034-B17', 1),
(17, N'LIB-C035-B17', 1),
(18, N'LIB-C036-B18', 1),
(18, N'LIB-C037-B18', 0), -- Book 18, copy 2 is currently unavailable
(19, N'LIB-C038-B19', 1),
(19, N'LIB-C039-B19', 1),
(20, N'LIB-C040-B20', 1),
(20, N'LIB-C041-B20', 0), -- Book 20, copy 2 is currently unavailable
(21, N'LIB-C042-B21', 1),
(21, N'LIB-C043-B21', 1),
(22, N'LIB-C044-B22', 1),
(22, N'LIB-C045-B22', 0), -- Book 22, copy 2 is currently unavailable
(23, N'LIB-C046-B23', 1),
(23, N'LIB-C047-B23', 1),
(24, N'LIB-C048-B24', 1),
(24, N'LIB-C049-B24', 0), -- Book 24, copy 2 is currently unavailable
(25, N'LIB-C050-B25', 1),
(25, N'LIB-C051-B25', 1);