DROP TABLE IF EXISTS [UnsecuredCreditCapacityCode]

SELECT [Unsecured_Credit_Capacity_Code],
	[Unsecured_Credit_Capacity_Description] as [Description]
INTO [UnsecuredCreditCapacityCode]
FROM (SELECT
	[Unsecured_Credit_Capacity_Code], [Unsecured_Credit_Capacity_Description]
FROM (VALUES
('A', 'Up to $4,999'),
('B', '$5,000 to $9,999'),
('C', '$10,000 to $24,999'),
('D', '$25,000 to $49,999'),
('E', '$50,000 to $99,999'),
('F', 'Over $100,000'))
vdata ([Unsecured_Credit_Capacity_Code], [Unsecured_Credit_Capacity_Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Unsecured_Credit_Capacity_Code] ON [UnsecuredCreditCapacityCode] ([Unsecured_Credit_Capacity_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [UnsecuredCreditCapacityCode] ([Description])
