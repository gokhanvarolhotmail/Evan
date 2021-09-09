SELECT
	[Length_of_Residence_Code], [Length_of_Residence_Description]
into #temp
FROM (VALUES
('Blank', ''),
('A', 'Less Than 1 year'),
('B', '1 to 2 Years'),
('C', '3 to 5 Years '),
('D', '6 to 9 Years'),
('E', '10 to 14 Years'),
('F', ' Over 15 Years'))
vdata ([Length_of_Residence_Code], [Length_of_Residence_Description])


SELECT 	[Length_of_Residence_Code], [Length_of_Residence_Description] AS[Description] INTO LengthOfResidenceCode FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Length_of_Residence_Code] ON LengthOfResidenceCode ([Length_of_Residence_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON LengthOfResidenceCode ([Description])