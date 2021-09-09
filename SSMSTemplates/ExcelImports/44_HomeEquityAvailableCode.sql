DROP TABLE IF EXISTS [HomeEquityAvailableCode]

SELECT TRIM([Home_Equity_Available_Code]) AS [Home_Equity_Available_Code],
	TRIM([Home_Equity_Available_Description]) as [Description]
INTO [HomeEquityAvailableCode]
FROM (SELECT
	[Home_Equity_Available_Code], [Home_Equity_Available_Description]
FROM (VALUES
('Blank', ''),
('A', '$1 - $4,999'),
('B', '$5,000 - $9,999'),
('C', '$10,000 - $19,999'),
('D', '$20,000 - $29,999'),
('E', '$30,000 - $49,999'),
('F', '$50,000 - $74,999'),
('G', ' $75,000 - $99,999'),
('H', '$100,000 - $149,999'),
('I', '$150,000 - $199,999'),
('J', '$200,000 - $249,999'),
('K', ' $250,000 - $499,999'),
('L', '$500,000 - $749,999'),
('M', '$750,000 - $999,999'),
('N', '$1,000,000 - $1,999,999'),
('O', 'Greater than $1,999,999'))
vdata ([Home_Equity_Available_Code], [Home_Equity_Available_Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Equity_Available_Code] ON [HomeEquityAvailableCode] ([Home_Equity_Available_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomeEquityAvailableCode] ([Description])