SELECT
	[Field #], [Fieldname], [Max Length], [Data Type], [Field Description], [Field Notes], [Version], [Change Type]
INTO #temp
FROM (VALUES
(1, 'Location_ID', 50, 'varchar', 'Unique Location Identifier', '', '', ''),
(2, 'Household_ID_Owner_1', 14, 'bigint', 'Unique Household Identifier of Owner 1', 'null/empty = non-owner', '', ''),
(3, 'Individual_ID_Owner_1', 14, 'bigint', 'Unique Individual Identifier of Owner 1', 'null/empty = non-owner', '', ''),
(4, 'Gender_Owner_1', 1, 'varchar', 'Gender of Owner 1', 'M=Male, F=Female', '', ''),
(5, 'Age_Owner_1', 2, 'varchar', 'Age of Owner 1', '', '', ''),
(6, 'Ethnic_Code_Owner_1', 2, 'varchar', 'Ethnic Code of Owner 1', 'See Ethnic Code Tab', '', ''),
(7, 'Quantarium_Owner_Name_1_Matched_Ind', 4, 'varchar', 'Matched Indicator', 'Left 1 char - 1=Owner 1, 2=Owner 2', '', ''),
(8, 'Household_ID_Owner_2', 14, 'bigint', 'Unique Household Identifier of Owner 2', 'null/empty = non-owner', '', ''),
(9, 'Individual_ID_Owner_2', 14, 'bigint', 'Unique Individual Identifier of Owner 2', 'null/empty = non-owner', '', ''),
(10, 'Gender_Owner_2', 1, 'varchar', 'Gender of Owner 2', 'M=Male, F=Female', '', ''),
(11, 'Age_Owner_2', 2, 'varchar', 'Age of Owner 2', '', '', ''),
(12, 'Ethnic_Code_Owner_2', 2, 'varchar', 'Ethnic Code of Owner 2', 'See Ethnic Code Tab', '', ''),
(13, 'Quantarium_Owner_Name_2_Matched_Ind', 4, 'varchar', 'Matched Indicator', 'Left 1 char - 1=Owner 1, 2=Owner 2', '', ''),
(14, 'Quantarium_Internal_PID', 10, 'int', 'Quantarium unique Property Identifier', 'Field used to join to Quantarium Assessment Table', '', ''),
(15, 'FIPS_Code', 5, 'char', 'County FIPS code', 'See FIPS_List tab', '', ''),
(16, 'Assessors_Parcel_Number', 45, 'varchar', 'County assigned parcel number', '', '', ''),
(17, 'Quantarium_Standardized_Land_Use_Code', 4, 'varchar', 'Standardized Land Use Code', 'See LandUse tab', '', ''),
(18, 'Quantarium_Res_/_NonRes', 1, 'varchar', 'Resdential Land Use Indicator', 'R=Residential', '', ''),
(19, 'Quantarium_Owner_Occupied', 1, 'varchar', 'Owner Occupied indication from Assessment', 'Y=Owner Occupied', '', ''),
(20, 'Quantarium_Address_Matched_Ind', 1, 'varchar', 'Level of Address match from Assessment to Demographics', '1=Street/City/State/Zip, 2=Street with Unit/City/State/Zip, 3=Street/Zip', '', ''),
(21, 'Quantarium_Number_Of_Owners_On_Asmt', 1, 'int', 'Number of owners found on Assessment record', '', '', ''),
(22, 'Quantarium_Number_Of_Owners_On_Demo', 1, 'int', 'Number of demographic individuals matched to Assessment ownership', '', '', ''),
(23, 'Start_Date', 8, 'int', 'Most recent county document recording or processing date ', '', '', ''),
(24, 'End_Date', 8, 'int', 'If present - demographics data belongs to prior owner', '', '', ''),
(25, 'Process_Date', 8, 'int', 'Date the record was created/updated', '', '', ''))
vdata ([Field #], [Fieldname], [Max Length], [Data Type], [Field Description], [Field Notes], [Version], [Change Type])




SELECT * INTO DemoQIDXrefLayout FROM #temp

CREATE UNIQUE CLUSTERED INDEX [Field #] ON DemoQIDXrefLayout ([Field #] )
CREATE UNIQUE NONCLUSTERED INDEX [Fieldname] ON DemoQIDXrefLayout ([Fieldname])
