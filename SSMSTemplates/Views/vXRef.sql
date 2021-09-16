USE [Evan] ;
GO
CREATE OR ALTER VIEW [Definition].[vXRef]
AS
SELECT
    *
  , CAST(CASE WHEN [k].[Data_Type] = 'DATE' THEN
                  CONCAT('CAST(NULLIF([Column], ''0'') AS ', [k].[ColumnDef], ') AS ', QUOTENAME(REPLACE([k].[FieldName], ' ', '_')))
             ELSE CONCAT('CAST([Column] AS ', [k].[ColumnDef], ') AS ', QUOTENAME(REPLACE([k].[FieldName], ' ', '_')))
         END AS VARCHAR(MAX)) AS [Casted]
FROM( SELECT
          [Field #]
        , [ColumnName]
        , [FieldName] AS [FieldName]
        , [Max Length] AS [Max_Length]
        , [Data Type] AS [Data_Type]
        , CASE WHEN [FieldName] = 'Quantarium Internal PID' AND [Data Type] = 'INT' AND [Max Length] = 10 THEN 'BIGINT'
              WHEN [FieldName] = 'Location_ID' AND [Data Type] = 'varchar' AND [Max Length] = 50 THEN 'BIGINT'
              WHEN [FieldName] = 'Household_ID' AND [Data Type] = 'varchar' AND [Max Length] = 14 THEN 'BIGINT'
              WHEN [FieldName] = 'Individual_ID' AND [Data Type] = 'varchar' AND [Max Length] = 14 THEN 'BIGINT'
              WHEN [FieldName] = 'Location_ID' AND [Data Type] = 'varchar' AND [Max Length] = 14 THEN 'BIGINT'
              WHEN [Data Type] IN ('varchar', 'char') THEN CONCAT('VARCHAR(', [Max Length], ')')
              WHEN [Data Type] = 'Numeric' AND [Max Length] <= 4 THEN 'SMALLINT'
              WHEN [Data Type] = 'Numeric' AND [Max Length] <= 9 THEN 'INT'
              WHEN [Data Type] = 'Numeric' THEN 'BIGINT'
              WHEN [Data Type] = 'INT' THEN 'INT'
              WHEN [Data Type] = 'SMALLINT' THEN 'SMALLINT'
              WHEN [Data Type] = 'BIGINT' THEN 'BIGINT'
              WHEN [Data Type] = 'DATE' THEN 'DATE'
              ELSE [Data Type]
          END AS [ColumnDef]
        , [Max Length]
        , [Data Type]
        , [Field Description]
        , [Field Notes]
        , [Version]
        , [Change Type]
      FROM [Definition].[XRef] ) AS [k] ;
GO
