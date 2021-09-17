SELECT
	[Address_Street_Pre / Address_Street_Post], [Description]
INTO #temp
FROM (VALUES
('Blank', ''),
('N', 'North'),
('E', 'East'),
('W', 'West'),
('S', 'South'),
('NE', 'North-East'),
('NW', 'North-West'),
('SE', 'South-East'),
('SW', 'South-West'))
vdata ([Address_Street_Pre / Address_Street_Post], [Description])




SELECT 	[Address_Street_Pre / Address_Street_Post], [Description] INTO AddressStreetPrePost  FROM #temp


CREATE UNIQUE CLUSTERED INDEX [Address_Street_Pre / Address_Street_Post] ON AddressStreetPrePost  ([Address_Street_Pre / Address_Street_Post])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON AddressStreetPrePost  ([Description])
