DROP TABLE IF EXISTS [HomeSewer]

SELECT TRIM([Home_Sewer]) AS [Home_Sewer],
	TRIM([Description]) as [Description]
INTO [HomeSewer]
FROM (SELECT
	[Home_Sewer], [Description]
FROM (VALUES
('U', 'Unknown'),
('A', 'Commercial'),
('B', 'Private'),
('C', 'Public'),
('D', 'Septic'))
vdata ([Home_Sewer], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Sewer] ON [HomeSewer] ([Home_Sewer])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomeSewer] ([Description])