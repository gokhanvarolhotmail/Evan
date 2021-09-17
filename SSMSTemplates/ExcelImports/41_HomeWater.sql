DROP TABLE IF EXISTS [HomeWater]

SELECT TRIM([Home_Water]) AS [Home_Water],
	TRIM([Description]) as [Description]
INTO [HomeWater]
FROM (SELECT
	[Home_Water], [Description]
FROM (VALUES
('U', 'Unknown'),
('A', 'Commercial'),
('B', 'Private'),
('C', 'Public'),
('D', 'Well'))
vdata ([Home_Water], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Water] ON [HomeWater] ([Home_Water])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomeWater] ([Description])
