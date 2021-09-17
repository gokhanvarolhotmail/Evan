DROP TABLE IF EXISTS [HomeSquareFootageRange]

SELECT TRIM([Home_Square_Footage_Range]) AS [Home_Square_Footage_Range],
	TRIM([Description]) as [Description]
INTO [HomeSquareFootageRange]
FROM (SELECT
	[Home_Square_Footage_Range], [Description]
FROM (VALUES
('Blank', ''),
('A', 'Less than 750 feet'),
('B', '750 - 999 Feet'),
('C', '1,000 - 1,249 Feet'),
('D', '1,250 - 1,499 Feet'),
('E', '1,500 - 1,749 Feet'),
('F', '1,750 - 1,999 Feet'),
('G', '2,000 - 2,499 Feet'),
('H', '2,500 - 2,999 Feet'),
('I', '3,000 - 3,499 Feet'),
('J', '3,500 - 3,999 Feet'),
('K', '4,000 - 4,999 Feet'),
('L', '5,000 - 5,999 Feet'),
('M', '6,000 - 6,999 Feet'),
('N', 'Greater than 7,000 Feet'))
vdata ([Home_Square_Footage_Range], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Square_Footage_Range] ON [HomeSquareFootageRange] ([Home_Square_Footage_Range])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomeSquareFootageRange] ([Description])
