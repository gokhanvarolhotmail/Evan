DROP TABLE IF EXISTS [DiscretionaryIncomeCode]

SELECT [Discretionary_Income_Code],
	[Discretionary_Income_Description] as [Description]
INTO [DiscretionaryIncomeCode]
FROM (SELECT
	[Discretionary_Income_Code], [Discretionary_Income_Description]
FROM (VALUES
('A', 'Up to $9,999'),
('B', '$10,000 to $29,999'),
('C', '$30,000 to $49,999'),
('D', '$50,000 to $69,999'),
('E', '$70,000 to $99,999'),
('F', '$100,000 to $124,999'),
('G', '$125,000 to $149,999'),
('H', 'Over $150,000'))
vdata ([Discretionary_Income_Code], [Discretionary_Income_Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Discretionary_Income_Code] ON [DiscretionaryIncomeCode] ([Discretionary_Income_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [DiscretionaryIncomeCode] ([Description])
