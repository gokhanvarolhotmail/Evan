SELECT
	[Hispanic_Country_Of_Origin], [Description]
INTO #temp
FROM (VALUES
('Blank', ''),
('HA', 'Argentina'),
('HB', 'Bolivia'),
('HC', 'Cuba'),
('HD', 'Dominican Republic'),
('HE', 'El Salvador'),
('HG', 'Guatemala'),
('HH', 'Honduras'),
('HJ', 'Colombia'),
('HK', 'Panama'),
('HL', 'Ecuador'),
('HM', 'Mexico'),
('HN', 'Nicaragua'),
('HP', 'Puerto Rico'),
('HQ', 'Chile'),
('HR', 'Costa Rica'),
('HS', 'Spain'),
('HU', 'Uruguay'),
('HV', 'Venezuela'),
('HX', 'Peru'),
('HY', 'Paraguay'),
('HZ', 'Brazil'))
vdata ([Hispanic_Country_Of_Origin], [Description])


SELECT [Hispanic_Country_Of_Origin], [Description] INTO HispanicCountryOfOrigin FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Hispanic_Country_Of_Origin] ON HispanicCountryOfOrigin  ([Hispanic_Country_Of_Origin])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON HispanicCountryOfOrigin  ([Description])