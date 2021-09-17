USE [Evan] ;
GO
CREATE OR ALTER VIEW [Definition].[vOpenLien]
AS
SELECT
    *
  , CAST(CASE WHEN [k].[Data_Format] = 'YYYYMMDD' THEN
                  CONCAT('CAST(NULLIF([Column], ''0'') AS DATE) AS ', QUOTENAME(REPLACE([k].[Field_Display_Name], ' ', '_')))
             WHEN [k].[Data_Format] = 'MMDDYYYY' THEN
                 CONCAT(
                     'CASE WHEN [Column] = ''0'' THEN NULL ELSE CAST(RIGHT([Column],4) + LEFT([Column],4) AS DATE) END AS '
                     , QUOTENAME(REPLACE([k].[Field_Display_Name], ' ', '_')))
             ELSE CONCAT('CAST([Column] AS ', [k].[ColumnDef], ') AS ', QUOTENAME(REPLACE([k].[Field_Display_Name], ' ', '_')))
         END AS VARCHAR(MAX)) AS [Casted]
FROM( SELECT
          [Field] AS [Field #]
        , [ColumnName]
        , [Field_Display_Name] AS [FieldName]
        , [Max_Length]
        , [Data_Type]
        , CASE WHEN [Field_Display_Name] = 'Quantarium Internal PID' AND [Data_Type] = 'INT' AND [Max_Length] = 10 THEN 'BIGINT'
              WHEN [Field_Display_Name] = 'Location_ID' AND [Data_Type] = 'varchar' AND [Max_Length] = 50 THEN 'BIGINT'
              WHEN [Field_Display_Name] = 'Household_ID' AND [Data_Type] = 'varchar' AND [Max_Length] = 14 THEN 'BIGINT'
              WHEN [Field_Display_Name] = 'Individual_ID' AND [Data_Type] = 'varchar' AND [Max_Length] = 14 THEN 'BIGINT'
              WHEN [Field_Display_Name] = 'Location_ID' AND [Data_Type] = 'varchar' AND [Max_Length] = 14 THEN 'BIGINT'
              WHEN [Data_Type] IN ('varchar', 'char') THEN CONCAT('VARCHAR(', [Max_Length], ')')
              WHEN [Data_Type] = 'Numeric' AND [Max_Length] <= 4 THEN 'SMALLINT'
              WHEN [Data_Type] = 'Numeric' AND [Max_Length] <= 9 THEN 'INT'
              WHEN [Data_Type] = 'Numeric' THEN 'BIGINT'
              WHEN [Data_Type] = 'INT' THEN 'INT'
              WHEN [Data_Type] = 'SMALLINT' THEN 'SMALLINT'
              WHEN [Data_Type] = 'BIGINT' THEN 'BIGINT'
              WHEN [Data_Type] = 'DATE' THEN 'DATE'
              ELSE [Data_Type]
          END AS [ColumnDef]
        , [Field]
        , [Data_Category]
        , [Field_Display_Name]
        , [Header_Name_in_Delivered_File]
        , [Data_Format]
        , [CodeXlate_Field]
        , [Field_Description]
        , [Version]
        , [Change_Type]
      FROM [Definition].[OpenLien] ) AS [k] ;
GO
SELECT CONCAT('DROP TABLE IF EXISTS [#OpenLien]
GO
CREATE TABLE [#OpenLien]
(	', STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), QUOTENAME([FieldName]), ' ', [ColumnDef]), ',
	')WITHIN GROUP(ORDER BY [Field #]), '
)
GO
')  AS [SQL]
FROM [Definition].[vOpenLien] ;
GO
SELECT *
FROM [Definition].[vOpenLien] ;
