SELECT
	[Data Source], [Field Name], [Code], [Code Description]
INTO GeoMatchCode
FROM (VALUES
('A', 'Match Code', 1, 'Street Level Geocoded'),
('A', 'Match Code', 2, 'Zip 9 Centroid'),
('A', 'Match Code', 3, 'Zip 7 Centroid'),
('A', 'Match Code', 4, 'Zip 5 Centroid'),
('A', 'Match Code', 5, 'Not Geocoded but fixed by "Block Group Fill Gap" (Fill Census Block and average Latitude and Longitude)'),
('A', 'Match Code', 6, 'Address source is deed; Street Level Geocoded'),
('A', 'Match Code', 7, 'Address source is deed; Zip 9 Centroid'),
('A', 'Match Code', 8, 'Address source is deed; Zip 7 Centroid'),
('A', 'Match Code', 9, 'Address source is deed; Zip 5 Centroid'))
vdata ([Data Source], [Field Name], [Code], [Code Description])


create UNIQUE CLUSTERED INDEX [Code] ON GeoMatchCode([Code] )
