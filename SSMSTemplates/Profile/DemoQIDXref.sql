USE Evan
GO
--CREATE SCHEMA [Profile]
RETURN

--DROP TABLE [tempdb].[dbo].[Profile]
SELECT CONCAT('SELECT ',STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), QUOTENAME(REPLACE(name,'''',''''''))),', ') WITHIN GROUP(ORDER BY NAME), ' FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622]') FROM sys.[dm_exec_describe_first_result_set]('SELECT * FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622]',NULL,NULL)
WHERE collation_name <> ''
GO
--DROP TABLE IF EXISTS [tempdb].[dbo].[Profile]
EXEC [dbo].[sp_AdvancedProfile]
    @ObjectName = NULL
  , @IncludeObjectLikeCommaDelimited = NULL
  , @ExcludeObjectLikeCommaDelimited = NULL
  , @SQLToProfile = 'SELECT [Age_Owner_1], [Age_Owner_2], [Assessors_Parcel_Number], [CountyName], [Ethnic_Code_Owner_1], [Ethnic_Code_Owner_2], [FIPS_Code], [Gender_Owner_1], [Gender_Owner_2], [Quantarium_Address_Matched_Ind], [Quantarium_Owner_Name_1_Matched_Ind], [Quantarium_Owner_Name_2_Matched_Ind], [Quantarium_Owner_Occupied], [Quantarium_Res_/_NonRes], [Quantarium_Standardized_Land_Use_Code], [UseDesc] FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622]'
  , @ColumnLikeCommaDelimited = NULL
  , @DataTypeLikeCommaDelimited = NULL
  , @DistinctColumnLikeDelimited = NULL
  , @DistinctDataTypeLikeCommaDelimited = NULL
--  If the default value for @IgnoreProfileTypes is not changed and @CustomCondition1-@CustomCondition4 is NULL also a very quick population (NULLABILITY) profile will be done
  , @IgnoreProfileTypes = 'Distinct'
  , @CustomCondition1 = NULL
  , @CustomCondition2 = NULL
  , @CustomCondition3 = NULL
  , @CustomCondition4 = NULL
  , @ObjectType = 'U'
  , @Top = NULL
  , @TABLESAMPLE_Percent = NULL
  , @TABLESAMPLE_Rows = NULL
  , @Execute = 1


-- CREATE TABLE [tempdb].[dbo].[Profile]
-- COPY ME TO BROWSE RESULTS
-- DROP TABLE IF EXISTS [Profile].[DemoQIDXref]
SELECT
   [t].[ObjectFQN]
  , [t].[Column]
  , [t].[ColumnDef]
  , [t].[DefMaxLength]
  --, [t].[Rows]
  --, [t].[Profiled%]
  , [t].[AvgLength]
  , [t].[MaxLength]
  , [t].[IsNull%]
  , [t].[Blank%]
  , [t].[Num+Null+Blank%]
  , [t].[Int+Null+Blank%]
  , [t].[Date+Null+Blank%]
  , [t].[YNTF+Null+Blank%]

  , [t].[IsNull]


  , [t].[Blank]
  , [t].[DblSpc]
  , [t].[LSpc]
  , [t].[Tab/NL]
  , [t].[Zero]
  , [t].[YNTF]
  , [t].[IsNumeric]
  , [t].[IsInt]
  , [t].[IsDate]

  , [t].[Distinct%]

  , [t].[DblSpc%]
  , [t].[LSpc%]
  , [t].[Tab/NL%]
  , [t].[Zero%]
  , [t].[YNTF%]
  , [t].[IsNumeric%]
  , [t].[IsInt%]
  , [t].[IsDate%]


  , [t].[Num+Null+Blank]
  , [t].[Int+Null+Blank]
  , [t].[Date+Null+Blank]
  , [t].[YNTF+Null+Blank]

  , [t].[SQL]
  , [t].[DblSpc_SQL]
  , [t].[Blank_SQL]
  , [t].[LSpc_SQL]
  , [t].[Tab/NL_SQL]
  , [t].[IsNumeric_SQL]
  , [t].[IsInt_SQL]
  , [t].[IsDate_SQL]
  , [t].[YNTF_SQL]
  INTO [Profile].[DemoQIDXref]
FROM [tempdb].[dbo].[Profile] [t] WITH( NOLOCK )
WHERE  ([t].[Num+Null+Blank%] = 100 OR [t].[Int+Null+Blank%] = 100 OR [t].[Date+Null+Blank] = 100 OR [t].[YNTF+Null+Blank] = 100)
  AND columndef LIKE '%char%'



go
;WITH a AS (

SELECT CASE WHEN [t].[Date+Null+Blank%] = 100 THEN 'DATE' WHEN [t].[YNTF+Null+Blank%] = 100 THEN 'BIT' WHEN [t].[Date+Null+Blank%] = 100 THEN 'DATE'
WHEN [t].[Int+Null+Blank%] = 100 THEN 'BIGINT'
WHEN [t].[Num+Null+Blank%] = 100 THEN 'REAL'
END AS NewDataType
,*
FROM [Profile].[DemoQIDXref] t
)
UPDATE d SET [data type] = NewDataType
FROM definition.[Xref] d INNER JOIN a ON a.[Column] = d.FieldName
