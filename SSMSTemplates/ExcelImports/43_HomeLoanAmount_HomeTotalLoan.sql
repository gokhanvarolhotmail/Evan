DROP TABLE IF EXISTS [HomeLoanAmount_HomeTotalLoan]

SELECT TRIM([Home_Loan_Amount / Home_Total_Loan]) AS [Home_Loan_Amount / Home_Total_Loan],
	TRIM([Description]) as [Description]
INTO [HomeLoanAmount_HomeTotalLoan]
FROM (SELECT
	[Home_Loan_Amount / Home_Total_Loan], [Description]
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
('K', '$250,000 - $299,999'),
('L', ' $300,000 - $349,999'),
('M', ' $350,000 - $399,999'),
('N', '$400,000 - $499,999'),
('O', '$500,000 - $749,999'),
('P', '$750,000 - $999,999'),
('Q', '$1,000,000 - $1,999,999'),
('R', 'Greater than $1,999,999'))
vdata ([Home_Loan_Amount / Home_Total_Loan], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Loan_Amount / Home_Total_Loan] ON [HomeLoanAmount_HomeTotalLoan] ([Home_Loan_Amount / Home_Total_Loan])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomeLoanAmount_HomeTotalLoan] ([Description])