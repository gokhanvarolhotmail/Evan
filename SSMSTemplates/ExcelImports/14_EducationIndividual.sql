SELECT
	[Education_Individual], [Description]
INTO #temp
FROM (VALUES
('Blank', ''),
('A', 'Completed High School'),
('B', 'Completed College'),
('C', 'Completed Graduate School'),
('D', 'Attended Vocational/Technical'),
('E', 'Attended College '),
('F', 'Did Not Complete High School'))
vdata ([Education_Individual], [Description])



SELECT	[Education_Individual], [Description] INTO EducationIndividual FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Education_Individual] ON EducationIndividual ([Education_Individual])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON EducationIndividual ([Description])