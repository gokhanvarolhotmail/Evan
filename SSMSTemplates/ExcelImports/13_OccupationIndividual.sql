SELECT
	[Occupation_Individual], [Description]
INTO #temp
FROM (VALUES
('Blank', ''),
('1', ' Professional / Technical'),
('2', ' Administration / Managerial'),
('3', ' Sales / Service'),
('4', ' Clerical / White Collar'),
('5', ' Craftsman / Blue Collar'),
('6', ' Student'),
('7', ' Homemaker'),
('8', ' Retired'),
('9', ' Farmer'),
('A ', ' Military'),
('B ', ' Religious'),
('C ', ' Self Employed'),
('D ', ' Self Employed - Professional / Technical'),
('E ', ' Self Employed - Administration / Managerial'),
('F ', ' Self Employed - Sales / Service'),
('G ', ' Self Employed - Clerical / White Collar'),
('H ', ' Self Employed - Craftsman / Blue Collar'),
('I ', ' Self Employed - Student'),
('J ', ' Self Employed - Homemaker'),
('K ', ' Self Employed - Retired'),
('L ', ' Self Employed - Other'),
('V ', ' Educator'),
('W ', ' Financial Professional'),
('X ', ' Legal Professional'),
('Y ', ' Medical Professional'),
('Z ', ' Other'))
vdata ([Occupation_Individual], [Description])


SELECT	[Occupation_Individual], [Description] INTO OccupationIndividual FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Occupation_Individual] ON OccupationIndividual ([Occupation_Individual] )
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON OccupationIndividual ([Description] )