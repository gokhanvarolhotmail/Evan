USE Evan
GO
--CREATE SCHEMA [Profile]
RETURN

--DROP TABLE [tempdb].[dbo].[Profile]
SELECT CONCAT('SELECT ',STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), QUOTENAME(REPLACE(name,'''',''''''))),', ') WITHIN GROUP(ORDER BY NAME), ' FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien_20210622]') FROM sys.[dm_exec_describe_first_result_set]('SELECT * FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien_20210622]',NULL,NULL)
WHERE collation_name <> ''
GO
--DROP TABLE IF EXISTS [tempdb].[dbo].[Profile]
EXEC [dbo].[sp_AdvancedProfile]
    @ObjectName = NULL
  , @IncludeObjectLikeCommaDelimited = NULL
  , @ExcludeObjectLikeCommaDelimited = NULL
  , @SQLToProfile = 'SELECT [Air_Conditioning], [Air_Conditioning_Type], [Alt_Old_APN_Indicator], [Amenities], [Amenities_2], [Assessment_Year], [Assessors_Parcel_Number], [Basement], [Building_Area_1_Indicator], [Building_Area_2_Indicator], [Building_Area_3_Indicator], [Building_Area_4_Indicator], [Building_Area_5_Indicator], [Building_Area_6_Indicator], [Building_Area_7_Indicator], [Building_Class], [Building_Condition], [Building_Quality], [Buyer_ID_Code_1], [Buyer_Vesting_Code], [California_HomeOwners_Exemption], [CO_Mail_Care_of_Name], [CO_Mail_Street_Address], [CO_Mailing_City], [CO_Mailing_State], [CO_Mailing_Zip_Code], [CO_Mailing_Zip_Plus4Code], [CO_Unit_Number], [CO_Unit_Type], [Comments_Summary_of_Building_Cards], [Condo_Project_Bldg_Name], [Current_Est_Equity_Range_Code], [Current_Est_LTV_Range_Code], [Current_Owner_Name], [Document_Type_from_Assessment], [Duplicate_APN], [Edition], [Effective_Year_Built], [Elevator], [Exterior_Walls], [Extra_Features_1_Area], [Extra_Features_1_Indicator], [Extra_Features_2_Area], [Extra_Features_2_Indicator], [Extra_Features_3_Area], [Extra_Features_3_Indicator], [Extra_Features_4_Area], [Extra_Features_4_Indicator], [FIPS_Code], [Fireplace], [FLOOR_COVER], [Foreclosure_Case_Number], [Foundation], [Garage_Type], [Heating], [Heating_Fuel_Type], [Interior_Walls], [Legal_Assessors_Map_Ref], [Legal_Block], [Legal_Brief_Description], [Legal_Brief_Description_FULL], [Legal_City_Township_Municipality], [Legal_District], [Legal_Land_Lot], [Legal_Lot_Code], [Legal_Lot_Number], [Legal_Phase_Number], [Legal_Section], [Legal_Section_Township__Range_Meridian], [Legal_Subdivision_Name], [Legal_Tract_Number], [Legal_Unit], [Length_of_Residence_Code], [Location_Code], [Lot_Size_Area_Unit], [LotSize_Acres], [LotSize_Depth_Feet], [LotSize_Frontage_Feet], [LSale_Book_Number], [LSale_distressed_sale_flag], [LSale_Document_Number], [LSale_Document_Type_Code], [LSale_Page_Number], [LSale_Price], [LSale_Price_Code], [LSale_reo_flag], [LValid_Book_Number], [LValid_distressed_sale_flag], [LValid_Document_Number], [LValid_Document_Type_Code], [LValid_Page_Number], [LValid_Price], [LValid_Price_Code], [LValid_reo_flag], [Mail_Care_Of_Name_Indicator], [Main_Building_Area_Indicator], [Market_Value_Year], [Match_Code], [Mtg01_Adjustable_Rate_Index], [Mtg01_Adjustable_Rate_Rider], [Mtg01_Assigned_Lender_Name], [Mtg01_Cash_Purchase], [Mtg01_Construction_Loan], [Mtg01_Equity_Credit_Line], [Mtg01_fixed_step_conversion_rate_rider], [Mtg01_Interest_Only_Period], [Mtg01_Lender_Mail_City], [Mtg01_Lender_Mail_Full_Street_Address], [Mtg01_Lender_Mail_State], [Mtg01_Lender_Mail_Unit], [Mtg01_Lender_Mail_Zip_Code], [Mtg01_Lender_Mail_Zip_Plus4Code], [Mtg01_Lender_Name], [Mtg01_lender_name_beneficiary], [Mtg01_lender_type], [Mtg01_loan_number], [Mtg01_loan_type], [Mtg01_PreFcl_Case_Trustee_Sale_Nbr], [Mtg01_Prepayment_Rider], [Mtg01_Prepayment_Term_Penalty_Rider], [Mtg01_Purchase_Mtg_Ind], [Mtg01_Purpose_Of_Loan], [Mtg01_Rate_Change_Frequency], [Mtg01_StandAlone_Refi], [Mtg01_Title_Company_Name], [Mtg01_type_financing], [Mtg02_Adjustable_Rate_Index], [Mtg02_Adjustable_Rate_Rider], [Mtg02_Assigned_Lender_Name], [Mtg02_Cash_Purchase], [Mtg02_Construction_Loan], [Mtg02_Equity_Credit_Line], [Mtg02_fixed_step_conversion_rate_rider], [Mtg02_Interest_Only_Period], [Mtg02_Lender_Mail_City], [Mtg02_Lender_Mail_Full_Street_Address], [Mtg02_Lender_Mail_State], [Mtg02_Lender_Mail_Unit], [Mtg02_Lender_Mail_Zip_Code], [Mtg02_Lender_Mail_Zip_Plus4Code], [Mtg02_Lender_Name], [Mtg02_lender_name_beneficiary], [Mtg02_lender_type], [Mtg02_loan_number], [Mtg02_loan_type], [Mtg02_PreFcl_Case_Trustee_Sale_Nbr], [Mtg02_Prepayment_Rider], [Mtg02_Prepayment_Term_Penalty_Rider], [Mtg02_Purchase_Mtg_Ind], [Mtg02_Purpose_Of_Loan], [Mtg02_Rate_Change_Frequency], [Mtg02_StandAlone_Refi], [Mtg02_Title_Company_Name], [Mtg02_type_financing], [Mtg03_Adjustable_Rate_Index], [Mtg03_Adjustable_Rate_Rider], [Mtg03_Assigned_Lender_Name], [Mtg03_Cash_Purchase], [Mtg03_Construction_Loan], [Mtg03_Equity_Credit_Line], [Mtg03_fixed_step_conversion_rate_rider], [Mtg03_Interest_Only_Period], [Mtg03_Lender_Mail_City], [Mtg03_Lender_Mail_Full_Street_Address], [Mtg03_Lender_Mail_State], [Mtg03_Lender_Mail_Unit], [Mtg03_Lender_Mail_Zip_Code], [Mtg03_Lender_Mail_Zip_Plus4Code], [Mtg03_Lender_Name], [Mtg03_lender_name_beneficiary], [Mtg03_lender_type], [Mtg03_loan_number], [Mtg03_loan_type], [Mtg03_PreFcl_Case_Trustee_Sale_Nbr], [Mtg03_Prepayment_Rider], [Mtg03_Prepayment_Term_Penalty_Rider], [Mtg03_Purchase_Mtg_Ind], [Mtg03_Purpose_Of_Loan], [Mtg03_Rate_Change_Frequency], [Mtg03_StandAlone_Refi], [Mtg03_Title_Company_Name], [Mtg03_type_financing], [Mtg04_Adjustable_Rate_Index], [Mtg04_Adjustable_Rate_Rider], [Mtg04_Assigned_Lender_Name], [Mtg04_Cash_Purchase], [Mtg04_Construction_Loan], [Mtg04_Equity_Credit_Line], [Mtg04_fixed_step_conversion_rate_rider], [Mtg04_Interest_Only_Period], [Mtg04_Lender_Mail_City], [Mtg04_Lender_Mail_Full_Street_Address], [Mtg04_Lender_Mail_State], [Mtg04_Lender_Mail_Unit], [Mtg04_Lender_Mail_Zip_Code], [Mtg04_Lender_Mail_Zip_Plus4Code], [Mtg04_Lender_Name], [Mtg04_lender_name_beneficiary], [Mtg04_lender_type], [Mtg04_loan_number], [Mtg04_loan_type], [Mtg04_PreFcl_Case_Trustee_Sale_Nbr], [Mtg04_Prepayment_Rider], [Mtg04_Prepayment_Term_Penalty_Rider], [Mtg04_Purchase_Mtg_Ind], [Mtg04_Purpose_Of_Loan], [Mtg04_Rate_Change_Frequency], [Mtg04_StandAlone_Refi], [Mtg04_Title_Company_Name], [Mtg04_type_financing], [N_of_Plumbing_Fixtures], [Neighborhood_Code], [No_of_Stories], [Old_APN], [Original_Lot_Size_or_Area], [Other_Impr_Building_Area_1], [Other_Impr_Building_Area_2], [Other_Impr_Building_Area_3], [Other_Impr_Building_Area_4], [Other_Impr_Building_Area_5], [Other_Impr_Building_Indicator_1], [Other_Impr_Building_Indicator_2], [Other_Impr_Building_Indicator_3], [Other_Impr_Building_Indicator_4], [Other_Impr_Building_Indicator_5], [Other_Rooms], [Owner_Occupied], [Owner1FirstName], [Owner1LastName], [Owner1MiddleName], [Owner2Firstname], [Owner2LastName], [Owner2MiddleName], [PA_Carrier_Route], [PA_Census_Tract], [PA_Latitude], [PA_Longitude], [ParsedOwnerSourceCode], [Pool], [Property_City_Name], [Property_Full_Street_Address], [Property_House_Number], [Property_State], [Property_Street_Direction_Left], [Property_Street_Direction_Right], [Property_Street_Name], [Property_Street_Suffix], [Property_Unit_Number], [Property_Unit_Type], [Property_Zip_Code], [Property_Zip_Plus4Code], [PSale_Book_Number], [PSale_distressed_sale_flag], [PSale_Document_Number], [PSale_Document_Type_Code], [PSale_Page_Number], [PSale_Price], [PSale_Price_Code], [PSale_reo_flag], [PValid_Book_Number], [PValid_distressed_sale_flag], [PValid_Document_Number], [PValid_Document_Type_Code], [PValid_Page_Number], [PValid_Price], [PValid_Price_Code], [PValid_reo_flag], [Quantarium_Version], [QVM_Value_Range_Code], [Recorders_Book_Number_from_Assessment], [Recorders_Document_Number_from_Assessment], [Recorders_Page_Number_from_Assessment], [Roof_Cover], [Roof_Type], [Sales_Price_Code_from_Assessment], [School_Tax_District_1], [School_Tax_District_1_Indicator], [School_Tax_District_2], [School_Tax_District_2_Indicator], [School_Tax_District_3], [School_Tax_District_3_Indicator], [Sewer], [Site_Influence], [Standardized_Land_Use_Code], [Style], [Tax_Account_Number], [Tax_Delinquent_Year], [Tax_Exemption_Codes], [Tax_Rate_Code_Area], [Tax_Year], [Topography], [Total_Number_of_Rooms], [Type_Construction], [Water], [Year_Built], [Zoning] FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien_20210622]
  UNION all
  SELECT [Air_Conditioning], [Air_Conditioning_Type], [Alt_Old_APN_Indicator], [Amenities], [Amenities_2], [Assessment_Year], [Assessors_Parcel_Number], [Basement], [Building_Area_1_Indicator], [Building_Area_2_Indicator], [Building_Area_3_Indicator], [Building_Area_4_Indicator], [Building_Area_5_Indicator], [Building_Area_6_Indicator], [Building_Area_7_Indicator], [Building_Class], [Building_Condition], [Building_Quality], [Buyer_ID_Code_1], [Buyer_Vesting_Code], [California_HomeOwners_Exemption], [CO_Mail_Care_of_Name], [CO_Mail_Street_Address], [CO_Mailing_City], [CO_Mailing_State], [CO_Mailing_Zip_Code], [CO_Mailing_Zip_Plus4Code], [CO_Unit_Number], [CO_Unit_Type], [Comments_Summary_of_Building_Cards], [Condo_Project_Bldg_Name], [Current_Est_Equity_Range_Code], [Current_Est_LTV_Range_Code], [Current_Owner_Name], [Document_Type_from_Assessment], [Duplicate_APN], [Edition], [Effective_Year_Built], [Elevator], [Exterior_Walls], [Extra_Features_1_Area], [Extra_Features_1_Indicator], [Extra_Features_2_Area], [Extra_Features_2_Indicator], [Extra_Features_3_Area], [Extra_Features_3_Indicator], [Extra_Features_4_Area], [Extra_Features_4_Indicator], [FIPS_Code], [Fireplace], [FLOOR_COVER], [Foreclosure_Case_Number], [Foundation], [Garage_Type], [Heating], [Heating_Fuel_Type], [Interior_Walls], [Legal_Assessors_Map_Ref], [Legal_Block], [Legal_Brief_Description], [Legal_Brief_Description_FULL], [Legal_City_Township_Municipality], [Legal_District], [Legal_Land_Lot], [Legal_Lot_Code], [Legal_Lot_Number], [Legal_Phase_Number], [Legal_Section], [Legal_Section_Township__Range_Meridian], [Legal_Subdivision_Name], [Legal_Tract_Number], [Legal_Unit], [Length_of_Residence_Code], [Location_Code], [Lot_Size_Area_Unit], [LotSize_Acres], [LotSize_Depth_Feet], [LotSize_Frontage_Feet], [LSale_Book_Number], [LSale_distressed_sale_flag], [LSale_Document_Number], [LSale_Document_Type_Code], [LSale_Page_Number], [LSale_Price], [LSale_Price_Code], [LSale_reo_flag], [LValid_Book_Number], [LValid_distressed_sale_flag], [LValid_Document_Number], [LValid_Document_Type_Code], [LValid_Page_Number], [LValid_Price], [LValid_Price_Code], [LValid_reo_flag], [Mail_Care_Of_Name_Indicator], [Main_Building_Area_Indicator], [Market_Value_Year], [Match_Code], [Mtg01_Adjustable_Rate_Index], [Mtg01_Adjustable_Rate_Rider], [Mtg01_Assigned_Lender_Name], [Mtg01_Cash_Purchase], [Mtg01_Construction_Loan], [Mtg01_Equity_Credit_Line], [Mtg01_fixed_step_conversion_rate_rider], [Mtg01_Interest_Only_Period], [Mtg01_Lender_Mail_City], [Mtg01_Lender_Mail_Full_Street_Address], [Mtg01_Lender_Mail_State], [Mtg01_Lender_Mail_Unit], [Mtg01_Lender_Mail_Zip_Code], [Mtg01_Lender_Mail_Zip_Plus4Code], [Mtg01_Lender_Name], [Mtg01_lender_name_beneficiary], [Mtg01_lender_type], [Mtg01_loan_number], [Mtg01_loan_type], [Mtg01_PreFcl_Case_Trustee_Sale_Nbr], [Mtg01_Prepayment_Rider], [Mtg01_Prepayment_Term_Penalty_Rider], [Mtg01_Purchase_Mtg_Ind], [Mtg01_Purpose_Of_Loan], [Mtg01_Rate_Change_Frequency], [Mtg01_StandAlone_Refi], [Mtg01_Title_Company_Name], [Mtg01_type_financing], [Mtg02_Adjustable_Rate_Index], [Mtg02_Adjustable_Rate_Rider], [Mtg02_Assigned_Lender_Name], [Mtg02_Cash_Purchase], [Mtg02_Construction_Loan], [Mtg02_Equity_Credit_Line], [Mtg02_fixed_step_conversion_rate_rider], [Mtg02_Interest_Only_Period], [Mtg02_Lender_Mail_City], [Mtg02_Lender_Mail_Full_Street_Address], [Mtg02_Lender_Mail_State], [Mtg02_Lender_Mail_Unit], [Mtg02_Lender_Mail_Zip_Code], [Mtg02_Lender_Mail_Zip_Plus4Code], [Mtg02_Lender_Name], [Mtg02_lender_name_beneficiary], [Mtg02_lender_type], [Mtg02_loan_number], [Mtg02_loan_type], [Mtg02_PreFcl_Case_Trustee_Sale_Nbr], [Mtg02_Prepayment_Rider], [Mtg02_Prepayment_Term_Penalty_Rider], [Mtg02_Purchase_Mtg_Ind], [Mtg02_Purpose_Of_Loan], [Mtg02_Rate_Change_Frequency], [Mtg02_StandAlone_Refi], [Mtg02_Title_Company_Name], [Mtg02_type_financing], [Mtg03_Adjustable_Rate_Index], [Mtg03_Adjustable_Rate_Rider], [Mtg03_Assigned_Lender_Name], [Mtg03_Cash_Purchase], [Mtg03_Construction_Loan], [Mtg03_Equity_Credit_Line], [Mtg03_fixed_step_conversion_rate_rider], [Mtg03_Interest_Only_Period], [Mtg03_Lender_Mail_City], [Mtg03_Lender_Mail_Full_Street_Address], [Mtg03_Lender_Mail_State], [Mtg03_Lender_Mail_Unit], [Mtg03_Lender_Mail_Zip_Code], [Mtg03_Lender_Mail_Zip_Plus4Code], [Mtg03_Lender_Name], [Mtg03_lender_name_beneficiary], [Mtg03_lender_type], [Mtg03_loan_number], [Mtg03_loan_type], [Mtg03_PreFcl_Case_Trustee_Sale_Nbr], [Mtg03_Prepayment_Rider], [Mtg03_Prepayment_Term_Penalty_Rider], [Mtg03_Purchase_Mtg_Ind], [Mtg03_Purpose_Of_Loan], [Mtg03_Rate_Change_Frequency], [Mtg03_StandAlone_Refi], [Mtg03_Title_Company_Name], [Mtg03_type_financing], [Mtg04_Adjustable_Rate_Index], [Mtg04_Adjustable_Rate_Rider], [Mtg04_Assigned_Lender_Name], [Mtg04_Cash_Purchase], [Mtg04_Construction_Loan], [Mtg04_Equity_Credit_Line], [Mtg04_fixed_step_conversion_rate_rider], [Mtg04_Interest_Only_Period], [Mtg04_Lender_Mail_City], [Mtg04_Lender_Mail_Full_Street_Address], [Mtg04_Lender_Mail_State], [Mtg04_Lender_Mail_Unit], [Mtg04_Lender_Mail_Zip_Code], [Mtg04_Lender_Mail_Zip_Plus4Code], [Mtg04_Lender_Name], [Mtg04_lender_name_beneficiary], [Mtg04_lender_type], [Mtg04_loan_number], [Mtg04_loan_type], [Mtg04_PreFcl_Case_Trustee_Sale_Nbr], [Mtg04_Prepayment_Rider], [Mtg04_Prepayment_Term_Penalty_Rider], [Mtg04_Purchase_Mtg_Ind], [Mtg04_Purpose_Of_Loan], [Mtg04_Rate_Change_Frequency], [Mtg04_StandAlone_Refi], [Mtg04_Title_Company_Name], [Mtg04_type_financing], [N_of_Plumbing_Fixtures], [Neighborhood_Code], [No_of_Stories], [Old_APN], [Original_Lot_Size_or_Area], [Other_Impr_Building_Area_1], [Other_Impr_Building_Area_2], [Other_Impr_Building_Area_3], [Other_Impr_Building_Area_4], [Other_Impr_Building_Area_5], [Other_Impr_Building_Indicator_1], [Other_Impr_Building_Indicator_2], [Other_Impr_Building_Indicator_3], [Other_Impr_Building_Indicator_4], [Other_Impr_Building_Indicator_5], [Other_Rooms], [Owner_Occupied], [Owner1FirstName], [Owner1LastName], [Owner1MiddleName], [Owner2Firstname], [Owner2LastName], [Owner2MiddleName], [PA_Carrier_Route], [PA_Census_Tract], [PA_Latitude], [PA_Longitude], [ParsedOwnerSourceCode], [Pool], [Property_City_Name], [Property_Full_Street_Address], [Property_House_Number], [Property_State], [Property_Street_Direction_Left], [Property_Street_Direction_Right], [Property_Street_Name], [Property_Street_Suffix], [Property_Unit_Number], [Property_Unit_Type], [Property_Zip_Code], [Property_Zip_Plus4Code], [PSale_Book_Number], [PSale_distressed_sale_flag], [PSale_Document_Number], [PSale_Document_Type_Code], [PSale_Page_Number], [PSale_Price], [PSale_Price_Code], [PSale_reo_flag], [PValid_Book_Number], [PValid_distressed_sale_flag], [PValid_Document_Number], [PValid_Document_Type_Code], [PValid_Page_Number], [PValid_Price], [PValid_Price_Code], [PValid_reo_flag], [Quantarium_Version], [QVM_Value_Range_Code], [Recorders_Book_Number_from_Assessment], [Recorders_Document_Number_from_Assessment], [Recorders_Page_Number_from_Assessment], [Roof_Cover], [Roof_Type], [Sales_Price_Code_from_Assessment], [School_Tax_District_1], [School_Tax_District_1_Indicator], [School_Tax_District_2], [School_Tax_District_2_Indicator], [School_Tax_District_3], [School_Tax_District_3_Indicator], [Sewer], [Site_Influence], [Standardized_Land_Use_Code], [Style], [Tax_Account_Number], [Tax_Delinquent_Year], [Tax_Exemption_Codes], [Tax_Rate_Code_Area], [Tax_Year], [Topography], [Total_Number_of_Rooms], [Type_Construction], [Water], [Year_Built], [Zoning] FROM [dbo].[Houseamp_WA_OL_Chg_20210913]'
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
-- DROP TABLE IF EXISTS [Profile].[OpenLien]
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
  INTO [Profile].[OpenLien]
FROM [tempdb].[dbo].[Profile] [t] WITH( NOLOCK )
WHERE  ([t].[Num+Null+Blank%] = 100 OR [t].[Int+Null+Blank%] = 100 OR [t].[Date+Null+Blank] = 100 OR [t].[YNTF+Null+Blank] = 100)
  AND columndef LIKE '%char%'



SELECT *FROM [Profile].[OpenLien] WHERE [column] = 'Mtg03_Construction_Loan'


go
;WITH a AS (
SELECT CASE WHEN [t].[Date+Null+Blank%] = 100 THEN 'DATE' WHEN [t].[YNTF+Null+Blank%] = 100 THEN 'BIT' WHEN [t].[Date+Null+Blank%] = 100 THEN 'DATE'
WHEN [t].[Int+Null+Blank%] = 100 THEN 'BIGINT'
WHEN [t].[Num+Null+Blank%] = 100 THEN 'REAL'
END AS NewDataType,*
FROM [Profile].[OpenLien] t
)
UPDATE d SET d.[Data_Type] = NewDataType
FROM definition.[OpenLien] d INNER JOIN a ON a.[Column] = d.[Field_Display_Name]
