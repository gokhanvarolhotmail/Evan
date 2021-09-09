DROP TABLE IF EXISTS [HomeAirConditioning]

SELECT TRIM([Home_Air_Conditioning]) AS [Home_Air_Conditioning],
	TRIM([Description]) as [Description]
INTO [HomeAirConditioning]
FROM (SELECT
	[Home_Air_Conditioning], [Description]
FROM (VALUES
('Blank', ''),
('A', 'AC.Central'),
('B', 'AC.Central & Unit'),
('C', 'AC.Dual Unit'),
('D', 'AC.Evaporative'),
('E', 'AC.Heat pump'),
('F', 'AC.Refrigeration'),
('G', 'AC.Package'),
('H', 'AC.Separate System'),
('I', 'AC.Split System'),
('J', 'AC.Wall Unit'),
('K', 'AC.Window Unit'),
('L', 'AC.Wall/Window Unit'))
vdata ([Home_Air_Conditioning], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Home_Air_Conditioning] ON [HomeAirConditioning] ([Home_Air_Conditioning])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [HomeAirConditioning] ([Description])