SELECT
	[Assimilation_Code], [Description]
INTO #temp
FROM (VALUES
('Blank', ''),
('A', 'Assimilated - English Speaking'),
('B', 'Bilingual - English Primary'),
('C', 'Bilingual -  Native Language Primary'),
('D', 'Unassimilated - Native Language Only'))
vdata ([Assimilation_Code], [Description])


SELECT 	[Assimilation_Code], [Description] INTO AssimilationCode FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Assimilation_Code] ON AssimilationCode([Assimilation_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON AssimilationCode([Description])