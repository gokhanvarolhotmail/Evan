USE Evan
GO
--CREATE SCHEMA [Profile]
RETURN
--DROP TABLE [tempdb].[dbo].[Profile] 
SELECT CONCAT('SELECT ',STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), QUOTENAME(REPLACE(name,'''',''''''))),', ') WITHIN GROUP(ORDER BY NAME), ' FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien]') FROM sys.[dm_exec_describe_first_result_set]('SELECT * FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien]',NULL,NULL)
WHERE collation_name <> ''
go
EXEC [dbo].[sp_AdvancedProfile]
    @ObjectName = NULL
  , @IncludeObjectLikeCommaDelimited = NULL
  , @ExcludeObjectLikeCommaDelimited = NULL
  , @SQLToProfile = 'SELECT [Air_Conditioning], [Air_Conditioning_Type], [Alt/Old_APN_Indicator], [Amenities], [Amenities_2], [Assessment_Year], [Assessor’s_Parcel_Number_(APN,_PIN)], [Basement], [Building_Area_1_Indicator], [Building_Area_2_Indicator], [Building_Area_3_Indicator], [Building_Area_4_Indicator], [Building_Area_5_Indicator], [Building_Area_6_Indicator], [Building_Area_7_Indicator], [Building_Class], [Building_Condition], [Building_Quality], [Buyer-id-code1], [Buyer-vesting-code1], [California_Homeowner''s_Exemption], [Comments:__Summary_of_Building_Cards_("DR"_Records)], [Condo_Project_/__Bldg_Name], [Current_Est_Equity_Range_Code], [Current_Est_LTV_Range_Code], [Current_Foreclosure_Case_Number], [Current_Owner:_Mail_Care_of_Name], [Current_Owner:_Mail_Street_Address], [Current_Owner:_Mailing_City], [Current_Owner:_Mailing_State], [Current_Owner:_Mailing_Zip_+4_Code], [Current_Owner:_Mailing_Zip_Code], [Current_Owner:_Unit_Number], [Current_Owner:_Unit_Type], [Current_Owner_Name], [Document_Type_from_Assessment_(County_description)], [Duplicate_APN], [Edition], [Effective_Year_Built], [Elevator], [Exterior_Walls], [Extra_Features_1_Area], [Extra_Features_1_Indicator], [Extra_Features_2_Area], [Extra_Features_2_Indicator], [Extra_Features_3_Area], [Extra_Features_3_Indicator], [Extra_Features_4_Area], [Extra_Features_4_Indicator], [FIPS_Code_(State/County)], [Fireplace], [FLOOR_COVER], [Foundation], [Garage_Type_(Parking)], [Heating], [Heating_Fuel_Type], [Interior_Walls], [Last_Sale_-__Book_Number], [Last_Sale_-__DistressedSaleFlag], [Last_Sale_-__Document_Number], [Last_Sale_-__Document_Type_Code], [Last_Sale_-__Page_Number], [Last_Sale_-__Price], [Last_Sale_-__Price_Code], [Last_Sale_-__REO-Flag], [Last_Transfer_-__Book_Number], [Last_Transfer_-__DistressedSaleFlag], [Last_Transfer_-__Document_Number], [Last_Transfer_-__Document_Type_Code], [Last_Transfer_-__Page_Number], [Last_Transfer_-__Price], [Last_Transfer_-__Price_Code], [Last_Transfer_-__REO-Flag], [Legal:_Assessor''s_Map_Ref], [Legal:_Block], [Legal:_Brief_Description], [Legal:_Brief_Description_-_FULL], [Legal:_City,_Township,_Municipality], [Legal:_District], [Legal:_Land_Lot], [Legal:_Lot_Code], [Legal:_Lot_Number], [Legal:_Phase_Number], [Legal:_Section], [Legal:_Section/Township/_Range/Meridian], [Legal:_Subdivision_Name], [Legal:_Tract_Number], [Legal:_Unit], [Length_of_Residence_Code], [Lot_Size/Area_Unit], [Lot_Size_-_Acres], [Lot_Size_-_Depth_Feet], [Lot_Size_-_Frontage_Feet], [Mail_Care-Of_Name_Indicator], [Main_Building_Area_Indicator], [Market_Value:_Year], [Mtg01_Adjustable_Rate_Index], [Mtg01_Adjustable_Rate_Rider], [Mtg01_Assigned_Lender_Name], [Mtg01_Cash_Purchase], [Mtg01_Construction_Loan], [Mtg01_Equity_Credit_Line], [Mtg01_Fixed/Step_(Conversion)_Rate_Rider], [Mtg01_Interest_Only_Period], [Mtg01_Lender_DBA_Name], [Mtg01_Lender_Mail:_City], [Mtg01_Lender_Mail:_Full_Street_Address], [Mtg01_Lender_Mail:_State], [Mtg01_Lender_Mail:_Unit], [Mtg01_Lender_Mail:_Zip_+4_Code], [Mtg01_Lender_Mail:_Zip_Code], [Mtg01_Lender_Name_(Beneficiary)], [Mtg01_Lender_Type], [Mtg01_Loan_Number], [Mtg01_Loan_Type], [Mtg01_PreFcl_Case_Trustee_Sale_Nbr], [Mtg01_Prepayment_Rider], [Mtg01_Prepayment_Term_(Penalty_Rider)], [Mtg01_Purchase_Mtg_Ind], [Mtg01_Purpose_of_Loan], [Mtg01_Rate_Change_Frequency], [Mtg01_Stand-Alone_Refi], [Mtg01_Title_Company_Name], [Mtg01_Type_Financing], [Mtg02_Adjustable_Rate_Index], [Mtg02_Adjustable_Rate_Rider], [Mtg02_Assigned_Lender_Name], [Mtg02_Cash_Purchase], [Mtg02_Construction_Loan], [Mtg02_Equity_Credit_Line], [Mtg02_Fixed/Step_(Conversion)_Rate_Rider], [Mtg02_Interest_Only_Period], [Mtg02_Lender_DBA_Name], [Mtg02_Lender_Mail:_City], [Mtg02_Lender_Mail:_Full_Street_Address], [Mtg02_Lender_Mail:_State], [Mtg02_Lender_Mail:_Unit], [Mtg02_Lender_Mail:_Zip_+4_Code], [Mtg02_Lender_Mail:_Zip_Code], [Mtg02_Lender_Name_(Beneficiary)], [Mtg02_Lender_Type], [Mtg02_Loan_Number], [Mtg02_Loan_Type], [Mtg02_PreFcl_Case_Trustee_Sale_Nbr], [Mtg02_Prepayment_Rider], [Mtg02_Prepayment_Term_(Penalty_Rider)], [Mtg02_Purchase_Mtg_Ind], [Mtg02_Purpose_of_Loan], [Mtg02_Rate_Change_Frequency], [Mtg02_Stand-Alone_Refi], [Mtg02_Title_Company_Name], [Mtg02_Type_Financing], [Mtg03_Adjustable_Rate_Index], [Mtg03_Adjustable_Rate_Rider], [Mtg03_Assigned_Lender_Name], [Mtg03_Cash_Purchase], [Mtg03_Construction_Loan], [Mtg03_Equity_Credit_Line], [Mtg03_Fixed/Step_(Conversion)_Rate_Rider], [Mtg03_Interest_Only_Period], [Mtg03_Lender_DBA_Name], [Mtg03_Lender_Mail:_City], [Mtg03_Lender_Mail:_Full_Street_Address], [Mtg03_Lender_Mail:_State], [Mtg03_Lender_Mail:_Unit], [Mtg03_Lender_Mail:_Zip_+4_Code], [Mtg03_Lender_Mail:_Zip_Code], [Mtg03_Lender_Name_(Beneficiary)], [Mtg03_Lender_Type], [Mtg03_Loan_Number], [Mtg03_Loan_Type], [Mtg03_PreFcl_Case_Trustee_Sale_Nbr], [Mtg03_Prepayment_Rider], [Mtg03_Prepayment_Term_(Penalty_Rider)], [Mtg03_Purchase_Mtg_Ind], [Mtg03_Purpose_of_Loan], [Mtg03_Rate_Change_Frequency], [Mtg03_Stand-Alone_Refi], [Mtg03_Title_Company_Name], [Mtg03_Type_Financing], [Mtg04_Adjustable_Rate_Index], [Mtg04_Adjustable_Rate_Rider], [Mtg04_Assigned_Lender_Name], [Mtg04_Cash_Purchase], [Mtg04_Construction_Loan], [Mtg04_Equity_Credit_Line], [Mtg04_Fixed/Step_(Conversion)_Rate_Rider], [Mtg04_Interest_Only_Period], [Mtg04_Lender_DBA_Name], [Mtg04_Lender_Mail:_City], [Mtg04_Lender_Mail:_Full_Street_Address], [Mtg04_Lender_Mail:_State], [Mtg04_Lender_Mail:_Unit], [Mtg04_Lender_Mail:_Zip_+4_Code], [Mtg04_Lender_Mail:_Zip_Code], [Mtg04_Lender_Name_(Beneficiary)], [Mtg04_Lender_Type], [Mtg04_Loan_Number], [Mtg04_Loan_Type], [Mtg04_PreFcl_Case_Trustee_Sale_Nbr], [Mtg04_Prepayment_Rider], [Mtg04_Prepayment_Term_(Penalty_Rider)], [Mtg04_Purchase_Mtg_Ind], [Mtg04_Purpose_of_Loan], [Mtg04_Rate_Change_Frequency], [Mtg04_Stand-Alone_Refi], [Mtg04_Title_Company_Name], [Mtg04_Type_Financing], [Neighborhood_Code], [No._of_Stories], [Old_APN], [Original_Lot_Size_or_Area], [Other_Impr_Building_Area_1], [Other_Impr_Building_Area_2], [Other_Impr_Building_Area_3], [Other_Impr_Building_Area_4], [Other_Impr_Building_Area_5], [Other_Impr_Building_Indicator_1], [Other_Impr_Building_Indicator_2], [Other_Impr_Building_Indicator_3], [Other_Impr_Building_Indicator_4], [Other_Impr_Building_Indicator_5], [Other_Rooms], [Owner1FirstName], [Owner1LastName], [Owner1MiddleName], [Owner2Firstname], [Owner2LastName], [Owner2MiddleName], [Owner-Occupied_(Residential)], [ParsedOwnerSourceCode], [Plumbing_Fixtures_Count], [Pool], [Prior_Sale_-__Book_Number], [Prior_Sale_-__DistressedSaleFlag], [Prior_Sale_-__Document_Number], [Prior_Sale_-__Document_Type_Code], [Prior_Sale_-__Page_Number], [Prior_Sale_-__Price], [Prior_Sale_-__Price_Code], [Prior_Sale_-__REO-Flag], [Prior_Transfer_-__Book_Number], [Prior_Transfer_-__DistressedSaleFlag], [Prior_Transfer_-__Document_Number], [Prior_Transfer_-__Document_Type_Code], [Prior_Transfer_-__Page_Number], [Prior_Transfer_-__Price], [Prior_Transfer_-__Price_Code], [Prior_Transfer_-__REO-Flag], [Property_Address:_Carrier_Route], [Property_Address:_Census_Tract], [Property_Address:_Latitude], [Property_Address:_Longitude], [Property_Address:GeoStan_Location_Code], [Property_Address:GeoStan_Match_Code], [Property_City_Name], [Property_Full_Street_Address], [Property_House_Number], [Property_State], [Property_Street_Direction_Left], [Property_Street_Direction_Right], [Property_Street_Name], [Property_Street_Suffix], [Property_Unit_Number], [Property_Unit_Type], [Property_Zip_+4_Code], [Property_Zip_Code], [Quantarium_Version], [QVM_Value_Range_Code], [Recorder''s_Book_Number_from_Assessment], [Recorder''s_Document_Number_from_Assessment], [Recorder''s_Page_Number_from_Assessment], [Roof_Cover], [Roof_Type], [Sales_Price_Code_from_Assessment], [School/Tax_District_1], [School/Tax_District_1_Indicator], [School/Tax_District_2], [School/Tax_District_2_Indicator], [School/Tax_District_3], [School/Tax_District_3_Indicator], [Sewer], [Site_Influence], [Standardized_Land_Use_Code], [Style], [Tax_Account_Number], [Tax_Delinquent_Year], [Tax_Exemption_Codes], [Tax_Rate_Code_Area], [Tax_Year], [Topography], [Total_Number_of_Rooms], [Type_Construction], [Water], [Year_Built], [Zoning] FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien]
  UNION all
  SELECT [Air_Conditioning], [Air_Conditioning_Type], [Alt/Old_APN_Indicator], [Amenities], [Amenities_2], [Assessment_Year], [Assessor’s_Parcel_Number_(APN,_PIN)], [Basement], [Building_Area_1_Indicator], [Building_Area_2_Indicator], [Building_Area_3_Indicator], [Building_Area_4_Indicator], [Building_Area_5_Indicator], [Building_Area_6_Indicator], [Building_Area_7_Indicator], [Building_Class], [Building_Condition], [Building_Quality], [Buyer-id-code1], [Buyer-vesting-code1], [California_Homeowner''s_Exemption], [Comments:__Summary_of_Building_Cards_("DR"_Records)], [Condo_Project_/__Bldg_Name], [Current_Est_Equity_Range_Code], [Current_Est_LTV_Range_Code], [Current_Foreclosure_Case_Number], [Current_Owner:_Mail_Care_of_Name], [Current_Owner:_Mail_Street_Address], [Current_Owner:_Mailing_City], [Current_Owner:_Mailing_State], [Current_Owner:_Mailing_Zip_+4_Code], [Current_Owner:_Mailing_Zip_Code], [Current_Owner:_Unit_Number], [Current_Owner:_Unit_Type], [Current_Owner_Name], [Document_Type_from_Assessment_(County_description)], [Duplicate_APN], [Edition], [Effective_Year_Built], [Elevator], [Exterior_Walls], [Extra_Features_1_Area], [Extra_Features_1_Indicator], [Extra_Features_2_Area], [Extra_Features_2_Indicator], [Extra_Features_3_Area], [Extra_Features_3_Indicator], [Extra_Features_4_Area], [Extra_Features_4_Indicator], [FIPS_Code_(State/County)], [Fireplace], [FLOOR_COVER], [Foundation], [Garage_Type_(Parking)], [Heating], [Heating_Fuel_Type], [Interior_Walls], [Last_Sale_-__Book_Number], [Last_Sale_-__DistressedSaleFlag], [Last_Sale_-__Document_Number], [Last_Sale_-__Document_Type_Code], [Last_Sale_-__Page_Number], [Last_Sale_-__Price], [Last_Sale_-__Price_Code], [Last_Sale_-__REO-Flag], [Last_Transfer_-__Book_Number], [Last_Transfer_-__DistressedSaleFlag], [Last_Transfer_-__Document_Number], [Last_Transfer_-__Document_Type_Code], [Last_Transfer_-__Page_Number], [Last_Transfer_-__Price], [Last_Transfer_-__Price_Code], [Last_Transfer_-__REO-Flag], [Legal:_Assessor''s_Map_Ref], [Legal:_Block], [Legal:_Brief_Description], [Legal:_Brief_Description_-_FULL], [Legal:_City,_Township,_Municipality], [Legal:_District], [Legal:_Land_Lot], [Legal:_Lot_Code], [Legal:_Lot_Number], [Legal:_Phase_Number], [Legal:_Section], [Legal:_Section/Township/_Range/Meridian], [Legal:_Subdivision_Name], [Legal:_Tract_Number], [Legal:_Unit], [Length_of_Residence_Code], [Lot_Size/Area_Unit], [Lot_Size_-_Acres], [Lot_Size_-_Depth_Feet], [Lot_Size_-_Frontage_Feet], [Mail_Care-Of_Name_Indicator], [Main_Building_Area_Indicator], [Market_Value:_Year], [Mtg01_Adjustable_Rate_Index], [Mtg01_Adjustable_Rate_Rider], [Mtg01_Assigned_Lender_Name], [Mtg01_Cash_Purchase], [Mtg01_Construction_Loan], [Mtg01_Equity_Credit_Line], [Mtg01_Fixed/Step_(Conversion)_Rate_Rider], [Mtg01_Interest_Only_Period], [Mtg01_Lender_DBA_Name], [Mtg01_Lender_Mail:_City], [Mtg01_Lender_Mail:_Full_Street_Address], [Mtg01_Lender_Mail:_State], [Mtg01_Lender_Mail:_Unit], [Mtg01_Lender_Mail:_Zip_+4_Code], [Mtg01_Lender_Mail:_Zip_Code], [Mtg01_Lender_Name_(Beneficiary)], [Mtg01_Lender_Type], [Mtg01_Loan_Number], [Mtg01_Loan_Type], [Mtg01_PreFcl_Case_Trustee_Sale_Nbr], [Mtg01_Prepayment_Rider], [Mtg01_Prepayment_Term_(Penalty_Rider)], [Mtg01_Purchase_Mtg_Ind], [Mtg01_Purpose_of_Loan], [Mtg01_Rate_Change_Frequency], [Mtg01_Stand-Alone_Refi], [Mtg01_Title_Company_Name], [Mtg01_Type_Financing], [Mtg02_Adjustable_Rate_Index], [Mtg02_Adjustable_Rate_Rider], [Mtg02_Assigned_Lender_Name], [Mtg02_Cash_Purchase], [Mtg02_Construction_Loan], [Mtg02_Equity_Credit_Line], [Mtg02_Fixed/Step_(Conversion)_Rate_Rider], [Mtg02_Interest_Only_Period], [Mtg02_Lender_DBA_Name], [Mtg02_Lender_Mail:_City], [Mtg02_Lender_Mail:_Full_Street_Address], [Mtg02_Lender_Mail:_State], [Mtg02_Lender_Mail:_Unit], [Mtg02_Lender_Mail:_Zip_+4_Code], [Mtg02_Lender_Mail:_Zip_Code], [Mtg02_Lender_Name_(Beneficiary)], [Mtg02_Lender_Type], [Mtg02_Loan_Number], [Mtg02_Loan_Type], [Mtg02_PreFcl_Case_Trustee_Sale_Nbr], [Mtg02_Prepayment_Rider], [Mtg02_Prepayment_Term_(Penalty_Rider)], [Mtg02_Purchase_Mtg_Ind], [Mtg02_Purpose_of_Loan], [Mtg02_Rate_Change_Frequency], [Mtg02_Stand-Alone_Refi], [Mtg02_Title_Company_Name], [Mtg02_Type_Financing], [Mtg03_Adjustable_Rate_Index], [Mtg03_Adjustable_Rate_Rider], [Mtg03_Assigned_Lender_Name], [Mtg03_Cash_Purchase], [Mtg03_Construction_Loan], [Mtg03_Equity_Credit_Line], [Mtg03_Fixed/Step_(Conversion)_Rate_Rider], [Mtg03_Interest_Only_Period], [Mtg03_Lender_DBA_Name], [Mtg03_Lender_Mail:_City], [Mtg03_Lender_Mail:_Full_Street_Address], [Mtg03_Lender_Mail:_State], [Mtg03_Lender_Mail:_Unit], [Mtg03_Lender_Mail:_Zip_+4_Code], [Mtg03_Lender_Mail:_Zip_Code], [Mtg03_Lender_Name_(Beneficiary)], [Mtg03_Lender_Type], [Mtg03_Loan_Number], [Mtg03_Loan_Type], [Mtg03_PreFcl_Case_Trustee_Sale_Nbr], [Mtg03_Prepayment_Rider], [Mtg03_Prepayment_Term_(Penalty_Rider)], [Mtg03_Purchase_Mtg_Ind], [Mtg03_Purpose_of_Loan], [Mtg03_Rate_Change_Frequency], [Mtg03_Stand-Alone_Refi], [Mtg03_Title_Company_Name], [Mtg03_Type_Financing], [Mtg04_Adjustable_Rate_Index], [Mtg04_Adjustable_Rate_Rider], [Mtg04_Assigned_Lender_Name], [Mtg04_Cash_Purchase], [Mtg04_Construction_Loan], [Mtg04_Equity_Credit_Line], [Mtg04_Fixed/Step_(Conversion)_Rate_Rider], [Mtg04_Interest_Only_Period], [Mtg04_Lender_DBA_Name], [Mtg04_Lender_Mail:_City], [Mtg04_Lender_Mail:_Full_Street_Address], [Mtg04_Lender_Mail:_State], [Mtg04_Lender_Mail:_Unit], [Mtg04_Lender_Mail:_Zip_+4_Code], [Mtg04_Lender_Mail:_Zip_Code], [Mtg04_Lender_Name_(Beneficiary)], [Mtg04_Lender_Type], [Mtg04_Loan_Number], [Mtg04_Loan_Type], [Mtg04_PreFcl_Case_Trustee_Sale_Nbr], [Mtg04_Prepayment_Rider], [Mtg04_Prepayment_Term_(Penalty_Rider)], [Mtg04_Purchase_Mtg_Ind], [Mtg04_Purpose_of_Loan], [Mtg04_Rate_Change_Frequency], [Mtg04_Stand-Alone_Refi], [Mtg04_Title_Company_Name], [Mtg04_Type_Financing], [Neighborhood_Code], [No._of_Stories], [Old_APN], [Original_Lot_Size_or_Area], [Other_Impr_Building_Area_1], [Other_Impr_Building_Area_2], [Other_Impr_Building_Area_3], [Other_Impr_Building_Area_4], [Other_Impr_Building_Area_5], [Other_Impr_Building_Indicator_1], [Other_Impr_Building_Indicator_2], [Other_Impr_Building_Indicator_3], [Other_Impr_Building_Indicator_4], [Other_Impr_Building_Indicator_5], [Other_Rooms], [Owner1FirstName], [Owner1LastName], [Owner1MiddleName], [Owner2Firstname], [Owner2LastName], [Owner2MiddleName], [Owner-Occupied_(Residential)], [ParsedOwnerSourceCode], [Plumbing_Fixtures_Count], [Pool], [Prior_Sale_-__Book_Number], [Prior_Sale_-__DistressedSaleFlag], [Prior_Sale_-__Document_Number], [Prior_Sale_-__Document_Type_Code], [Prior_Sale_-__Page_Number], [Prior_Sale_-__Price], [Prior_Sale_-__Price_Code], [Prior_Sale_-__REO-Flag], [Prior_Transfer_-__Book_Number], [Prior_Transfer_-__DistressedSaleFlag], [Prior_Transfer_-__Document_Number], [Prior_Transfer_-__Document_Type_Code], [Prior_Transfer_-__Page_Number], [Prior_Transfer_-__Price], [Prior_Transfer_-__Price_Code], [Prior_Transfer_-__REO-Flag], [Property_Address:_Carrier_Route], [Property_Address:_Census_Tract], [Property_Address:_Latitude], [Property_Address:_Longitude], [Property_Address:GeoStan_Location_Code], [Property_Address:GeoStan_Match_Code], [Property_City_Name], [Property_Full_Street_Address], [Property_House_Number], [Property_State], [Property_Street_Direction_Left], [Property_Street_Direction_Right], [Property_Street_Name], [Property_Street_Suffix], [Property_Unit_Number], [Property_Unit_Type], [Property_Zip_+4_Code], [Property_Zip_Code], [Quantarium_Version], [QVM_Value_Range_Code], [Recorder''s_Book_Number_from_Assessment], [Recorder''s_Document_Number_from_Assessment], [Recorder''s_Page_Number_from_Assessment], [Roof_Cover], [Roof_Type], [Sales_Price_Code_from_Assessment], [School/Tax_District_1], [School/Tax_District_1_Indicator], [School/Tax_District_2], [School/Tax_District_2_Indicator], [School/Tax_District_3], [School/Tax_District_3_Indicator], [Sewer], [Site_Influence], [Standardized_Land_Use_Code], [Style], [Tax_Account_Number], [Tax_Delinquent_Year], [Tax_Exemption_Codes], [Tax_Rate_Code_Area], [Tax_Year], [Topography], [Total_Number_of_Rooms], [Type_Construction], [Water], [Year_Built], [Zoning] FROM [dbo].[Houseamp_WA_OL_Chg_20210913]'
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
  INTO [Profile].[Quantarium_Houseamp_WA_Select_OpenLien]
FROM [tempdb].[dbo].[Profile] [t] WITH( NOLOCK )
WHERE [Tracker] = 'gvarol_62_389E24C5'
  AND  ([t].[Num+Null+Blank%] = 100 OR [t].[Int+Null+Blank%] = 100 OR [t].[Date+Null+Blank] = 100 OR [t].[YNTF+Null+Blank] = 100)
  AND columndef LIKE '%char%'


