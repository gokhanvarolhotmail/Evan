SELECT
	[Political_Ideology], [Description]
INTO #temp
FROM (VALUES
('Blank', ''),
('C', 'Likely Conservative'),
('L', 'Likely Liberal'))
vdata ([Political_Ideology], [Description])


SELECT	[Political_Ideology], [Description] INTO PoliticalIdeology FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Political_Ideology] ON PoliticalIdeology ([Political_Ideology])
CREATE UNIQUE nonCLUSTERED INDEX [Description] ON PoliticalIdeology ([Description])
