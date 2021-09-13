USE [Evan] ;
GO
CREATE OR ALTER VIEW [Definition].[vDemoQIDXrefLayout]
AS
SELECT
    *
  , CONCAT('CAST([Column] AS ', [k].[ColumnDef], ') AS ', QUOTENAME(REPLACE([k].[FieldName], ' ', '_'))) AS [Casted]
FROM( SELECT
          [Field #]
        , [Fieldname] AS [FieldName]
        , [Max Length] AS [Max_Length]
        , [Data Type] AS [Data_Type]
        , CASE WHEN [Fieldname] = 'Quantarium Internal PID' AND [Data Type] = 'INT' AND [Max Length] = 10 THEN 'BIGINT'
              WHEN [Fieldname] = 'Location_ID' AND [Data Type] = 'varchar' AND [Max Length] = 50 THEN 'BIGINT'
              WHEN [Fieldname] = 'Household_ID' AND [Data Type] = 'varchar' AND [Max Length] = 14 THEN 'BIGINT'
              WHEN [Fieldname] = 'Individual_ID' AND [Data Type] = 'varchar' AND [Max Length] = 14 THEN 'BIGINT'
              WHEN [Fieldname] = 'Location_ID' AND [Data Type] = 'varchar' AND [Max Length] = 14 THEN 'BIGINT'
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
      FROM [Definition].[DemoQIDXrefLayout] ) AS [k] ;
GO
SELECT CONCAT('DROP TABLE IF EXISTS [#DemoQIDXrefLayout]
GO
CREATE TABLE [#DemoQIDXrefLayout]
(	', STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), QUOTENAME([FieldName]), ' ', [ColumnDef]), ',
	')WITHIN GROUP(ORDER BY [Field #]), '
)
GO
')  AS [SQL]
FROM [Definition].[vDemoQIDXrefLayout] ;
GO

SELECT *
FROM [Definition].[vDemoQIDXrefLayout] ;
