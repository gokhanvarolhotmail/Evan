DROP TABLE IF EXISTS [CreditRangeNewCredit]

SELECT [Credit_Range_New_Credit],
	[Description] as [Description]
INTO [CreditRangeNewCredit]
FROM (SELECT
	[Credit_Range_New_Credit], [Description]
FROM (VALUES
('Blank', ''),
('0', '$0 - $100'),
('1', '$101 - $300'),
('2', '$301 - $500'),
('3', '$501 - $1,000'),
('4', '$1,001 - $3,000'),
('5', '$3,001 - $5,000'),
('6', '$5,001 - $9,999'),
('7', '$10,000+'))
vdata ([Credit_Range_New_Credit], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Credit_Range_New_Credit] ON [CreditRangeNewCredit] ([Credit_Range_New_Credit])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [CreditRangeNewCredit] ([Description])
