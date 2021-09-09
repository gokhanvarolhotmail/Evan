SELECT 
* 
INTO #cols
FROM util.dbo.parsedelimited('Location_ID	Household_ID_Owner_1	Individual_ID_Owner_1	Age_Owner_1	Ethnic_Code_Owner_1	Gender_Owner_1	Quantarium_Owner_Name_1_Matched_Ind	Quantarium_Demo_QId_1	Household_ID_Owner_2	Individual_ID_Owner_2	Age_Owner_2	Ethnic_Code_Owner_2	Gender_Owner_2	Quantarium_Owner_Name_2_Matched_Ind	Quantarium_Demo_QId_2	Quantarium_Internal_PID	FIPS_Code	CountyName	Assessors_Parcel_Number	Quantarium_Standardized_Land_Use_Code	UseDesc	Quantarium_Res_/_NonRes	Quantarium_Owner_Occupied	Quantarium_Address_Matched_Ind	Quantarium_Number_Of_Owners_On_Asmt	Quantarium_Number_Of_Owners_On_Demo	Start_Date	CrossRefQId	Processed Date','	')


SELECT CONCAT('CREATE TABLE [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622](
	',STRING_AGG(CONCAT(CAST(QUOTENAME(Field) AS VARCHAR(MAX)), ' VARCHAR(8000)'),',
	') WITHIN GROUP(ORDER BY fieldNum),'
)')
FROM #cols
GO

-- bcp "[Evan].[dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622]" in "D:\Temp\Evan\HouseAMP\Quantarium_Houseamp_WA_Select_DemoXref_20210622.txt" -F 2 -c -t \t -S DESKTOP-GU73BTH -a 65535 -T

