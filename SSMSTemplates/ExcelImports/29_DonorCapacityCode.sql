DROP TABLE IF EXISTS [DonorCapacityCode]

SELECT [Donor_Capacity_Code],
	[Donor_Capacity_Description] as [Description]
INTO [DonorCapacityCode]
FROM (SELECT
	[Donor_Capacity_Code], [Donor_Capacity_Description]
FROM (VALUES
('A', 'Up to $499'),
('B', '$500 to $999'),
('C', '$1,000 to $2,499'),
('D', '$2,500 to $4,999'),
('E', 'Over $5,000'))
vdata ([Donor_Capacity_Code], [Donor_Capacity_Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Donor_Capacity_Code] ON [DonorCapacityCode] ([Donor_Capacity_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [DonorCapacityCode] ([Description])