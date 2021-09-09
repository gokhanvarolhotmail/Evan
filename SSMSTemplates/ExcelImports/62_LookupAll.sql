SELECT *
INTO [#TEMP]
FROM [Metadata].[Columns]
WHERE [SchemaName] = 'lOOKUP' ;

SELECT [FQN]
INTO [#temp2]
FROM [#TEMP]
GROUP BY [FQN]
HAVING COUNT(1) = 2 AND MAX(CASE WHEN [ColumnId] = 2 THEN [ColumnName] END) = 'Description' ;

DECLARE @SQL NVARCHAR(MAX) ;

SELECT @SQL = CONCAT('CREATE OR ALTER VIEW [Lookup].[ALL]
as
', STRING_AGG([k].[SQL], '
UNION ALL
')WITHIN GROUP(ORDER BY [FQN]))
FROM( SELECT
          [FQN]
        , CONCAT(
              CAST(NULL AS VARCHAR(MAX)), 'SELECT ''', MAX([ObjectName]), ''' as [TableName], ''', MAX(CASE WHEN [ColumnId] = 1 THEN [ColumnName] END), ''' as [FirstColumnName], ', MAX(CASE WHEN [ColumnId] = 1 THEN QUOTENAME([ColumnName])END), ' as [Value], '
            , MAX(CASE WHEN [ColumnId] = 2 THEN QUOTENAME([ColumnName])END), ' as [Description] FROM ', [FQN]) AS [SQL]
      FROM [#TEMP]
      WHERE [FQN] IN( SELECT [FQN] FROM [#temp2] )
      GROUP BY [FQN] ) AS [k] ;

EXEC( @SQL ) ;

SELECT @SQL AS [SQL] ;
