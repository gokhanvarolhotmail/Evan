DROP TABLE IF EXISTS [NetWorthCode]

SELECT [NetWorth_Code],
	[NetWorth_Description] as [Description]
INTO [NetWorthCode]
FROM (SELECT
	[NetWorth_Code], [NetWorth_Description]
FROM (VALUES
('A', 'Up to $30,000'),
('B', '$30,001 to $100,000'),
('C', '$100,001 to $500,000'),
('D', '$500,001 to $1,500,000'),
('E', 'Over $1,500,000'))
vdata ([NetWorth_Code], [NetWorth_Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [NetWorth_Code] ON [NetWorthCode] ([NetWorth_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [NetWorthCode] ([Description])


