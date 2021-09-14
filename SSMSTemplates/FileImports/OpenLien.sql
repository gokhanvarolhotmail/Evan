USE [Evan] ;
GO
DECLARE @TableName NVARCHAR(MAX) = N'Houseamp_WA_OL_Chg_20210913' ;

SET @TableName = N'Quantarium_Houseamp_WA_Select_OpenLien_20210622' ;

DECLARE
    @SQL      NVARCHAR(MAX)
  , @BCP      VARCHAR(4000)
  , @RowCount BIGINT
  , @Return   INT ;

DROP TABLE IF EXISTS [#cols] ;

SELECT *
INTO [#cols]
FROM [Util].[dbo].ParseDelimited(
         'Quantarium_Internal_PID	FIPS_Code	Assessors_Parcel_Number	Duplicate_APN	Tax_Account_Number	Current_Owner_Name	CO_Mail_Care_of_Name	CO_Mail_Street_Address	CO_Mailing_City	CO_Mailing_State	CO_Mailing_Zip_Code	CO_Mailing_Zip_Plus4Code	CO_Unit_Number	CO_Unit_Type	Mail_Care_Of_Name_Indicator	Owner_Occupied	Owner1FirstName	Owner1MiddleName	Owner1LastName	Owner2Firstname	Owner2MiddleName	Owner2LastName	ParsedOwnerSourceCode	Buyer_ID_Code_1	Buyer_Vesting_Code	Length_of_Residence_Months	Length_of_Residence_Code	Ownership_Start_Date	LSale_Book_Number	LSale_Page_Number	LSale_Document_Number	LSale_Document_Type_Code	LSale_Price	LSale_Price_Code	LSale_Recording_Date	LSale_reo_flag	LSale_distressed_sale_flag	Last_Transfer_Date	LValid_Book_Number	LValid_Page_Number	LValid_Document_Number	LValid_Document_Type_Code	LValid_Price	LValid_Price_Code	LValid_Recording_Date	LValid_reo_flag	LValid_distressed_sale_flag	Last_Sale_date	PSale_Book_Number	PSale_Page_Number	PSale_Document_Number	PSale_Document_Type_Code	PSale_Price	PSale_Price_Code	PSale_Recording_Date	PSale_reo_flag	PSale_distressed_sale_flag	Prior_Transfer_date	PValid_Book_Number	PValid_Page_Number	PValid_Document_Number	PValid_Document_Type_Code	PValid_Price	PValid_Price_Code	PValid_Recording_Date	PValid_reo_flag	PValid_distressed_sale_flag	Prior_Sale_Date	Recorders_Document_Number_from_Assessment	Recorders_Book_Number_from_Assessment	Recorders_Page_Number_from_Assessment	Recording_Date_from_Assessment	Document_Type_from_Assessment	Sales_Price_from_Assessment	Sales_Price_Code_from_Assessment	Property_Full_Street_Address	Property_City_Name	Property_State	Property_Zip_Code	Property_Zip_Plus4Code	Property_House_Number	Property_Street_Direction_Left	Property_Street_Name	Property_Street_Suffix	Property_Street_Direction_Right	Property_Unit_Number	Property_Unit_Type	PA_Carrier_Route	PA_Census_Tract	PA_Latitude	PA_Longitude	Match_Code	Location_Code	Legal_Assessors_Map_Ref	Legal_Brief_Description	Legal_Brief_Description_FULL	Legal_Section_Township__Range_Meridian	Legal_Block	Legal_Lot_Number	Legal_City_Township_Municipality	Legal_District	Legal_Section	Legal_Land_Lot	Legal_Lot_Code	Legal_Phase_Number	Legal_Subdivision_Name	Legal_Tract_Number	Legal_Unit	Assessed_Improvement_Value	Assessed_Land_Value	Total_Assessed_Value	Assessment_Year	California_HomeOwners_Exemption	Tax_Exemption_Codes	Market_Value_Improvement	Market_Value_Land	Total_Market_Value	Market_Value_Year	School_Tax_District_1	School_Tax_District_1_Indicator	School_Tax_District_2	School_Tax_District_2_Indicator	School_Tax_District_3	School_Tax_District_3_Indicator	Tax_Amount	Tax_Year	Tax_Delinquent_Year	Tax_Rate_Code_Area	Neighborhood_Code	Condo_Project_Bldg_Name	Old_APN	Alt_Old_APN_Indicator	Certification_Date	Edition	LotSize_Acres	LotSize_Depth_Feet	LotSize_Frontage_Feet	LotSize_Square_Feet	Lot_Size_or_Area	Lot_Size_Area_Unit	Original_Lot_Size_or_Area	Topography	Site_Influence	Air_Conditioning	Air_Conditioning_Type	Amenities	Amenities_2	Basement	Building_Area	Building_Area_1	Building_Area_1_Indicator	Building_Area_2	Building_Area_2_Indicator	Building_Area_3	Building_Area_3_Indicator	Building_Area_4	Building_Area_4_Indicator	Building_Area_5	Building_Area_5_Indicator	Building_Area_6	Building_Area_6_Indicator	Building_Area_7	Building_Area_7_Indicator	Building_Class	Building_Condition	Building_Quality	Comments_Summary_of_Building_Cards	Effective_Year_Built	Elevator	Exterior_Walls	Extra_Features_1_Area	Extra_Features_1_Indicator	Extra_Features_2_Area	Extra_Features_2_Indicator	Extra_Features_3_Area	Extra_Features_3_Indicator	Extra_Features_4_Area	Extra_Features_4_Indicator	Fireplace	FLOOR_COVER	Foundation	Garage_Cars	Garage_Type	Heating	Heating_Fuel_Type	Interior_Walls	Main_Building_Area_Indicator	No_of_Buildings	No_of_Stories	Number_of_Baths	Number_of_Bedrooms	Number_of_Partial_Baths	Number_of_Units	Other_Impr_Building_Area_1	Other_Impr_Building_Area_2	Other_Impr_Building_Area_3	Other_Impr_Building_Area_4	Other_Impr_Building_Area_5	Other_Impr_Building_Indicator_1	Other_Impr_Building_Indicator_2	Other_Impr_Building_Indicator_3	Other_Impr_Building_Indicator_4	Other_Impr_Building_Indicator_5	Other_Rooms	N_of_Plumbing_Fixtures	Pool	Roof_Cover	Roof_Type	Sewer	Standardized_Land_Use_Code	Style	Total_Number_of_Rooms	Type_Construction	Water	Year_Built	Zoning	Mtg01_lender_name_beneficiary	Mtg01_lender_type	Mtg01_original_date_of_contract	Mtg01_recording_date	Mtg01_Loan_Amount	Mtg01_loan_type	Mtg01_type_financing	Mtg01_interest_rate	Mtg01_due_date	Mtg01_Adjustable_Rate_Rider	Mtg01_Adjustable_Rate_Index	Mtg01_Change_Index	Mtg01_Rate_Change_Frequency	Mtg01_Interest_Rate_Not_Greater_Than	Mtg01_Interest_Rate_Not_Less_Than	Mtg01_Maximum_Interest_Rate	Mtg01_Interest_Only_Period	Mtg01_fixed_step_conversion_rate_rider	Mtg01_First_Change_Date_Year_Conversion_Rider	Mtg01_First_Change_Date_Month_Day_Conversion_Rider	Mtg01_Prepayment_Rider	Mtg01_Prepayment_Term_Penalty_Rider	Mtg01_Title_Company_Name	Mtg01_Lender_Name	Mtg01_Lender_Mail_Full_Street_Address	Mtg01_Lender_Mail_Unit	Mtg01_Lender_Mail_City	Mtg01_Lender_Mail_State	Mtg01_Lender_Mail_Zip_Code	Mtg01_Lender_Mail_Zip_Plus4Code	Mtg01_Loan_Term_Months	Mtg01_Loan_Term_Years	Mtg01_loan_number	Mtg01_Construction_Loan	Mtg01_Cash_Purchase	Mtg01_StandAlone_Refi	Mtg01_Equity_Credit_Line	Mtg01_Curr_Est_Bal	Mtg01_Purpose_Of_Loan	Mtg01_Purchase_Mtg_Ind	Mtg01_Est_Monthly_P&I	Mtg01_Est_Monthly_Principal	Mtg01_Est_Monthly_Interest	Mtg01_Curr_Est_Int_Rate	Mtg01_Assigned_Lender_Name	Mtg01_Assignment_Date	Mtg01_Number_of_Assignments	Mtg01_PreForeclosure_Status	Mtg01_PreFcl_Recording_Date	Mtg01_PreFcl_Filing_Date	Mtg01_PreFcl_Case_Trustee_Sale_Nbr	Mtg01_PreFcl_Auction_Date	Mtg02_lender_name_beneficiary	Mtg02_lender_type	Mtg02_original_date_of_contract	Mtg02_recording_date	Mtg02_Loan_Amount	Mtg02_loan_type	Mtg02_type_financing	Mtg02_interest_rate	Mtg02_due_date	Mtg02_Adjustable_Rate_Rider	Mtg02_Adjustable_Rate_Index	Mtg02_Change_Index	Mtg02_Rate_Change_Frequency	Mtg02_Interest_Rate_Not_Greater_Than	Mtg02_Interest_Rate_Not_Less_Than	Mtg02_Maximum_Interest_Rate	Mtg02_Interest_Only_Period	Mtg02_fixed_step_conversion_rate_rider	Mtg02_First_Change_Date_Year_Conversion_Rider	Mtg02_First_Change_Date_Month_Day_Conversion_Rider	Mtg02_Prepayment_Rider	Mtg02_Prepayment_Term_Penalty_Rider	Mtg02_Title_Company_Name	Mtg02_Lender_Name	Mtg02_Lender_Mail_Full_Street_Address	Mtg02_Lender_Mail_Unit	Mtg02_Lender_Mail_City	Mtg02_Lender_Mail_State	Mtg02_Lender_Mail_Zip_Code	Mtg02_Lender_Mail_Zip_Plus4Code	Mtg02_Loan_Term_Months	Mtg02_Loan_Term_Years	Mtg02_loan_number	Mtg02_Construction_Loan	Mtg02_Cash_Purchase	Mtg02_StandAlone_Refi	Mtg02_Equity_Credit_Line	Mtg02_Curr_Est_Bal	Mtg02_Purpose_Of_Loan	Mtg02_Purchase_Mtg_Ind	Mtg02_Est_Monthly_P&I	Mtg02_Est_Monthly_Principal	Mtg02_Est_Monthly_Interest	Mtg02_Curr_Est_Int_Rate	Mtg02_Assigned_Lender_Name	Mtg02_Assignment_Date	Mtg02_Number_of_Assignments	Mtg02_PreForeclosure_Status	Mtg02_PreFcl_Recording_Date	Mtg02_PreFcl_Filing_Date	Mtg02_PreFcl_Case_Trustee_Sale_Nbr	Mtg02_PreFcl_Auction_Date	Mtg03_lender_name_beneficiary	Mtg03_lender_type	Mtg03_original_date_of_contract	Mtg03_recording_date	Mtg03_Loan_Amount	Mtg03_loan_type	Mtg03_type_financing	Mtg03_interest_rate	Mtg03_due_date	Mtg03_Adjustable_Rate_Rider	Mtg03_Adjustable_Rate_Index	Mtg03_Change_Index	Mtg03_Rate_Change_Frequency	Mtg03_Interest_Rate_Not_Greater_Than	Mtg03_Interest_Rate_Not_Less_Than	Mtg03_Maximum_Interest_Rate	Mtg03_Interest_Only_Period	Mtg03_fixed_step_conversion_rate_rider	Mtg03_First_Change_Date_Year_Conversion_Rider	Mtg03_First_Change_Date_Month_Day_Conversion_Rider	Mtg03_Prepayment_Rider	Mtg03_Prepayment_Term_Penalty_Rider	Mtg03_Title_Company_Name	Mtg03_Lender_Name	Mtg03_Lender_Mail_Full_Street_Address	Mtg03_Lender_Mail_Unit	Mtg03_Lender_Mail_City	Mtg03_Lender_Mail_State	Mtg03_Lender_Mail_Zip_Code	Mtg03_Lender_Mail_Zip_Plus4Code	Mtg03_Loan_Term_Months	Mtg03_Loan_Term_Years	Mtg03_loan_number	Mtg03_Construction_Loan	Mtg03_Cash_Purchase	Mtg03_StandAlone_Refi	Mtg03_Equity_Credit_Line	Mtg03_Curr_Est_Bal	Mtg03_Purpose_Of_Loan	Mtg03_Purchase_Mtg_Ind	Mtg03_Est_Monthly_P&I	Mtg03_Est_Monthly_Principal	Mtg03_Est_Monthly_Interest	Mtg03_Curr_Est_Int_Rate	Mtg03_Assigned_Lender_Name	Mtg03_Assignment_Date	Mtg03_Number_of_Assignments	Mtg03_PreForeclosure_Status	Mtg03_PreFcl_Recording_Date	Mtg03_PreFcl_Filing_Date	Mtg03_PreFcl_Case_Trustee_Sale_Nbr	Mtg03_PreFcl_Auction_Date	Mtg04_lender_name_beneficiary	Mtg04_lender_type	Mtg04_original_date_of_contract	Mtg04_recording_date	Mtg04_Loan_Amount	Mtg04_loan_type	Mtg04_type_financing	Mtg04_interest_rate	Mtg04_due_date	Mtg04_Adjustable_Rate_Rider	Mtg04_Adjustable_Rate_Index	Mtg04_Change_Index	Mtg04_Rate_Change_Frequency	Mtg04_Interest_Rate_Not_Greater_Than	Mtg04_Interest_Rate_Not_Less_Than	Mtg04_Maximum_Interest_Rate	Mtg04_Interest_Only_Period	Mtg04_fixed_step_conversion_rate_rider	Mtg04_First_Change_Date_Year_Conversion_Rider	Mtg04_First_Change_Date_Month_Day_Conversion_Rider	Mtg04_Prepayment_Rider	Mtg04_Prepayment_Term_Penalty_Rider	Mtg04_Title_Company_Name	Mtg04_Lender_Name	Mtg04_Lender_Mail_Full_Street_Address	Mtg04_Lender_Mail_Unit	Mtg04_Lender_Mail_City	Mtg04_Lender_Mail_State	Mtg04_Lender_Mail_Zip_Code	Mtg04_Lender_Mail_Zip_Plus4Code	Mtg04_Loan_Term_Months	Mtg04_Loan_Term_Years	Mtg04_loan_number	Mtg04_Construction_Loan	Mtg04_Cash_Purchase	Mtg04_StandAlone_Refi	Mtg04_Equity_Credit_Line	Mtg04_Curr_Est_Bal	Mtg04_Purpose_Of_Loan	Mtg04_Purchase_Mtg_Ind	Mtg04_Est_Monthly_P&I	Mtg04_Est_Monthly_Principal	Mtg04_Est_Monthly_Interest	Mtg04_Curr_Est_Int_Rate	Mtg04_Assigned_Lender_Name	Mtg04_Assignment_Date	Mtg04_Number_of_Assignments	Mtg04_PreForeclosure_Status	Mtg04_PreFcl_Recording_Date	Mtg04_PreFcl_Filing_Date	Mtg04_PreFcl_Case_Trustee_Sale_Nbr	Mtg04_PreFcl_Auction_Date	Additional_Open_Lien_Count	Additional_Open_Lien_Balance	Total_Open_Lien_Count	Total_Open_Lien_Balance	Total_Financing_History_Count	Current_Est_LTV_Combined	Current_Est_LTV_Range_Code	Current_Est_Equity_Dollars	Current_Est_Equity_Range_Code	Purchase_LTV	Current_Foreclosure_Status	Foreclosure_Recording_Date	Foreclosure_filing_date	Foreclosure_Case_Number	Foreclosure_Auction_Date	ESTIMATED_VALUE	PRICE_RANGE_MIN	PRICE_RANGE_MAX	FSD_SCORE	CONFIDENCE_SCORE	QVM_Value_Range_Code	QVM_asof_Date	Trans_asof_Date	Record_Creation_Date	Quantarium_Version'
       , '	') ;

SELECT @SQL = CONCAT('DROP TABLE IF EXISTS [dbo].[', @TableName, ']
CREATE TABLE [dbo].[', @TableName, '](
	', STRING_AGG(CONCAT(CAST(QUOTENAME([Field]) AS VARCHAR(MAX)), ' VARCHAR(8000)'), ',
	')WITHIN GROUP(ORDER BY [FieldNum]), '
)')
FROM [#cols] ;

SELECT @SQL AS [SQL] ;

EXEC( @SQL ) ;

SET @BCP = CONCAT('bcp "[Evan].[dbo].[', @TableName, ']" in "C:\Temp\', @TableName, '.txt" -F 2 -c -t \t -S 192.168.1.19 -a 65535 -U gvarol -P C@n@n6132') ;

SELECT @BCP AS [BCP] ;

EXEC @Return = [sys].[xp_cmdshell] @BCP ;

IF @Return <> 0
    THROW 50000, 'Bulk Insert Failed!', 1 ;

SELECT @SQL = CONCAT('DROP TABLE IF EXISTS [dbo].[', @TableName, '_New]

SELECT
	', STRING_AGG(REPLACE([v].[Casted], '[Column]', QUOTENAME([c].[Field])), ',
	'), '
INTO [dbo].[', @TableName, '_New]
FROM(
SELECT
	', STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), 'CASE WHEN TRIM([', [c].[Field], ']) IN ('''',''NULL'') THEN NULL ELSE TRIM([', [c].[Field], ']) END AS [', [c].[Field], ']'), ',
	')WITHIN GROUP(ORDER BY [c].[FieldNum]), '
FROM [dbo].[', @TableName, '] )[k]

SET @RowCount = @@ROWCOUNT

IF @RowCount > 0
BEGIN
	SET XACT_ABORT ON 
	BEGIN TRANSACTION
	DROP TABLE [dbo].[', @TableName, ']
	EXEC sp_rename ''[dbo].[', @TableName, '_New]'',''', @TableName, ''',''object''
	COMMIT
END
CREATE UNIQUE CLUSTERED INDEX [Quantarium_Internal_PID] ON [', @TableName, '] ([Quantarium_Internal_PID]) WITH (DATA_COMPRESSION = ROW)
')
FROM [#cols] AS [c]
FULL OUTER JOIN [Definition].[vOpenLien] AS [v] ON [v].[Field #] = [c].[FieldNum] ;

SELECT @SQL AS [SQL] ;

EXEC [sys].[sp_executesql] @SQL, N'@RowCount BIGINT OUTPUT', @RowCount OUTPUT ;

SELECT
    @TableName AS [TableName]
  , @RowCount AS [RowCount] ;
GO

RETURN ;

SELECT 
       [Quantarium_Internal_PID]
     , COUNT(1) AS Cnt
FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien_20210622]
GROUP BY [Quantarium_Internal_PID]
HAVING COUNT(1) > 1
ORDER BY COUNT(1) DESC ;

SELECT COUNT(1)
FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien_20210622]
WHERE [Quantarium_Internal_PID] = 144947666 ;

SELECT COUNT(1)
FROM( SELECT DISTINCT * FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien_20210622] WHERE [Quantarium_Internal_PID] = 144947666 ) AS [k] ;
