SELECT
	[Time_Zone_Code], [Description]
INTO #temp
FROM (VALUES
(5, 'Eastern Time'),
(6, 'Central Time'),
(7, 'Mountain Time'),
(8, 'Pacific Time'),
(9, 'Alaska Time'),
(10, 'Hawaii Time'))
vdata ([Time_Zone_Code], [Description])


SELECT	[Time_Zone_Code], [Description] INTO TimeZoneCode FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Time_Zone_Code] ON TimeZoneCode ([Time_Zone_Code])

CREATE UNIQUE NONCLUSTERED INDEX [Description] ON TimeZoneCode ([Description])
