USE [Evan] ;
GO
SELECT TOP( 1000 )
       [Location_ID]
     , [Household_ID_Owner_1]
     , [Individual_ID_Owner_1]
     , [Age_Owner_1]
     , [Ethnic_Code_Owner_1]
     , [Gender_Owner_1]
     , [Quantarium_Owner_Name_1_Matched_Ind]
     , [Quantarium_Demo_QId_1]
     , [Household_ID_Owner_2]
     , [Individual_ID_Owner_2]
     , [Age_Owner_2]
     , [Ethnic_Code_Owner_2]
     , [Gender_Owner_2]
     , [Quantarium_Owner_Name_2_Matched_Ind]
     , [Quantarium_Demo_QId_2]
     , [Quantarium_Internal_PID]
     , [FIPS_Code]
     , [CountyName]
     , [Assessors_Parcel_Number]
     , [Quantarium_Standardized_Land_Use_Code]
     , [UseDesc]
     , [Quantarium_Res_/_NonRes]
     , [Quantarium_Owner_Occupied]
     , [Quantarium_Address_Matched_Ind]
     , [Quantarium_Number_Of_Owners_On_Asmt]
     , [Quantarium_Number_Of_Owners_On_Demo]
     , [Start_Date]
     , [CrossRefQId]
     , [Processed Date]
FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622] ;
GO
SELECT
    ISNULL([v].FieldName, [c].ColumnName) AS ColumnName
	,c.ColumnName
  , [v].*
  , REPLACE([Casted], '[Column]', QUOTENAME([c].[ColumnName])) + ',' AS [SQL]
FROM( SELECT * FROM [Metadata].[Columns] AS [c] WHERE [c].[ObjectName] = 'Quantarium_Houseamp_WA_Select_DemoXref_20210622' ) AS [c]
FULL OUTER JOIN [Definition].[vDemoQIDXrefLayout] AS [v] ON [v].FieldName = [c].ColumnName OR REPLACE([v].FieldName , ' ','_')= REPLACE([c].ColumnName , ' ','_')


SELECT * FROM [Definition].[vDemoQIDXrefLayout] 