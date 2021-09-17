DROP TABLE IF EXISTS [HomePropertyType]

SELECT [Home_Property_Type],
	[Description] as [Description]
INTO [HomePropertyType]
FROM (SELECT
	[Home_Property_Type], [Description]
FROM (VALUES
('Blank', ''),
('G', 'Multi-Family Residential'),
('R', 'Single Family Residential'),
('M', 'Mobile Home'),
('T', 'Timeshare'))
vdata ([Home_Property_Type], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Property_Type] ON [HomePropertyType] ([Home_Property_Type])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomePropertyType] ([Description])
