USE [Evan] ;
GO
CREATE OR ALTER VIEW [Definition].[vMLS]
AS
SELECT
    *
  , CAST(CONCAT('CAST([Column] AS ', [k].[ColumnDef], ') AS ', QUOTENAME(REPLACE([k].[FieldName], ' ', '_'))) AS VARCHAR(MAX)) AS [Casted]
FROM( SELECT
          [K].[FieldNo] AS [Field #]
        , [ColumnName]
        , [K].[FieldName]
        , [K].[MaxLen] AS [Max_Length]
        , [K].[Numbers]
        , [K].[DataType] AS [Data_Type]
        , CASE WHEN [K].[DataType] IN ('varchar', 'char') THEN CONCAT('VARCHAR(', [K].[MaxLen], ')')
              WHEN [K].[DataType] = 'Numeric' AND [K].[MaxLen] <= 4 THEN 'SMALLINT'
              WHEN [K].[DataType] = 'Numeric' AND [K].[MaxLen] <= 9 THEN 'INT'
              WHEN [K].[DataType] = 'Numeric' THEN 'BIGINT'
              WHEN [K].[DataType] = 'INT' THEN 'INT'
              WHEN [K].[DataType] = 'SMALLINT' THEN 'SMALLINT'
              WHEN [K].[DataType] = 'BIGINT' THEN 'BIGINT'
              WHEN [K].[DataType] = 'DATE' THEN 'DATE'
              ELSE [K].[DataType]
          END AS [ColumnDef]
      FROM [Definition].[MLS] AS [K] ) AS [k] ;
GO
;
