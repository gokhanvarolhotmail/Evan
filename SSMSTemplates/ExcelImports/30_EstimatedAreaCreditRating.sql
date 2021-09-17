DROP TABLE IF EXISTS [EstimatedAreaCreditRating]

SELECT [Estimated_Area_Credit_Rating],
	[Description] as [Description]
INTO [EstimatedAreaCreditRating]
FROM (SELECT
	[Estimated_Area_Credit_Rating], [Description]
FROM (VALUES
('Blank', ''),
('A', '800+'),
('B', '750 - 799'),
('C', '700 - 749'),
('D', '650 - 699'),
('E', '600 - 649'),
('F', '550 - 599'),
('G', '500 - 549'),
('H', '0 - 499'))
vdata ([Estimated_Area_Credit_Rating], [Description])) [k]

CREATE UNIQUE CLUSTERED INDEX [Estimated_Area_Credit_Rating] ON [EstimatedAreaCreditRating] ([Estimated_Area_Credit_Rating])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON [EstimatedAreaCreditRating] ([Description])
