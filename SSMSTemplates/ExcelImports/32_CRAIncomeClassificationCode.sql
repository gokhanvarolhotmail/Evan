DROP TABLE IF EXISTS [CRAIncomeClassificationCode]

SELECT [CRA_Income_Classification_Code],
	[Description] as [Description]
INTO [CRAIncomeClassificationCode]
FROM (SELECT
	[CRA_Income_Classification_Code], [Description]
FROM (VALUES
('Blank', ''),
('1', 'Low Income'),
('2', 'Moderate Income'),
('3', 'Middle Income'),
('4', 'High Income'))
vdata ([CRA_Income_Classification_Code], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [CRA_Income_Classification_Code] ON [CRAIncomeClassificationCode] ([CRA_Income_Classification_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [CRAIncomeClassificationCode] ([Description])