DROP TABLE IF EXISTS [HomeLoanTransactionType]

SELECT TRIM([Home_Loan_Transaction_Type]) AS [Home_Loan_Transaction_Type],
	TRIM([Description]) as [Description]
INTO [HomeLoanTransactionType]
FROM (SELECT
	[Home_Loan_Transaction_Type], [Description]
FROM (VALUES
('Blank', ''),
('C', 'Construction Loan'),
('N', 'Subdivision/New Construction'),
('R', 'Resale'),
('S', 'Seller Carryback'))
vdata ([Home_Loan_Transaction_Type], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Loan_Transaction_Type] ON [HomeLoanTransactionType] ([Home_Loan_Transaction_Type])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomeLoanTransactionType] ([Description])
