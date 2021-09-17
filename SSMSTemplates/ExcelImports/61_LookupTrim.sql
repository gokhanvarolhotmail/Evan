USE [Evan] ;
GO
SELECT CONCAT('UPDATE [t] SET
	', STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), QUOTENAME([ColumnName]), ' = TRIM(''', CHAR(32) + CHAR(9) + CHAR(10) + CHAR(13), ''' FROM ', QUOTENAME([ColumnName]), ')'), ',
	'), '
FROM ', [FQN], ' [t]
GO
')  AS [SQL]
FROM [Metadata].[Columns]
WHERE [SchemaName] = 'Lookup' AND [CollationName] <> ''
GROUP BY [FQN] ;
