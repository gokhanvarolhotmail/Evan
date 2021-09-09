DROP TABLE IF EXISTS [HomeAssessedValue_HomePurchaseAmount]

SELECT TRIM([Home_Assessed_Value / Home_Purchase_Amount]) AS [Home_Assessed_Value / Home_Purchase_Amount],
	TRIM([Description]) as [Description]
INTO [HomeAssessedValue_HomePurchaseAmount]
FROM (SELECT
	[Home_Assessed_Value / Home_Purchase_Amount], [Description]
FROM (VALUES
('Blank', ''),
('A', 'Less than $50,000'),
('B', '$50,000 - $99,999'),
('C', '$100,000 - $149,999'),
('D', ' $150,000 - $199,999'),
('E', '$200,000 - $249,999'),
('F', ' $250,000 - $299,999'),
('G', '$300,000 - $349,999'),
('H', '$350,000 - $399,999'),
('I', '$400,000 - $449,999'),
('J', '$450,000 - $499,999'),
('K', '$500,000 - $599,999'),
('L', '$600,000 - $699,999'),
('M', '$700,000 - $799,999'),
('N', '$800,000 - $999,999'),
('O', ' $1,000,000 - $1,499,999'),
('P', '$1,500,000 - $1,999,999'),
('Q', 'Greater than $2,000,000'))
vdata ([Home_Assessed_Value / Home_Purchase_Amount], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Assessed_Value / Home_Purchase_Amount] ON [HomeAssessedValue_HomePurchaseAmount] ([Home_Assessed_Value / Home_Purchase_Amount])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomeAssessedValue_HomePurchaseAmount] ([Description])