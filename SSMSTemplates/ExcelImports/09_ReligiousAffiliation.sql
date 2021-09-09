SELECT
	[Religious_Affiliation], [Description]
INTO #temp
FROM (VALUES
('B', 'Buddhist'),
('C', 'Catholic'),
('E', 'Ethiopian Orthodox'),
('G', 'Greek Orthodox'),
('H', 'Hindu'),
('I', 'Islamic'),
('J', 'Jewish'),
('K', 'Sikh'),
('L', 'Lutheran'),
('M', 'Mormon'),
('O', 'Eastern Orthodox'),
('P', 'Protestant'),
('S', 'Shinto'),
('X', 'Default'))
vdata ([Religious_Affiliation], [Description])


SELECT 	[Religious_Affiliation], [Description] INTO ReligiousAffiliation FROM #temp
CREATE UNIQUE CLUSTERED INDEX [Religious_Affiliation] ON ReligiousAffiliation  ([Religious_Affiliation])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON ReligiousAffiliation  ([Description])
