USE [Evan] ;
GO
CREATE OR ALTER VIEW [Definition].[vXRef]
AS
SELECT
    *
  , CAST(CONCAT('CAST([Column] AS ', [k].[ColumnDef], ') AS ', QUOTENAME(REPLACE([k].[FieldName], ' ', '_'))) AS VARCHAR(MAX)) AS [Casted]
FROM( SELECT
          [Field #]
        , [FieldName]
        , [Max_Length]
        , [Data_Type]
        , CASE WHEN [Data_Type] IN ('varchar', 'char') THEN CONCAT('VARCHAR(', [Max_Length], ')')
              WHEN [Data_Type] = 'Numeric' AND [Max_Length] <= 4 THEN 'SMALLINT'
              WHEN [Data_Type] = 'Numeric' AND [Max_Length] <= 9 THEN 'INT'
              WHEN [Data_Type] = 'Numeric' THEN 'BIGINT'
              WHEN [Data_Type] = 'INT' THEN 'INT'
              WHEN [Data_Type] = 'SMALLINT' THEN 'SMALLINT'
              WHEN [Data_Type] = 'BIGINT' THEN 'BIGINT'
              WHEN [Data_Type] = 'DATE' THEN 'DATE'
              ELSE [Data_Type]
          END AS [ColumnDef]
        , [Max Length]
        , [Field Description]
        , [Field Notes]
        , [Version]
        , [Change Type]
      FROM [Definition].[XRef] ) AS [k] ;
GO
SELECT CONCAT('DROP TABLE IF EXISTS [#XRef]
GO
CREATE TABLE [#XRef]
(	', STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), QUOTENAME([FieldName]), ' ', [ColumnDef]), ',
	')WITHIN GROUP(ORDER BY [Field #]), '
)
GO
')  AS [SQL]
FROM [Definition].[vXRef] ;
GO
SELECT *
FROM [Definition].[vXRef] ;

