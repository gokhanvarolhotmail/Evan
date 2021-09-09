DROP TABLE IF EXISTS [HomeValueCode]

SELECT [Home_Value_Code],
	[Home_Value_Description] as [Description]
INTO [HomeValueCode]
FROM (SELECT
	[Home_Value_Code], [Home_Value_Description]
FROM (VALUES
('A', 'Up to $24,999'),
('B', '$25,000 to $49,999'),
('C', '$50,000 to $74,999'),
('D', '$75,000 to $99,999'),
('E', '$100,000  to $124,999'),
('F', '$125,000 to $149,999'),
('G', '$150,000 to $174,999'),
('H', '$175,000 to $199,999'),
('I', '$200,000 to $224,999'),
('J', '$225,000 to $249,999'),
('K', '$250,000 to $274,999'),
('L', '$275,000 to $299,999'),
('M', '$300,000 to $349,999'),
('N', '$350,000 to $399,999'),
('O', '$400,000 to $449,999'),
('P', '$450,000 to $499,999'),
('Q', '$500,000 to $749,999'),
('R', '$750,000 to $999,999'),
('S', '$1,000,000 to $1,499,999'),
('T', '$1,500,000 to $2,499,999'),
('U', '$2,500,000 to $4,999,999'),
('V', '$5,000,000 to $9,999,999'),
('W', 'Over $10,000,000'))
vdata ([Home_Value_Code], [Home_Value_Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Value_Code] ON [HomeValueCode] ([Home_Value_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomeValueCode] ([Description])