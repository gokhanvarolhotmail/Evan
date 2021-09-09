DROP TABLE IF EXISTS [HomePropertyTypeDetail]

SELECT [Home_Property_Type_Detail],
	[Description] as [Description]
INTO [HomePropertyTypeDetail]
FROM (SELECT
	[Home_Property_Type_Detail], [Description]
FROM (VALUES
('Blank', ''),
('A', 'Single Family Dwelling Unit'),
('B', 'Condo'),
('C', 'Cooperative'),
('D', '2-4 Unit (Duplex, Triplex, Quad)'),
('E', 'Miscellaneous Residence (Combo Store/Flat)'),
('G', ' Apartment (5+ Units)'),
('M', 'Mobile Home'),
('T', 'Timeshare'))
vdata ([Home_Property_Type_Detail], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Property_Type_Detail] ON [HomePropertyTypeDetail] ([Home_Property_Type_Detail])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomePropertyTypeDetail] ([Description])