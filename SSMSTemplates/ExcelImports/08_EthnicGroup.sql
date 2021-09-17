SELECT
	[Ethnic_Group], [Description]
INTO #temp
FROM (VALUES
('Blank', ''),
('A', 'Southeast Asian'),
('C', 'Central & Southwest Asian'),
('E', 'Eastern European'),
('F', 'All African American Ethnic Groups'),
('I', 'Middle Eastern'),
('J', 'Jewish'),
('M', 'Mediterranean'),
('N', 'Native American'),
('O', 'Far Eastern'),
('P', 'Polynesian'),
('S', 'Scandinavian'),
('T', 'Other'),
('W', 'Western European'),
('Y', 'Hispanic'))
vdata ([Ethnic_Group], [Description])


SELECT 	[Ethnic_Group], [Description] INTO EthnicGroup 	FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Ethnic_Group] ON EthnicGroup([Ethnic_Group])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON EthnicGroup([Description])
