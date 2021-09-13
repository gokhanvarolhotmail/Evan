USE [Evan] ;
GO
DROP TABLE IF EXISTS [dbo].[Quantarium_Houseamp_WA_Select_DemoXref]
SELECT 
CAST([Location_ID] AS BIGINT) AS [Location_ID],
CAST([Household_ID_Owner_1] AS BIGINT) AS [Household_ID_Owner_1],
CAST([Individual_ID_Owner_1] AS BIGINT) AS [Individual_ID_Owner_1],
CAST([Age_Owner_1] AS VARCHAR(2)) AS [Age_Owner_1],
CAST([Ethnic_Code_Owner_1] AS VARCHAR(2)) AS [Ethnic_Code_Owner_1],
CAST([Gender_Owner_1] AS VARCHAR(1)) AS [Gender_Owner_1],
CAST([Quantarium_Owner_Name_1_Matched_Ind] AS VARCHAR(4)) AS [Quantarium_Owner_Name_1_Matched_Ind],
[Quantarium_Demo_QId_1],
CAST([Household_ID_Owner_2] AS BIGINT) AS [Household_ID_Owner_2],
CAST([Individual_ID_Owner_2] AS BIGINT) AS [Individual_ID_Owner_2],
CAST([Age_Owner_2] AS VARCHAR(2)) AS [Age_Owner_2],
CAST([Ethnic_Code_Owner_2] AS VARCHAR(2)) AS [Ethnic_Code_Owner_2],
CAST([Gender_Owner_2] AS VARCHAR(1)) AS [Gender_Owner_2],
CAST([Quantarium_Owner_Name_2_Matched_Ind] AS VARCHAR(4)) AS [Quantarium_Owner_Name_2_Matched_Ind],
[Quantarium_Demo_QId_2],
CAST([Quantarium_Internal_PID] AS INT) AS [Quantarium_Internal_PID],
CAST([FIPS_Code] AS VARCHAR(5)) AS [FIPS_Code],
TRIM('"' FROM [CountyName]) AS [CountyName],
CAST([Assessors_Parcel_Number] AS VARCHAR(45)) AS [Assessors_Parcel_Number],
CAST([Quantarium_Standardized_Land_Use_Code] AS VARCHAR(4)) AS [Quantarium_Standardized_Land_Use_Code],
[UseDesc],
CAST([Quantarium_Res_/_NonRes] AS VARCHAR(1)) AS [Quantarium_Res_/_NonRes],
CAST([Quantarium_Owner_Occupied] AS VARCHAR(1)) AS [Quantarium_Owner_Occupied],
CAST([Quantarium_Address_Matched_Ind] AS VARCHAR(1)) AS [Quantarium_Address_Matched_Ind],
CAST([Quantarium_Number_Of_Owners_On_Asmt] AS INT) AS [Quantarium_Number_Of_Owners_On_Asmt],
CAST([Quantarium_Number_Of_Owners_On_Demo] AS INT) AS [Quantarium_Number_Of_Owners_On_Demo],
--CAST([Start_Date] AS INT) AS [Start_Date],
[CrossRefQId]
--CAST([Processed Date] AS INT) AS [Process_Date]
-- [End_Date],
INTO [dbo].[Quantarium_Houseamp_WA_Select_DemoXref]
FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622] ;
GO
SELECT TOP 100 * FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoXref]