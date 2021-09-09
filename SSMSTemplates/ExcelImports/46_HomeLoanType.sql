DROP TABLE IF EXISTS [HomeLoanType]

SELECT TRIM([Home_Loan_Type]) AS [Home_Loan_Type],
	TRIM([Description]) as [Description]
INTO [HomeLoanType]
FROM (SELECT
	[Home_Loan_Type], [Description]
FROM (VALUES
('Blank', ''),
('5', 'Community Development Authority'),
('C', 'Conventional'),
('F', 'FHA'),
('P', 'Private Party Lender'),
('S', 'Small Business Administration'),
('V', 'VA'),
('W', 'Wrap-Around Mortgage'))
vdata ([Home_Loan_Type], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Loan_Type] ON [HomeLoanType] ([Home_Loan_Type])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomeLoanType] ([Description])