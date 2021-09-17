SELECT
	[Household_Size], [Description]
INTO #temp
FROM (VALUES
('Blank', ''),
('1', '1 Person in the Household'),
('2', '2 Persons in the Household'),
('3', '3 Persons in the Household'),
('4', '4 Persons in the Household'),
('5', '5 Persons in the Household'),
('6', '6 Persons in the Household'),
('7', '7 Persons in the Household'),
('8', '8 Persons in the Household'),
('9', 'More than 8 Persons in the Household'))
vdata ([Household_Size], [Description])


SELECT 	[Household_Size], [Description] INTO HouseholdSize FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Household_Size] ON HouseholdSize ([Household_Size])

CREATE UNIQUE NONCLUSTERED INDEX [Description] ON HouseholdSize ([Description])
