DROP TABLE IF EXISTS [MedianHseHldIncomeCode]

SELECT [Median_HseHld_Income_Code],
	[Median_HseHld_Income_Description] as [Description]
INTO [MedianHseHldIncomeCode]
FROM (SELECT
	[Median_HseHld_Income_Code], [Median_HseHld_Income_Description]
FROM (VALUES
('1', 'Up to $10,000'),
('2', '$10,000 to $14,999'),
('3', '$15,000 to $19,999'),
('4', '$20,000 to $24,999'),
('5', '$25,000 to $29,999'),
('6', '$30,000 to $34,999'),
('7', '$35,000 to $39,999'),
('8', '$40,000 to $44,999'),
('9', '$45,000 to $49,999'),
('A', '$50,000 to $54,999'),
('B', '$55,000 to $59,999'),
('C', '$60,000 to $64,999'),
('D', '$65,000 to $74,999'),
('E', '$75,000 to $99,999'),
('F', '$100,000 to $149,999'),
('G', '$150,000 to $174,999'),
('H', '$175,000 to $199,999'),
('I', '$200,000 to $249,999'),
('J', '$250,000 or More'))
vdata ([Median_HseHld_Income_Code], [Median_HseHld_Income_Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Median_HseHld_Income_Code] ON [MedianHseHldIncomeCode] ([Median_HseHld_Income_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [MedianHseHldIncomeCode] ([Description])