SELECT CONCAT('SELECT
	',STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), 'CASE WHEN TRIM([',Field,']) IN ('''',''NULL'') THEN NULL ELSE TRIM([',Field,']) END AS [',Field,']'),',
	') WITHIN GROUP(ORDER BY fieldNum),'
INTO [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622_New]
FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622]
') AS SQL
FROM #cols
GO



DROP TABLE IF EXISTS [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622]
CREATE TABLE [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622](
	[Location_ID] VARCHAR(8000),
	[Household_ID_Owner_1] VARCHAR(8000),
	[Individual_ID_Owner_1] VARCHAR(8000),
	[Age_Owner_1] VARCHAR(8000),
	[Ethnic_Code_Owner_1] VARCHAR(8000),
	[Gender_Owner_1] VARCHAR(8000),
	[Quantarium_Owner_Name_1_Matched_Ind] VARCHAR(8000),
	[Quantarium_Demo_QId_1] VARCHAR(8000),
	[Household_ID_Owner_2] VARCHAR(8000),
	[Individual_ID_Owner_2] VARCHAR(8000),
	[Age_Owner_2] VARCHAR(8000),
	[Ethnic_Code_Owner_2] VARCHAR(8000),
	[Gender_Owner_2] VARCHAR(8000),
	[Quantarium_Owner_Name_2_Matched_Ind] VARCHAR(8000),
	[Quantarium_Demo_QId_2] VARCHAR(8000),
	[Quantarium_Internal_PID] VARCHAR(8000),
	[FIPS_Code] VARCHAR(8000),
	[CountyName] VARCHAR(8000),
	[Assessors_Parcel_Number] VARCHAR(8000),
	[Quantarium_Standardized_Land_Use_Code] VARCHAR(8000),
	[UseDesc] VARCHAR(8000),
	[Quantarium_Res_/_NonRes] VARCHAR(8000),
	[Quantarium_Owner_Occupied] VARCHAR(8000),
	[Quantarium_Address_Matched_Ind] VARCHAR(8000),
	[Quantarium_Number_Of_Owners_On_Asmt] VARCHAR(8000),
	[Quantarium_Number_Of_Owners_On_Demo] VARCHAR(8000),
	[Start_Date] VARCHAR(8000),
	[CrossRefQId] VARCHAR(8000),
	[Processed Date] VARCHAR(8000)
)




SELECT
	CASE WHEN TRIM([Location_ID]) IN ('','NULL') THEN NULL ELSE TRIM([Location_ID]) END AS [Location_ID],
	CASE WHEN TRIM([Household_ID_Owner_1]) IN ('','NULL') THEN NULL ELSE TRIM([Household_ID_Owner_1]) END AS [Household_ID_Owner_1],
	CASE WHEN TRIM([Individual_ID_Owner_1]) IN ('','NULL') THEN NULL ELSE TRIM([Individual_ID_Owner_1]) END AS [Individual_ID_Owner_1],
	CASE WHEN TRIM([Age_Owner_1]) IN ('','NULL') THEN NULL ELSE TRIM([Age_Owner_1]) END AS [Age_Owner_1],
	CASE WHEN TRIM([Ethnic_Code_Owner_1]) IN ('','NULL') THEN NULL ELSE TRIM([Ethnic_Code_Owner_1]) END AS [Ethnic_Code_Owner_1],
	CASE WHEN TRIM([Gender_Owner_1]) IN ('','NULL') THEN NULL ELSE TRIM([Gender_Owner_1]) END AS [Gender_Owner_1],
	CASE WHEN TRIM([Quantarium_Owner_Name_1_Matched_Ind]) IN ('','NULL') THEN NULL ELSE TRIM([Quantarium_Owner_Name_1_Matched_Ind]) END AS [Quantarium_Owner_Name_1_Matched_Ind],
	CASE WHEN TRIM([Quantarium_Demo_QId_1]) IN ('','NULL') THEN NULL ELSE TRIM([Quantarium_Demo_QId_1]) END AS [Quantarium_Demo_QId_1],
	CASE WHEN TRIM([Household_ID_Owner_2]) IN ('','NULL') THEN NULL ELSE TRIM([Household_ID_Owner_2]) END AS [Household_ID_Owner_2],
	CASE WHEN TRIM([Individual_ID_Owner_2]) IN ('','NULL') THEN NULL ELSE TRIM([Individual_ID_Owner_2]) END AS [Individual_ID_Owner_2],
	CASE WHEN TRIM([Age_Owner_2]) IN ('','NULL') THEN NULL ELSE TRIM([Age_Owner_2]) END AS [Age_Owner_2],
	CASE WHEN TRIM([Ethnic_Code_Owner_2]) IN ('','NULL') THEN NULL ELSE TRIM([Ethnic_Code_Owner_2]) END AS [Ethnic_Code_Owner_2],
	CASE WHEN TRIM([Gender_Owner_2]) IN ('','NULL') THEN NULL ELSE TRIM([Gender_Owner_2]) END AS [Gender_Owner_2],
	CASE WHEN TRIM([Quantarium_Owner_Name_2_Matched_Ind]) IN ('','NULL') THEN NULL ELSE TRIM([Quantarium_Owner_Name_2_Matched_Ind]) END AS [Quantarium_Owner_Name_2_Matched_Ind],
	CASE WHEN TRIM([Quantarium_Demo_QId_2]) IN ('','NULL') THEN NULL ELSE TRIM([Quantarium_Demo_QId_2]) END AS [Quantarium_Demo_QId_2],
	CASE WHEN TRIM([Quantarium_Internal_PID]) IN ('','NULL') THEN NULL ELSE TRIM([Quantarium_Internal_PID]) END AS [Quantarium_Internal_PID],
	CASE WHEN TRIM([FIPS_Code]) IN ('','NULL') THEN NULL ELSE TRIM([FIPS_Code]) END AS [FIPS_Code],
	CASE WHEN TRIM([CountyName]) IN ('','NULL') THEN NULL ELSE TRIM([CountyName]) END AS [CountyName],
	CASE WHEN TRIM([Assessors_Parcel_Number]) IN ('','NULL') THEN NULL ELSE TRIM([Assessors_Parcel_Number]) END AS [Assessors_Parcel_Number],
	CASE WHEN TRIM([Quantarium_Standardized_Land_Use_Code]) IN ('','NULL') THEN NULL ELSE TRIM([Quantarium_Standardized_Land_Use_Code]) END AS [Quantarium_Standardized_Land_Use_Code],
	CASE WHEN TRIM([UseDesc]) IN ('','NULL') THEN NULL ELSE TRIM([UseDesc]) END AS [UseDesc],
	CASE WHEN TRIM([Quantarium_Res_/_NonRes]) IN ('','NULL') THEN NULL ELSE TRIM([Quantarium_Res_/_NonRes]) END AS [Quantarium_Res_/_NonRes],
	CASE WHEN TRIM([Quantarium_Owner_Occupied]) IN ('','NULL') THEN NULL ELSE TRIM([Quantarium_Owner_Occupied]) END AS [Quantarium_Owner_Occupied],
	CASE WHEN TRIM([Quantarium_Address_Matched_Ind]) IN ('','NULL') THEN NULL ELSE TRIM([Quantarium_Address_Matched_Ind]) END AS [Quantarium_Address_Matched_Ind],
	CASE WHEN TRIM([Quantarium_Number_Of_Owners_On_Asmt]) IN ('','NULL') THEN NULL ELSE TRIM([Quantarium_Number_Of_Owners_On_Asmt]) END AS [Quantarium_Number_Of_Owners_On_Asmt],
	CASE WHEN TRIM([Quantarium_Number_Of_Owners_On_Demo]) IN ('','NULL') THEN NULL ELSE TRIM([Quantarium_Number_Of_Owners_On_Demo]) END AS [Quantarium_Number_Of_Owners_On_Demo],
	CASE WHEN TRIM([Start_Date]) IN ('','NULL') THEN NULL ELSE TRIM([Start_Date]) END AS [Start_Date],
	CASE WHEN TRIM([CrossRefQId]) IN ('','NULL') THEN NULL ELSE TRIM([CrossRefQId]) END AS [CrossRefQId],
	CASE WHEN TRIM([Processed Date]) IN ('','NULL') THEN NULL ELSE TRIM([Processed Date]) END AS [Processed Date]
INTO [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622_New]
FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622]


GO
RETURN
SET XACT_ABORT ON 
BEGIN transaction
DROP TABLE [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622]
EXEC sp_rename '[dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622_New]','Quantarium_Houseamp_WA_Select_DemoXref_20210622','object'
COMMIT

ALTER TABLE [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622] REBUILD WITH (DATA_COMPRESSION = ROW)