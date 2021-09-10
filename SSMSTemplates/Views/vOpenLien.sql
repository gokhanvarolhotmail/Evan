USE [Evan] ;
GO
CREATE OR ALTER VIEW [Definition].[vOpenLien]
AS
SELECT
    [Field] AS [Field #]
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
FROM [Definition].[OpenLien] ;
GO

SELECT *
FROM [Definition].[vOpenLien] ;