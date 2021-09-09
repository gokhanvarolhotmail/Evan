SELECT
	[Number_Children], [Description]
INTO #temp
FROM (VALUES
('Blank', ''),
('0', 'No Children'),
('1', '1 Child'),
('2', '2 Children'),
('3', '3 Children'),
('4', '4 Children'),
('5', '5 Children'),
('6', '6 Children'),
('7', '7 Children'),
('8', 'More than 7'))
vdata ([Number_Children], [Description])


SELECT	[Number_Children], [Description] INTO NumberChildren FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Number_Children] ON NumberChildren ([Number_Children])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON NumberChildren ([Description])