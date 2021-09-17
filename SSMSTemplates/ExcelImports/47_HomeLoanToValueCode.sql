DROP TABLE IF EXISTS [HomeLoanToValueCode]

SELECT TRIM([Home_Loan_To_Value_Code]) AS [Home_Loan_To_Value_Code],
	TRIM([Description]) as [Description]
INTO [HomeLoanToValueCode]
FROM (SELECT
	[Home_Loan_To_Value_Code], [Description]
FROM (VALUES
('Blank', ''),
('A', '99% - 100%'),
('B', '95% - 98%'),
('C', '90% - 94%'),
('D', '85% - 89%'),
('E', ' 80% - 84%'),
('F', '75% - 79%'),
('G', '70% - 74%'),
('H', ' 60% - 69%'),
('I', ' 50% - 59%'),
('J', '1% - 49%'),
('K', '0% (No Loans)'))
vdata ([Home_Loan_To_Value_Code], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Loan_To_Value_Code] ON [HomeLoanToValueCode] ([Home_Loan_To_Value_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomeLoanToValueCode] ([Description])
