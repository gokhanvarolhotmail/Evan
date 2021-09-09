DROP TABLE IF EXISTS [MedianHomeValueCode]

SELECT [Median_Home_Value_Code],
	[Median_Home_Value_Description] as [Description]
INTO [MedianHomeValueCode]
FROM (SELECT
	[Median_Home_Value_Code], [Median_Home_Value_Description]
FROM (VALUES
('Blanks', ''),
('1', 'Up to $10,000'),
('2', '$10,000 to $24,999'),
('3', '$25,000 to $49,999'),
('4', '$50,000 to $74,999'),
('5', '$75,000 to $99,999'),
('6', '$100,000 to $124,999'),
('7', '$125,000 to $149,999'),
('8', '$150,000 to $174,999'),
('9', '$175,000 to $199,999'),
('A', '$200,000 to $224,999'),
('B', '$225,000 to $249,999'),
('C', '$250,000 to $274,999'),
('D', '$275,000 to $299,999'),
('E', '$300,000 to $349,999'),
('F', '$350,000 to $399,999'),
('G', '$400,000 to $449,999'),
('H', '$450,000 to $499,999'),
('I', '$500,000 to $749,999'),
('J', '$750,000 to $999,999'),
('K', '$1,000,000 or More'))
vdata ([Median_Home_Value_Code], [Median_Home_Value_Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Median_Home_Value_Code] ON [MedianHomeValueCode] ([Median_Home_Value_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [MedianHomeValueCode] ([Description])