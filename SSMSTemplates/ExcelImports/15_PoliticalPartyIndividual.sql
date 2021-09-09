SELECT
	[Political_Party_Individual], [Description]
INTO #temp
FROM (VALUES
('Blank', ''),
('V', 'Voter - No Party'),
('R', 'Voter – Republican'),
('D', 'Voter – Democratic'),
('I', 'Voter - Independent'))
vdata ([Political_Party_Individual], [Description])


SELECT [Political_Party_Individual], [Description] INTO PoliticalPartyIndividual FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Political_Party_Individual] ON PoliticalPartyIndividual ([Political_Party_Individual])

CREATE UNIQUE NONCLUSTERED INDEX [Description] ON PoliticalPartyIndividual ([Description])