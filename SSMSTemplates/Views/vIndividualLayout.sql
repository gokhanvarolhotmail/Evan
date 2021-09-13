USE [Evan] ;
GO
CREATE OR ALTER VIEW [Definition].[vIndividualLayout]
AS
SELECT
    *
  , CAST(CONCAT('CAST([Column] AS ', [k].[ColumnDef], ') AS ', QUOTENAME(REPLACE([k].[FieldName], ' ', '_'))) AS VARCHAR(MAX)) AS [Casted]
FROM( SELECT
          [FieldGroup]
        , [Field #]
        , [Field Name] AS [FieldName]
        , [Length] AS [Max_Length]
        , [Data Type] AS [Data_Type]
        , [Field Name]
        , [Data Type]
        , [Length]
        , [Field Description]
        , [Field Description Detail]
        , CASE WHEN [Field Name] = 'Quantarium Internal PID' AND [Data Type] = 'INT' AND [Length] = 10 THEN 'BIGINT'
              WHEN [Field Name] = 'Location_ID' AND [Data Type] = 'varchar' AND [Length] = 50 THEN 'BIGINT'
              WHEN [Field Name] = 'Household_ID' AND [Data Type] = 'varchar' AND [Length] = 14 THEN 'BIGINT'
              WHEN [Field Name] = 'Individual_ID' AND [Data Type] = 'varchar' AND [Length] = 14 THEN 'BIGINT'
              WHEN [Field Name] = 'Location_ID' AND [Data Type] = 'varchar' AND [Length] = 14 THEN 'BIGINT'
              WHEN [Data Type] IN ('varchar', 'char') THEN CONCAT('VARCHAR(', [Length], ')')
              WHEN [Data Type] = 'Numeric' AND [Length] <= 4 THEN 'SMALLINT'
              WHEN [Data Type] = 'Numeric' AND [Length] <= 9 THEN 'INT'
              WHEN [Data Type] = 'Numeric' THEN 'BIGINT'
              WHEN [Data Type] = 'INT' THEN 'INT'
              WHEN [Data Type] = 'SMALLINT' THEN 'SMALLINT'
              WHEN [Data Type] = 'BIGINT' THEN 'BIGINT'
              WHEN [Data Type] = 'DATE' THEN 'DATE'
              ELSE [Data Type]
          END AS [ColumnDef]
      FROM [Definition].[IndividualLayout] ) AS [k] ;
GO
SELECT CONCAT('DROP TABLE IF EXISTS [#IndividualLayout]
GO
CREATE TABLE [#IndividualLayout]
(	', STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), QUOTENAME([FieldName]), ' ', [ColumnDef]), ',
	')WITHIN GROUP(ORDER BY [Field #]), '
)
GO
')  AS [SQL]
FROM [Definition].[vIndividualLayout] ;
GO
SELECT *
FROM [Definition].[vIndividualLayout] ;