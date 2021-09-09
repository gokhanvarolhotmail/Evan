SELECT
	[Mail_Score_Code], [Description]
INTO #temp
FROM (VALUES
(1, '100% Deliverable'),
(2, '80%+ Deliverable'),
(3, 'Undeliverable'),
(4, 'Valid Address, But Does Not Accept Mail'))
vdata ([Mail_Score_Code], [Description])


SELECT 	[Mail_Score_Code], [Description] INTO MailScoreCode FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Mail_Score_Code] ON MailScoreCode ([Mail_Score_Code])
CREATE UNIQUE NONCLUSTERED INDEX [Description] ON MailScoreCode ([Description])