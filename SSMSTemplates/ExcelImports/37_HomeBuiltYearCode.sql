DROP TABLE IF EXISTS [HomeBuiltYearCode]

SELECT [Home_Built_Year_Code],
	[Home_Built_Year_Description] as [Description]
INTO [HomeBuiltYearCode]
FROM (SELECT
	[Home_Built_Year_Code], [Home_Built_Year_Description]
FROM (VALUES
('Blank', ''),
('A', 'Before 1900s'),
('B', '1900 - 1909'),
('C', '1910 - 1919'),
('D', '1920 - 1929'),
('E', '1930 - 1939'),
('F', '1940 - 1949'),
('G', '1950 - 1959'),
('H', '1960 - 1969'),
('I', '1970 - 1979'),
('J', '1980 - 1989'),
('K', '1990 - 1999'),
('L', '2000 - 2009'),
('M', '2010 - 2019'),
('N', '2020 - 2029'))
vdata ([Home_Built_Year_Code], [Home_Built_Year_Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Built_Year_Code] ON [HomeBuiltYearCode] ([Home_Built_Year_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomeBuiltYearCode] ([Description])
