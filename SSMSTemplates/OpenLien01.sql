-- DROP TABLE IF EXISTS [dbo].[Quantarium_Houseamp_WA_Select_OpenLien]
SELECT
CAST([Quantarium_Internal_PID] AS BIGINT) AS [Quantarium_Internal_PID],
CAST([FIPS_Code] AS CHAR(5)) AS [FIPS_Code_(State/County)],
CAST([Assessors_Parcel_Number] AS VARCHAR(45)) AS [Assessorís_Parcel_Number_(APN,_PIN)],
CAST([Duplicate_APN] AS VARCHAR(2)) AS [Duplicate_APN],
CAST([Tax_Account_Number] AS VARCHAR(30)) AS [Tax_Account_Number],
CAST([Current_Owner_Name] AS VARCHAR(166)) AS [Current_Owner_Name],
CAST([CO_Mail_Care_of_Name] AS VARCHAR(60)) AS [Current_Owner:_Mail_Care_of_Name],
CAST([CO_Mail_Street_Address] AS VARCHAR(80)) AS [Current_Owner:_Mail_Street_Address],
CAST([CO_Mailing_City] AS VARCHAR(30)) AS [Current_Owner:_Mailing_City],
CAST([CO_Mailing_State] AS VARCHAR(2)) AS [Current_Owner:_Mailing_State],
CAST([CO_Mailing_Zip_Code] AS VARCHAR(5)) AS [Current_Owner:_Mailing_Zip_Code],
CAST([CO_Mailing_Zip_Plus4Code] AS VARCHAR(4)) AS [Current_Owner:_Mailing_Zip_+4_Code],
CAST([CO_Unit_Number] AS VARCHAR(11)) AS [Current_Owner:_Unit_Number],
CAST([CO_Unit_Type] AS VARCHAR(4)) AS [Current_Owner:_Unit_Type],
CAST([Mail_Care_Of_Name_Indicator] AS VARCHAR(1)) AS [Mail_Care-Of_Name_Indicator],
CAST([Owner_Occupied] AS VARCHAR(1)) AS [Owner-Occupied_(Residential)],
CAST([Owner1FirstName] AS VARCHAR(166)) AS [Owner1FirstName],
CAST([Owner1MiddleName] AS VARCHAR(166)) AS [Owner1MiddleName],
CAST([Owner1LastName] AS VARCHAR(166)) AS [Owner1LastName],
CAST([Owner2Firstname] AS VARCHAR(166)) AS [Owner2Firstname],
CAST([Owner2MiddleName] AS VARCHAR(166)) AS [Owner2MiddleName],
CAST([Owner2LastName] AS VARCHAR(166)) AS [Owner2LastName],
CAST([ParsedOwnerSourceCode] AS VARCHAR(1)) AS [ParsedOwnerSourceCode],
CAST([Buyer_ID_Code_1] AS VARCHAR(2)) AS [Buyer-id-code1],
CAST([Buyer_Vesting_Code] AS VARCHAR(2)) AS [Buyer-vesting-code1],
CAST([Length_of_Residence_Months] AS INT) AS [Length_of_Residence_Months],
CAST([Length_of_Residence_Code] AS VARCHAR(2)) AS [Length_of_Residence_Code],
CAST([Ownership_Start_Date] AS DATE) AS [Ownership_Start_Date],
CAST([LSale_Book_Number] AS VARCHAR(10)) AS [Last_Transfer_-__Book_Number],
CAST([LSale_Page_Number] AS VARCHAR(10)) AS [Last_Transfer_-__Page_Number],
CAST([LSale_Document_Number] AS VARCHAR(20)) AS [Last_Transfer_-__Document_Number],
CAST([LSale_Document_Type_Code] AS VARCHAR(2)) AS [Last_Transfer_-__Document_Type_Code],
CAST([LSale_Price] AS VARCHAR(10)) AS [Last_Transfer_-__Price],
CAST([LSale_Price_Code] AS VARCHAR(1)) AS [Last_Transfer_-__Price_Code],
CAST([LSale_Recording_Date] AS DATE) AS [Last_Transfer_-__Recording_Date],
CAST([LSale_reo_flag] AS VARCHAR(1)) AS [Last_Transfer_-__REO-Flag],
CAST([LSale_distressed_sale_flag] AS VARCHAR(1)) AS [Last_Transfer_-__DistressedSaleFlag],
CAST([Last_Transfer_Date] AS DATE) AS [Last_Transfer_Date],
CAST([LValid_Book_Number] AS VARCHAR(10)) AS [Last_Sale_-__Book_Number],
CAST([LValid_Page_Number] AS VARCHAR(10)) AS [Last_Sale_-__Page_Number],
CAST([LValid_Document_Number] AS VARCHAR(20)) AS [Last_Sale_-__Document_Number],
CAST([LValid_Document_Type_Code] AS VARCHAR(2)) AS [Last_Sale_-__Document_Type_Code],
CAST([LValid_Price] AS VARCHAR(10)) AS [Last_Sale_-__Price],
CAST([LValid_Price_Code] AS VARCHAR(1)) AS [Last_Sale_-__Price_Code],
CAST([LValid_Recording_Date] AS DATE) AS [Last_Sale_-__Recording_Date],
CAST([LValid_reo_flag] AS VARCHAR(1)) AS [Last_Sale_-__REO-Flag],
CAST([LValid_distressed_sale_flag] AS VARCHAR(1)) AS [Last_Sale_-__DistressedSaleFlag],
CAST([Last_Sale_date] AS DATE) AS [Last_Sale_date],
CAST([PSale_Book_Number] AS VARCHAR(10)) AS [Prior_Transfer_-__Book_Number],
CAST([PSale_Page_Number] AS VARCHAR(10)) AS [Prior_Transfer_-__Page_Number],
CAST([PSale_Document_Number] AS VARCHAR(20)) AS [Prior_Transfer_-__Document_Number],
CAST([PSale_Document_Type_Code] AS VARCHAR(2)) AS [Prior_Transfer_-__Document_Type_Code],
CAST([PSale_Price] AS VARCHAR(10)) AS [Prior_Transfer_-__Price],
CAST([PSale_Price_Code] AS VARCHAR(1)) AS [Prior_Transfer_-__Price_Code],
CAST([PSale_Recording_Date] AS DATE) AS [Prior_Transfer_-__Recording_Date],
CAST([PSale_reo_flag] AS VARCHAR(1)) AS [Prior_Transfer_-__REO-Flag],
CAST([PSale_distressed_sale_flag] AS VARCHAR(1)) AS [Prior_Transfer_-__DistressedSaleFlag],
CAST([Prior_Transfer_date] AS DATE) AS [Prior_Transfer_date],
CAST([PValid_Book_Number] AS VARCHAR(10)) AS [Prior_Sale_-__Book_Number],
CAST([PValid_Page_Number] AS VARCHAR(10)) AS [Prior_Sale_-__Page_Number],
CAST([PValid_Document_Number] AS VARCHAR(20)) AS [Prior_Sale_-__Document_Number],
CAST([PValid_Document_Type_Code] AS VARCHAR(2)) AS [Prior_Sale_-__Document_Type_Code],
CAST([PValid_Price] AS VARCHAR(10)) AS [Prior_Sale_-__Price],
CAST([PValid_Price_Code] AS VARCHAR(1)) AS [Prior_Sale_-__Price_Code],
CAST([PValid_Recording_Date] AS DATE) AS [Prior_Sale_-__Recording_Date],
CAST([PValid_reo_flag] AS VARCHAR(1)) AS [Prior_Sale_-__REO-Flag],
CAST([PValid_distressed_sale_flag] AS VARCHAR(1)) AS [Prior_Sale_-__DistressedSaleFlag],
CAST([Prior_Sale_Date] AS DATE) AS [Prior_Sale_Date],
CAST([Recorders_Document_Number_from_Assessment] AS VARCHAR(20)) AS [Recorder's_Document_Number_from_Assessment],
CAST([Recorders_Book_Number_from_Assessment] AS VARCHAR(10)) AS [Recorder's_Book_Number_from_Assessment],
CAST([Recorders_Page_Number_from_Assessment] AS VARCHAR(10)) AS [Recorder's_Page_Number_from_Assessment],
CAST([Recording_Date_from_Assessment] AS DATE) AS [Recording_Date_from_Assessment],
CAST([Document_Type_from_Assessment] AS VARCHAR(25)) AS [Document_Type_from_Assessment_(County_description)],
CAST([Sales_Price_from_Assessment] AS INT) AS [Sales_Price_from_Assessment],
CAST([Sales_Price_Code_from_Assessment] AS VARCHAR(1)) AS [Sales_Price_Code_from_Assessment],
CAST([Property_Full_Street_Address] AS VARCHAR(60)) AS [Property_Full_Street_Address],
CAST([Property_City_Name] AS VARCHAR(30)) AS [Property_City_Name],
CAST([Property_State] AS VARCHAR(2)) AS [Property_State],
CAST([Property_Zip_Code] AS VARCHAR(5)) AS [Property_Zip_Code],
CAST([Property_Zip_Plus4Code] AS VARCHAR(4)) AS [Property_Zip_+4_Code],
CAST([Property_House_Number] AS VARCHAR(13)) AS [Property_House_Number],
CAST([Property_Street_Direction_Left] AS VARCHAR(2)) AS [Property_Street_Direction_Left],
CAST([Property_Street_Name] AS VARCHAR(40)) AS [Property_Street_Name],
CAST([Property_Street_Suffix] AS VARCHAR(4)) AS [Property_Street_Suffix],
CAST([Property_Street_Direction_Right] AS VARCHAR(2)) AS [Property_Street_Direction_Right],
CAST([Property_Unit_Number] AS VARCHAR(11)) AS [Property_Unit_Number],
CAST([Property_Unit_Type] AS VARCHAR(4)) AS [Property_Unit_Type],
CAST([PA_Carrier_Route] AS VARCHAR(4)) AS [Property_Address:_Carrier_Route],
CAST([PA_Census_Tract] AS VARCHAR(16)) AS [Property_Address:_Census_Tract],
CAST([PA_Latitude] AS VARCHAR(20)) AS [Property_Address:_Latitude],
CAST([PA_Longitude] AS VARCHAR(20)) AS [Property_Address:_Longitude],
CAST([Match_Code] AS VARCHAR(4)) AS [Property_Address:GeoStan_Match_Code],
CAST([Location_Code] AS VARCHAR(4)) AS [Property_Address:GeoStan_Location_Code],
CAST([Legal_Assessors_Map_Ref] AS VARCHAR(15)) AS [Legal:_Assessor's_Map_Ref],
CAST([Legal_Brief_Description] AS VARCHAR(200)) AS [Legal:_Brief_Description],
CAST([Legal_Brief_Description_FULL] AS VARCHAR(400)) AS [Legal:_Brief_Description_-_FULL],
CAST([Legal_Section_Township__Range_Meridian] AS VARCHAR(30)) AS [Legal:_Section/Township/_Range/Meridian],
CAST([Legal_Block] AS VARCHAR(7)) AS [Legal:_Block],
CAST([Legal_Lot_Number] AS VARCHAR(7)) AS [Legal:_Lot_Number],
CAST([Legal_City_Township_Municipality] AS VARCHAR(30)) AS [Legal:_City,_Township,_Municipality],
CAST([Legal_District] AS VARCHAR(12)) AS [Legal:_District],
CAST([Legal_Section] AS VARCHAR(7)) AS [Legal:_Section],
CAST([Legal_Land_Lot] AS VARCHAR(10)) AS [Legal:_Land_Lot],
CAST([Legal_Lot_Code] AS VARCHAR(2)) AS [Legal:_Lot_Code],
CAST([Legal_Phase_Number] AS VARCHAR(7)) AS [Legal:_Phase_Number],
CAST([Legal_Subdivision_Name] AS VARCHAR(40)) AS [Legal:_Subdivision_Name],
CAST([Legal_Tract_Number] AS VARCHAR(10)) AS [Legal:_Tract_Number],
CAST([Legal_Unit] AS VARCHAR(6)) AS [Legal:_Unit],
CAST([Assessed_Improvement_Value] AS INT) AS [Assessed_Value_Improvement],
CAST([Assessed_Land_Value] AS INT) AS [Assessed_Value_Land],
CAST([Total_Assessed_Value] AS INT) AS [Assessed_Value_Total],
CAST([Assessment_Year] AS VARCHAR(4)) AS [Assessment_Year],
CAST([California_HomeOwners_Exemption] AS VARCHAR(1)) AS [California_Homeowner's_Exemption],
CAST([Tax_Exemption_Codes] AS VARCHAR(4)) AS [Tax_Exemption_Codes],
CAST([Market_Value_Improvement] AS INT) AS [Market_Value:_Improvement],
CAST([Market_Value_Land] AS INT) AS [Market_Value:_Land],
CAST([Total_Market_Value] AS INT) AS [Market_Value:_Total],
CAST([Market_Value_Year] AS VARCHAR(4)) AS [Market_Value:_Year],
CAST([School_Tax_District_1] AS VARCHAR(15)) AS [School/Tax_District_1],
CAST([School_Tax_District_1_Indicator] AS VARCHAR(1)) AS [School/Tax_District_1_Indicator],
CAST([School_Tax_District_2] AS VARCHAR(15)) AS [School/Tax_District_2],
CAST([School_Tax_District_2_Indicator] AS VARCHAR(1)) AS [School/Tax_District_2_Indicator],
CAST([School_Tax_District_3] AS VARCHAR(15)) AS [School/Tax_District_3],
CAST([School_Tax_District_3_Indicator] AS VARCHAR(1)) AS [School/Tax_District_3_Indicator],
CAST([Tax_Amount] AS DECIMAL(11, 2)) AS [Tax_Amount],
CAST([Tax_Year] AS VARCHAR(4)) AS [Tax_Year],
CAST([Tax_Delinquent_Year] AS VARCHAR(4)) AS [Tax_Delinquent_Year],
CAST([Tax_Rate_Code_Area] AS VARCHAR(18)) AS [Tax_Rate_Code_Area],
CAST([Neighborhood_Code] AS VARCHAR(9)) AS [Neighborhood_Code],
CAST([Condo_Project_Bldg_Name] AS VARCHAR(20)) AS [Condo_Project_/__Bldg_Name],
CAST([Old_APN] AS VARCHAR(31)) AS [Old_APN],
CAST([Alt_Old_APN_Indicator] AS VARCHAR(1)) AS [Alt/Old_APN_Indicator],
CAST(RIGHT([Certification_Date],4) + LEFT([Certification_Date],4) AS DATE) AS [Certification_Date],
CAST([Edition] AS VARCHAR(2)) AS [Edition],
CAST([LotSize_Acres] AS VARCHAR(14)) AS [Lot_Size_-_Acres],
CAST([LotSize_Depth_Feet] AS VARCHAR(10)) AS [Lot_Size_-_Depth_Feet],
CAST([LotSize_Frontage_Feet] AS VARCHAR(10)) AS [Lot_Size_-_Frontage_Feet],
CAST([LotSize_Square_Feet] AS INT) AS [Lot_Size_-_Square_Feet_(refer_to_rules_for_populating_Field_76)],
CAST([Lot_Size_or_Area] AS REAL) AS [Lot_Size_or_Area],
CAST([Lot_Size_Area_Unit] AS VARCHAR(2)) AS [Lot_Size/Area_Unit],
CAST([Original_Lot_Size_or_Area] AS VARCHAR(14)) AS [Original_Lot_Size_or_Area],
CAST([Topography] AS VARCHAR(1)) AS [Topography],
CAST([Site_Influence] AS VARCHAR(2)) AS [Site_Influence],
CAST([Air_Conditioning] AS VARCHAR(1)) AS [Air_Conditioning],
CAST([Air_Conditioning_Type] AS VARCHAR(1)) AS [Air_Conditioning_Type],
CAST([Amenities] AS VARCHAR(5)) AS [Amenities],
CAST([Amenities_2] AS VARCHAR(5)) AS [Amenities_2],
CAST([Basement] AS VARCHAR(1)) AS [Basement],
CAST([Building_Area] AS INT) AS [Building_Area],
CAST([Building_Area_1] AS INT) AS [Building_Area_1],
CAST([Building_Area_1_Indicator] AS VARCHAR(2)) AS [Building_Area_1_Indicator],
CAST([Building_Area_2] AS INT) AS [Building_Area_2],
CAST([Building_Area_2_Indicator] AS VARCHAR(2)) AS [Building_Area_2_Indicator],
CAST([Building_Area_3] AS INT) AS [Building_Area_3],
CAST([Building_Area_3_Indicator] AS VARCHAR(2)) AS [Building_Area_3_Indicator],
CAST([Building_Area_4] AS INT) AS [Building_Area_4],
CAST([Building_Area_4_Indicator] AS VARCHAR(2)) AS [Building_Area_4_Indicator],
CAST([Building_Area_5] AS INT) AS [Building_Area_5],
CAST([Building_Area_5_Indicator] AS VARCHAR(2)) AS [Building_Area_5_Indicator],
CAST([Building_Area_6] AS INT) AS [Building_Area_6],
CAST([Building_Area_6_Indicator] AS VARCHAR(2)) AS [Building_Area_6_Indicator],
CAST([Building_Area_7] AS INT) AS [Building_Area_7],
CAST([Building_Area_7_Indicator] AS VARCHAR(2)) AS [Building_Area_7_Indicator],
CAST([Building_Class] AS VARCHAR(1)) AS [Building_Class],
CAST([Building_Condition] AS VARCHAR(1)) AS [Building_Condition],
CAST([Building_Quality] AS VARCHAR(2)) AS [Building_Quality],
CAST([Comments_Summary_of_Building_Cards] AS VARCHAR(120)) AS [Comments:__Summary_of_Building_Cards_("DR"_Records)],
CAST([Effective_Year_Built] AS VARCHAR(4)) AS [Effective_Year_Built],
CAST([Elevator] AS VARCHAR(1)) AS [Elevator],
CAST([Exterior_Walls] AS VARCHAR(1)) AS [Exterior_Walls],
CAST([Extra_Features_1_Area] AS VARCHAR(9)) AS [Extra_Features_1_Area],
CAST([Extra_Features_1_Indicator] AS VARCHAR(2)) AS [Extra_Features_1_Indicator],
CAST([Extra_Features_2_Area] AS VARCHAR(9)) AS [Extra_Features_2_Area],
CAST([Extra_Features_2_Indicator] AS VARCHAR(2)) AS [Extra_Features_2_Indicator],
CAST([Extra_Features_3_Area] AS VARCHAR(9)) AS [Extra_Features_3_Area],
CAST([Extra_Features_3_Indicator] AS VARCHAR(2)) AS [Extra_Features_3_Indicator],
CAST([Extra_Features_4_Area] AS VARCHAR(9)) AS [Extra_Features_4_Area],
CAST([Extra_Features_4_Indicator] AS VARCHAR(2)) AS [Extra_Features_4_Indicator],
CAST([Fireplace] AS VARCHAR(1)) AS [Fireplace],
CAST([FLOOR_COVER] AS VARCHAR(2)) AS [FLOOR_COVER],
CAST([Foundation] AS VARCHAR(1)) AS [Foundation],
CAST([Garage_Cars] AS INT) AS [Garage_(Parking)_-_#_of_Cars],
CAST([Garage_Type] AS VARCHAR(1)) AS [Garage_Type_(Parking)],
CAST([Heating] AS VARCHAR(1)) AS [Heating],
CAST([Heating_Fuel_Type] AS VARCHAR(1)) AS [Heating_Fuel_Type],
CAST([Interior_Walls] AS VARCHAR(1)) AS [Interior_Walls],
CAST([Main_Building_Area_Indicator] AS VARCHAR(1)) AS [Main_Building_Area_Indicator],
CAST([No_of_Buildings] AS INT) AS [No._of_Buildings],
CAST([No_of_Stories] AS VARCHAR(10)) AS [No._of_Stories],
CAST([Number_of_Baths] AS DECIMAL(5, 2)) AS [Number_of_Baths],
CAST([Number_of_Bedrooms] AS INT) AS [Number_of_Bedrooms],
CAST([Number_of_Partial_Baths] AS INT) AS [Number_of_Partial_Baths],
CAST([Number_of_Units] AS INT) AS [Number_of_Units],
CAST([Other_Impr_Building_Area_1] AS VARCHAR(9)) AS [Other_Impr_Building_Area_1],
CAST([Other_Impr_Building_Area_2] AS VARCHAR(9)) AS [Other_Impr_Building_Area_2],
CAST([Other_Impr_Building_Area_3] AS VARCHAR(9)) AS [Other_Impr_Building_Area_3],
CAST([Other_Impr_Building_Area_4] AS VARCHAR(9)) AS [Other_Impr_Building_Area_4],
CAST([Other_Impr_Building_Area_5] AS VARCHAR(9)) AS [Other_Impr_Building_Area_5],
CAST([Other_Impr_Building_Indicator_1] AS VARCHAR(2)) AS [Other_Impr_Building_Indicator_1],
CAST([Other_Impr_Building_Indicator_2] AS VARCHAR(2)) AS [Other_Impr_Building_Indicator_2],
CAST([Other_Impr_Building_Indicator_3] AS VARCHAR(2)) AS [Other_Impr_Building_Indicator_3],
CAST([Other_Impr_Building_Indicator_4] AS VARCHAR(2)) AS [Other_Impr_Building_Indicator_4],
CAST([Other_Impr_Building_Indicator_5] AS VARCHAR(2)) AS [Other_Impr_Building_Indicator_5],
CAST([Other_Rooms] AS VARCHAR(5)) AS [Other_Rooms],
CAST([N_of_Plumbing_Fixtures] AS VARCHAR(3)) AS [Plumbing_Fixtures_Count],
CAST([Pool] AS VARCHAR(1)) AS [Pool],
CAST([Roof_Cover] AS VARCHAR(1)) AS [Roof_Cover],
CAST([Roof_Type] AS VARCHAR(1)) AS [Roof_Type],
CAST([Sewer] AS VARCHAR(1)) AS [Sewer],
CAST([Standardized_Land_Use_Code] AS VARCHAR(4)) AS [Standardized_Land_Use_Code],
CAST([Style] AS VARCHAR(1)) AS [Style],
CAST([Total_Number_of_Rooms] AS VARCHAR(2)) AS [Total_Number_of_Rooms],
CAST([Type_Construction] AS VARCHAR(1)) AS [Type_Construction],
CAST([Water] AS VARCHAR(1)) AS [Water],
CAST([Year_Built] AS VARCHAR(4)) AS [Year_Built],
CAST([Zoning] AS VARCHAR(25)) AS [Zoning],
CAST([Mtg01_lender_name_beneficiary] AS VARCHAR(40)) AS [Mtg01_Lender_Name_(Beneficiary)],
CAST([Mtg01_lender_type] AS VARCHAR(1)) AS [Mtg01_Lender_Type],
CAST([Mtg01_original_date_of_contract] AS DATE) AS [Mtg01_Loan_Origination_Date],
CAST([Mtg01_recording_date] AS DATE) AS [Mtg01_Loan_Recording_Date],
CAST([Mtg01_Loan_Amount] AS INT) AS [Mtg01_Loan_Amount],
CAST([Mtg01_loan_type] AS VARCHAR(1)) AS [Mtg01_Loan_Type],
CAST([Mtg01_type_financing] AS VARCHAR(4)) AS [Mtg01_Type_Financing],
CAST([Mtg01_interest_rate] AS DECIMAL(7, 5)) AS [Mtg01_Interest_Rate],
CAST([Mtg01_due_date] AS DATE) AS [Mtg01_Due_Date],
CAST([Mtg01_Adjustable_Rate_Rider] AS VARCHAR(1)) AS [Mtg01_Adjustable_Rate_Rider],
CAST([Mtg01_Adjustable_Rate_Index] AS VARCHAR(15)) AS [Mtg01_Adjustable_Rate_Index],
CAST([Mtg01_Change_Index] AS DECIMAL(7, 5)) AS [Mtg01_Change_Index],
CAST([Mtg01_Rate_Change_Frequency] AS VARCHAR(1)) AS [Mtg01_Rate_Change_Frequency],
CAST([Mtg01_Interest_Rate_Not_Greater_Than] AS DECIMAL(7, 5)) AS [Mtg01_Interest_Rate_Not_Greater_Than],
CAST([Mtg01_Interest_Rate_Not_Less_Than] AS DECIMAL(7, 5)) AS [Mtg01_Interest_Rate_Not_Less_Than],
CAST([Mtg01_Maximum_Interest_Rate] AS DECIMAL(7, 5)) AS [Mtg01_Maximum_Interest_Rate],
CAST([Mtg01_Interest_Only_Period] AS VARCHAR(2)) AS [Mtg01_Interest_Only_Period],
CAST([Mtg01_fixed_step_conversion_rate_rider] AS VARCHAR(1)) AS [Mtg01_Fixed/Step_(Conversion)_Rate_Rider],
CAST([Mtg01_First_Change_Date_Year_Conversion_Rider] AS DATE) AS [Mtg01_First_Change_Date_(Conversion_Rider)],
CAST([Mtg01_First_Change_Date_Month_Day_Conversion_Rider] AS INT) AS [Mtg01_First_Change_Period_(Conversion_Rider)],
CAST([Mtg01_Prepayment_Rider] AS VARCHAR(1)) AS [Mtg01_Prepayment_Rider],
CAST([Mtg01_Prepayment_Term_Penalty_Rider] AS VARCHAR(2)) AS [Mtg01_Prepayment_Term_(Penalty_Rider)],
CAST([Mtg01_Title_Company_Name] AS VARCHAR(28)) AS [Mtg01_Title_Company_Name],
CAST([Mtg01_Lender_Name] AS VARCHAR(40)) AS [Mtg01_Lender_DBA_Name],
CAST([Mtg01_Lender_Mail_Full_Street_Address] AS VARCHAR(60)) AS [Mtg01_Lender_Mail:_Full_Street_Address],
CAST([Mtg01_Lender_Mail_Unit] AS VARCHAR(11)) AS [Mtg01_Lender_Mail:_Unit],
CAST([Mtg01_Lender_Mail_City] AS VARCHAR(30)) AS [Mtg01_Lender_Mail:_City],
CAST([Mtg01_Lender_Mail_State] AS VARCHAR(2)) AS [Mtg01_Lender_Mail:_State],
CAST([Mtg01_Lender_Mail_Zip_Code] AS VARCHAR(5)) AS [Mtg01_Lender_Mail:_Zip_Code],
CAST([Mtg01_Lender_Mail_Zip_Plus4Code] AS VARCHAR(4)) AS [Mtg01_Lender_Mail:_Zip_+4_Code],
CAST([Mtg01_Loan_Term_Months] AS INT) AS [Mtg01_Loan_Term_-_Months],
CAST([Mtg01_Loan_Term_Years] AS INT) AS [Mtg01_Loan_Term_-_Years],
CAST([Mtg01_loan_number] AS VARCHAR(20)) AS [Mtg01_Loan_Number],
CAST([Mtg01_Construction_Loan] AS VARCHAR(1)) AS [Mtg01_Construction_Loan],
CAST([Mtg01_Cash_Purchase] AS VARCHAR(1)) AS [Mtg01_Cash_Purchase],
CAST([Mtg01_StandAlone_Refi] AS VARCHAR(1)) AS [Mtg01_Stand-Alone_Refi],
CAST([Mtg01_Equity_Credit_Line] AS VARCHAR(1)) AS [Mtg01_Equity_Credit_Line],
CAST([Mtg01_Curr_Est_Bal] AS BIGINT) AS [Mtg01_Curr_Est_Bal],
CAST([Mtg01_Purpose_Of_Loan] AS VARCHAR(2)) AS [Mtg01_Purpose_of_Loan],
CAST([Mtg01_Purchase_Mtg_Ind] AS VARCHAR(1)) AS [Mtg01_Purchase_Mtg_Ind],
CAST([Mtg01_Est_Monthly_P&I] AS DECIMAL(12, 2)) AS [Mtg01_Est_Monthly_P&I],
CAST([Mtg01_Est_Monthly_Principal] AS DECIMAL(12, 2)) AS [Mtg01_Est_Monthly_Principal],
CAST([Mtg01_Est_Monthly_Interest] AS DECIMAL(12, 2)) AS [Mtg01_Est_Monthly_Interest],
CAST([Mtg01_Curr_Est_Int_Rate] AS DECIMAL(7, 5)) AS [Mtg01_Curr_Est_Int_Rate],
CAST([Mtg01_Assigned_Lender_Name] AS VARCHAR(250)) AS [Mtg01_Assigned_Lender_Name],
CAST([Mtg01_Assignment_Date] AS DATE) AS [Mtg01_Assignment_Date],
CAST([Mtg01_Number_of_Assignments] AS INT) AS [Mtg01_Number_of_Assignments],
CAST([Mtg01_PreForeclosure_Status] AS INT) AS [Mtg01_PreForeclosure_Status],
CAST([Mtg01_PreFcl_Recording_Date] AS DATE) AS [Mtg01_PreFcl_Recording_Date],
CAST([Mtg01_PreFcl_Filing_Date] AS DATE) AS [Mtg01_PreFcl_Filing_Date],
CAST([Mtg01_PreFcl_Case_Trustee_Sale_Nbr] AS VARCHAR(40)) AS [Mtg01_PreFcl_Case_Trustee_Sale_Nbr],
CAST([Mtg01_PreFcl_Auction_Date] AS DATE) AS [Mtg01_PreFcl_Auction_Date],
CAST([Mtg02_lender_name_beneficiary] AS VARCHAR(40)) AS [Mtg02_Lender_Name_(Beneficiary)],
CAST([Mtg02_lender_type] AS VARCHAR(1)) AS [Mtg02_Lender_Type],
CAST([Mtg02_original_date_of_contract] AS DATE) AS [Mtg02_Loan_Origination_Date],
CAST([Mtg02_recording_date] AS DATE) AS [Mtg02_Loan_Recording_Date],
CAST([Mtg02_Loan_Amount] AS INT) AS [Mtg02_Loan_Amount],
CAST([Mtg02_loan_type] AS VARCHAR(1)) AS [Mtg02_Loan_Type],
CAST([Mtg02_type_financing] AS VARCHAR(4)) AS [Mtg02_Type_Financing],
CAST([Mtg02_interest_rate] AS DECIMAL(7, 5)) AS [Mtg02_Interest_Rate],
CAST([Mtg02_due_date] AS DATE) AS [Mtg02_Due_Date],
CAST([Mtg02_Adjustable_Rate_Rider] AS VARCHAR(1)) AS [Mtg02_Adjustable_Rate_Rider],
CAST([Mtg02_Adjustable_Rate_Index] AS VARCHAR(15)) AS [Mtg02_Adjustable_Rate_Index],
CAST([Mtg02_Change_Index] AS DECIMAL(7, 5)) AS [Mtg02_Change_Index],
CAST([Mtg02_Rate_Change_Frequency] AS VARCHAR(1)) AS [Mtg02_Rate_Change_Frequency],
CAST([Mtg02_Interest_Rate_Not_Greater_Than] AS DECIMAL(7, 5)) AS [Mtg02_Interest_Rate_Not_Greater_Than],
CAST([Mtg02_Interest_Rate_Not_Less_Than] AS DECIMAL(7, 5)) AS [Mtg02_Interest_Rate_Not_Less_Than],
CAST([Mtg02_Maximum_Interest_Rate] AS DECIMAL(7, 5)) AS [Mtg02_Maximum_Interest_Rate],
CAST([Mtg02_Interest_Only_Period] AS VARCHAR(2)) AS [Mtg02_Interest_Only_Period],
CAST([Mtg02_fixed_step_conversion_rate_rider] AS VARCHAR(1)) AS [Mtg02_Fixed/Step_(Conversion)_Rate_Rider],
CAST([Mtg02_First_Change_Date_Year_Conversion_Rider] AS DATE) AS [Mtg02_First_Change_Date_(Conversion_Rider)],
CAST([Mtg02_First_Change_Date_Month_Day_Conversion_Rider] AS INT) AS [Mtg02_First_Change_Period_(Conversion_Rider)],
CAST([Mtg02_Prepayment_Rider] AS VARCHAR(1)) AS [Mtg02_Prepayment_Rider],
CAST([Mtg02_Prepayment_Term_Penalty_Rider] AS VARCHAR(2)) AS [Mtg02_Prepayment_Term_(Penalty_Rider)],
CAST([Mtg02_Title_Company_Name] AS VARCHAR(28)) AS [Mtg02_Title_Company_Name],
CAST([Mtg02_Lender_Name] AS VARCHAR(40)) AS [Mtg02_Lender_DBA_Name],
CAST([Mtg02_Lender_Mail_Full_Street_Address] AS VARCHAR(60)) AS [Mtg02_Lender_Mail:_Full_Street_Address],
CAST([Mtg02_Lender_Mail_Unit] AS VARCHAR(11)) AS [Mtg02_Lender_Mail:_Unit],
CAST([Mtg02_Lender_Mail_City] AS VARCHAR(30)) AS [Mtg02_Lender_Mail:_City],
CAST([Mtg02_Lender_Mail_State] AS VARCHAR(2)) AS [Mtg02_Lender_Mail:_State],
CAST([Mtg02_Lender_Mail_Zip_Code] AS VARCHAR(5)) AS [Mtg02_Lender_Mail:_Zip_Code],
CAST([Mtg02_Lender_Mail_Zip_Plus4Code] AS VARCHAR(4)) AS [Mtg02_Lender_Mail:_Zip_+4_Code],
CAST([Mtg02_Loan_Term_Months] AS INT) AS [Mtg02_Loan_Term_-_Months],
CAST([Mtg02_Loan_Term_Years] AS INT) AS [Mtg02_Loan_Term_-_Years],
CAST([Mtg02_loan_number] AS VARCHAR(20)) AS [Mtg02_Loan_Number],
CAST([Mtg02_Construction_Loan] AS VARCHAR(1)) AS [Mtg02_Construction_Loan],
CAST([Mtg02_Cash_Purchase] AS VARCHAR(1)) AS [Mtg02_Cash_Purchase],
CAST([Mtg02_StandAlone_Refi] AS VARCHAR(1)) AS [Mtg02_Stand-Alone_Refi],
CAST([Mtg02_Equity_Credit_Line] AS VARCHAR(1)) AS [Mtg02_Equity_Credit_Line],
CAST([Mtg02_Curr_Est_Bal] AS BIGINT) AS [Mtg02_Curr_Est_Bal],
CAST([Mtg02_Purpose_Of_Loan] AS VARCHAR(2)) AS [Mtg02_Purpose_of_Loan],
CAST([Mtg02_Purchase_Mtg_Ind] AS VARCHAR(1)) AS [Mtg02_Purchase_Mtg_Ind],
CAST([Mtg02_Est_Monthly_P&I] AS DECIMAL(12, 2)) AS [Mtg02_Est_Monthly_P&I],
CAST([Mtg02_Est_Monthly_Principal] AS DECIMAL(12, 2)) AS [Mtg02_Est_Monthly_Principal],
CAST([Mtg02_Est_Monthly_Interest] AS DECIMAL(12, 2)) AS [Mtg02_Est_Monthly_Interest],
CAST([Mtg02_Curr_Est_Int_Rate] AS DECIMAL(7, 5)) AS [Mtg02_Curr_Est_Int_Rate],
CAST([Mtg02_Assigned_Lender_Name] AS VARCHAR(250)) AS [Mtg02_Assigned_Lender_Name],
CAST([Mtg02_Assignment_Date] AS DATE) AS [Mtg02_Assignment_Date],
CAST([Mtg02_Number_of_Assignments] AS INT) AS [Mtg02_Number_of_Assignments],
CAST([Mtg02_PreForeclosure_Status] AS INT) AS [Mtg02_PreForeclosure_Status],
CAST([Mtg02_PreFcl_Recording_Date] AS DATE) AS [Mtg02_PreFcl_Recording_Date],
CAST([Mtg02_PreFcl_Filing_Date] AS DATE) AS [Mtg02_PreFcl_Filing_Date],
CAST([Mtg02_PreFcl_Case_Trustee_Sale_Nbr] AS VARCHAR(40)) AS [Mtg02_PreFcl_Case_Trustee_Sale_Nbr],
CAST([Mtg02_PreFcl_Auction_Date] AS DATE) AS [Mtg02_PreFcl_Auction_Date],
CAST([Mtg03_lender_name_beneficiary] AS VARCHAR(40)) AS [Mtg03_Lender_Name_(Beneficiary)],
CAST([Mtg03_lender_type] AS VARCHAR(1)) AS [Mtg03_Lender_Type],
CAST([Mtg03_original_date_of_contract] AS DATE) AS [Mtg03_Loan_Origination_Date],
CAST([Mtg03_recording_date] AS DATE) AS [Mtg03_Loan_Recording_Date],
CAST([Mtg03_Loan_Amount] AS INT) AS [Mtg03_Loan_Amount],
CAST([Mtg03_loan_type] AS VARCHAR(1)) AS [Mtg03_Loan_Type],
CAST([Mtg03_type_financing] AS VARCHAR(4)) AS [Mtg03_Type_Financing],
CAST([Mtg03_interest_rate] AS DECIMAL(7, 5)) AS [Mtg03_Interest_Rate],
CAST([Mtg03_due_date] AS DATE) AS [Mtg03_Due_Date],
CAST([Mtg03_Adjustable_Rate_Rider] AS VARCHAR(1)) AS [Mtg03_Adjustable_Rate_Rider],
CAST([Mtg03_Adjustable_Rate_Index] AS VARCHAR(15)) AS [Mtg03_Adjustable_Rate_Index],
CAST([Mtg03_Change_Index] AS DECIMAL(7, 5)) AS [Mtg03_Change_Index],
CAST([Mtg03_Rate_Change_Frequency] AS VARCHAR(1)) AS [Mtg03_Rate_Change_Frequency],
CAST([Mtg03_Interest_Rate_Not_Greater_Than] AS DECIMAL(7, 5)) AS [Mtg03_Interest_Rate_Not_Greater_Than],
CAST([Mtg03_Interest_Rate_Not_Less_Than] AS DECIMAL(7, 5)) AS [Mtg03_Interest_Rate_Not_Less_Than],
CAST([Mtg03_Maximum_Interest_Rate] AS DECIMAL(7, 5)) AS [Mtg03_Maximum_Interest_Rate],
CAST([Mtg03_Interest_Only_Period] AS VARCHAR(2)) AS [Mtg03_Interest_Only_Period],
CAST([Mtg03_fixed_step_conversion_rate_rider] AS VARCHAR(1)) AS [Mtg03_Fixed/Step_(Conversion)_Rate_Rider],
CAST([Mtg03_First_Change_Date_Year_Conversion_Rider] AS DATE) AS [Mtg03_First_Change_Date_(Conversion_Rider)],
CAST([Mtg03_First_Change_Date_Month_Day_Conversion_Rider] AS INT) AS [Mtg03_First_Change_Period_(Conversion_Rider)],
CAST([Mtg03_Prepayment_Rider] AS VARCHAR(1)) AS [Mtg03_Prepayment_Rider],
CAST([Mtg03_Prepayment_Term_Penalty_Rider] AS VARCHAR(2)) AS [Mtg03_Prepayment_Term_(Penalty_Rider)],
CAST([Mtg03_Title_Company_Name] AS VARCHAR(28)) AS [Mtg03_Title_Company_Name],
CAST([Mtg03_Lender_Name] AS VARCHAR(40)) AS [Mtg03_Lender_DBA_Name],
CAST([Mtg03_Lender_Mail_Full_Street_Address] AS VARCHAR(60)) AS [Mtg03_Lender_Mail:_Full_Street_Address],
CAST([Mtg03_Lender_Mail_Unit] AS VARCHAR(11)) AS [Mtg03_Lender_Mail:_Unit],
CAST([Mtg03_Lender_Mail_City] AS VARCHAR(30)) AS [Mtg03_Lender_Mail:_City],
CAST([Mtg03_Lender_Mail_State] AS VARCHAR(2)) AS [Mtg03_Lender_Mail:_State],
CAST([Mtg03_Lender_Mail_Zip_Code] AS VARCHAR(5)) AS [Mtg03_Lender_Mail:_Zip_Code],
CAST([Mtg03_Lender_Mail_Zip_Plus4Code] AS VARCHAR(4)) AS [Mtg03_Lender_Mail:_Zip_+4_Code],
CAST([Mtg03_Loan_Term_Months] AS INT) AS [Mtg03_Loan_Term_-_Months],
CAST([Mtg03_Loan_Term_Years] AS INT) AS [Mtg03_Loan_Term_-_Years],
CAST([Mtg03_loan_number] AS VARCHAR(20)) AS [Mtg03_Loan_Number],
CAST([Mtg03_Construction_Loan] AS VARCHAR(1)) AS [Mtg03_Construction_Loan],
CAST([Mtg03_Cash_Purchase] AS VARCHAR(1)) AS [Mtg03_Cash_Purchase],
CAST([Mtg03_StandAlone_Refi] AS VARCHAR(1)) AS [Mtg03_Stand-Alone_Refi],
CAST([Mtg03_Equity_Credit_Line] AS VARCHAR(1)) AS [Mtg03_Equity_Credit_Line],
CAST([Mtg03_Curr_Est_Bal] AS BIGINT) AS [Mtg03_Curr_Est_Bal],
CAST([Mtg03_Purpose_Of_Loan] AS VARCHAR(2)) AS [Mtg03_Purpose_of_Loan],
CAST([Mtg03_Purchase_Mtg_Ind] AS VARCHAR(1)) AS [Mtg03_Purchase_Mtg_Ind],
CAST([Mtg03_Est_Monthly_P&I] AS DECIMAL(12, 2)) AS [Mtg03_Est_Monthly_P&I],
CAST([Mtg03_Est_Monthly_Principal] AS DECIMAL(12, 2)) AS [Mtg03_Est_Monthly_Principal],
CAST([Mtg03_Est_Monthly_Interest] AS DECIMAL(12, 2)) AS [Mtg03_Est_Monthly_Interest],
CAST([Mtg03_Curr_Est_Int_Rate] AS DECIMAL(7, 5)) AS [Mtg03_Curr_Est_Int_Rate],
CAST([Mtg03_Assigned_Lender_Name] AS VARCHAR(250)) AS [Mtg03_Assigned_Lender_Name],
CAST([Mtg03_Assignment_Date] AS DATE) AS [Mtg03_Assignment_Date],
CAST([Mtg03_Number_of_Assignments] AS INT) AS [Mtg03_Number_of_Assignments],
CAST([Mtg03_PreForeclosure_Status] AS INT) AS [Mtg03_PreForeclosure_Status],
CAST([Mtg03_PreFcl_Recording_Date] AS DATE) AS [Mtg03_PreFcl_Recording_Date],
CAST([Mtg03_PreFcl_Filing_Date] AS DATE) AS [Mtg03_PreFcl_Filing_Date],
CAST([Mtg03_PreFcl_Case_Trustee_Sale_Nbr] AS VARCHAR(40)) AS [Mtg03_PreFcl_Case_Trustee_Sale_Nbr],
CAST([Mtg03_PreFcl_Auction_Date] AS DATE) AS [Mtg03_PreFcl_Auction_Date],
CAST([Mtg04_lender_name_beneficiary] AS VARCHAR(40)) AS [Mtg04_Lender_Name_(Beneficiary)],
CAST([Mtg04_lender_type] AS VARCHAR(1)) AS [Mtg04_Lender_Type],
CAST([Mtg04_original_date_of_contract] AS DATE) AS [Mtg04_Loan_Origination_Date],
CAST([Mtg04_recording_date] AS DATE) AS [Mtg04_Loan_Recording_Date],
CAST([Mtg04_Loan_Amount] AS INT) AS [Mtg04_Loan_Amount],
CAST([Mtg04_loan_type] AS VARCHAR(1)) AS [Mtg04_Loan_Type],
CAST([Mtg04_type_financing] AS VARCHAR(4)) AS [Mtg04_Type_Financing],
CAST([Mtg04_interest_rate] AS DECIMAL(7, 5)) AS [Mtg04_Interest_Rate],
CAST([Mtg04_due_date] AS DATE) AS [Mtg04_Due_Date],
CAST([Mtg04_Adjustable_Rate_Rider] AS VARCHAR(1)) AS [Mtg04_Adjustable_Rate_Rider],
CAST([Mtg04_Adjustable_Rate_Index] AS VARCHAR(15)) AS [Mtg04_Adjustable_Rate_Index],
CAST([Mtg04_Change_Index] AS DECIMAL(7, 5)) AS [Mtg04_Change_Index],
CAST([Mtg04_Rate_Change_Frequency] AS VARCHAR(1)) AS [Mtg04_Rate_Change_Frequency],
CAST([Mtg04_Interest_Rate_Not_Greater_Than] AS DECIMAL(7, 5)) AS [Mtg04_Interest_Rate_Not_Greater_Than],
CAST([Mtg04_Interest_Rate_Not_Less_Than] AS DECIMAL(7, 5)) AS [Mtg04_Interest_Rate_Not_Less_Than],
CAST([Mtg04_Maximum_Interest_Rate] AS DECIMAL(7, 5)) AS [Mtg04_Maximum_Interest_Rate],
CAST([Mtg04_Interest_Only_Period] AS VARCHAR(2)) AS [Mtg04_Interest_Only_Period],
CAST([Mtg04_fixed_step_conversion_rate_rider] AS VARCHAR(1)) AS [Mtg04_Fixed/Step_(Conversion)_Rate_Rider],
CAST([Mtg04_First_Change_Date_Year_Conversion_Rider] AS DATE) AS [Mtg04_First_Change_Date_(Conversion_Rider)],
CAST([Mtg04_First_Change_Date_Month_Day_Conversion_Rider] AS INT) AS [Mtg04_First_Change_Period_(Conversion_Rider)],
CAST([Mtg04_Prepayment_Rider] AS VARCHAR(1)) AS [Mtg04_Prepayment_Rider],
CAST([Mtg04_Prepayment_Term_Penalty_Rider] AS VARCHAR(2)) AS [Mtg04_Prepayment_Term_(Penalty_Rider)],
CAST([Mtg04_Title_Company_Name] AS VARCHAR(28)) AS [Mtg04_Title_Company_Name],
CAST([Mtg04_Lender_Name] AS VARCHAR(40)) AS [Mtg04_Lender_DBA_Name],
CAST([Mtg04_Lender_Mail_Full_Street_Address] AS VARCHAR(60)) AS [Mtg04_Lender_Mail:_Full_Street_Address],
CAST([Mtg04_Lender_Mail_Unit] AS VARCHAR(11)) AS [Mtg04_Lender_Mail:_Unit],
CAST([Mtg04_Lender_Mail_City] AS VARCHAR(30)) AS [Mtg04_Lender_Mail:_City],
CAST([Mtg04_Lender_Mail_State] AS VARCHAR(2)) AS [Mtg04_Lender_Mail:_State],
CAST([Mtg04_Lender_Mail_Zip_Code] AS VARCHAR(5)) AS [Mtg04_Lender_Mail:_Zip_Code],
CAST([Mtg04_Lender_Mail_Zip_Plus4Code] AS VARCHAR(4)) AS [Mtg04_Lender_Mail:_Zip_+4_Code],
CAST([Mtg04_Loan_Term_Months] AS INT) AS [Mtg04_Loan_Term_-_Months],
CAST([Mtg04_Loan_Term_Years] AS INT) AS [Mtg04_Loan_Term_-_Years],
CAST([Mtg04_loan_number] AS VARCHAR(20)) AS [Mtg04_Loan_Number],
CAST([Mtg04_Construction_Loan] AS VARCHAR(1)) AS [Mtg04_Construction_Loan],
CAST([Mtg04_Cash_Purchase] AS VARCHAR(1)) AS [Mtg04_Cash_Purchase],
CAST([Mtg04_StandAlone_Refi] AS VARCHAR(1)) AS [Mtg04_Stand-Alone_Refi],
CAST([Mtg04_Equity_Credit_Line] AS VARCHAR(1)) AS [Mtg04_Equity_Credit_Line],
CAST([Mtg04_Curr_Est_Bal] AS BIGINT) AS [Mtg04_Curr_Est_Bal],
CAST([Mtg04_Purpose_Of_Loan] AS VARCHAR(2)) AS [Mtg04_Purpose_of_Loan],
CAST([Mtg04_Purchase_Mtg_Ind] AS VARCHAR(1)) AS [Mtg04_Purchase_Mtg_Ind],
CAST([Mtg04_Est_Monthly_P&I] AS DECIMAL(12, 2)) AS [Mtg04_Est_Monthly_P&I],
CAST([Mtg04_Est_Monthly_Principal] AS DECIMAL(12, 2)) AS [Mtg04_Est_Monthly_Principal],
CAST([Mtg04_Est_Monthly_Interest] AS DECIMAL(12, 2)) AS [Mtg04_Est_Monthly_Interest],
CAST([Mtg04_Curr_Est_Int_Rate] AS DECIMAL(7, 5)) AS [Mtg04_Curr_Est_Int_Rate],
CAST([Mtg04_Assigned_Lender_Name] AS VARCHAR(250)) AS [Mtg04_Assigned_Lender_Name],
CAST([Mtg04_Assignment_Date] AS DATE) AS [Mtg04_Assignment_Date],
CAST([Mtg04_Number_of_Assignments] AS INT) AS [Mtg04_Number_of_Assignments],
CAST([Mtg04_PreForeclosure_Status] AS INT) AS [Mtg04_PreForeclosure_Status],
CAST([Mtg04_PreFcl_Recording_Date] AS DATE) AS [Mtg04_PreFcl_Recording_Date],
CAST([Mtg04_PreFcl_Filing_Date] AS DATE) AS [Mtg04_PreFcl_Filing_Date],
CAST([Mtg04_PreFcl_Case_Trustee_Sale_Nbr] AS VARCHAR(40)) AS [Mtg04_PreFcl_Case_Trustee_Sale_Nbr],
CAST([Mtg04_PreFcl_Auction_Date] AS DATE) AS [Mtg04_PreFcl_Auction_Date],
CAST([Additional_Open_Lien_Count] AS INT) AS [Additional_Open_Lien_Count],
CAST([Additional_Open_Lien_Balance] AS BIGINT) AS [Additional_Open_Lien_Balance],
CAST([Total_Open_Lien_Count] AS INT) AS [Total_Open_Lien_Count],
CAST([Total_Open_Lien_Balance] AS BIGINT) AS [Total_Open_Lien_Balance],
CAST([Total_Financing_History_Count] AS INT) AS [Total_Financing_History_Count],
CAST([Current_Est_LTV_Combined] AS DECIMAL(7, 4)) AS [Current_Est_LTV_Combined],
CAST([Current_Est_LTV_Range_Code] AS VARCHAR(2)) AS [Current_Est_LTV_Range_Code],
CAST([Current_Est_Equity_Dollars] AS BIGINT) AS [Current_Est_Equity_Dollars],
CAST([Current_Est_Equity_Range_Code] AS VARCHAR(2)) AS [Current_Est_Equity_Range_Code],
CAST([Purchase_LTV] AS DECIMAL(7, 4)) AS [Purchase_LTV],
CAST([Current_Foreclosure_Status] AS INT) AS [Current_Foreclosure_Status],
CAST([Foreclosure_Recording_Date] AS DATE) AS [Current_Foreclosure_Recording_Date],
CAST([Foreclosure_filing_date] AS DATE) AS [Current_Foreclosure_Filing_Date],
CAST([Foreclosure_Case_Number] AS VARCHAR(40)) AS [Current_Foreclosure_Case_Number],
CAST([Foreclosure_Auction_Date] AS DATE) AS [Current_Foreclosure_Auction_Date],
CAST([ESTIMATED_VALUE] AS INT) AS [Quantarium_Value],
CAST([PRICE_RANGE_MIN] AS INT) AS [Quantarium_Value_Low],
CAST([PRICE_RANGE_MAX] AS INT) AS [Quantarium_Value_High],
CAST([FSD_SCORE] AS INT) AS [Quantarium_Value_FSD],
CAST([CONFIDENCE_SCORE] AS INT) AS [Quantarium_Value_Confidence],
CAST([QVM_Value_Range_Code] AS VARCHAR(2)) AS [QVM_Value_Range_Code],
CAST([QVM_asof_Date] AS DATE) AS [QVM_asof_Date],
CAST([Trans_asof_Date] AS DATE) AS [Trans_asof_Date],
CAST([Record_Creation_Date] AS DATE) AS [Record_Creation_Date],
CAST([Quantarium_Version] AS VARCHAR(8)) AS [Quantarium_Version]
INTO [dbo].[Quantarium_Houseamp_WA_Select_OpenLien]
FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien_20210622]

SELECT TOP 100 *FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien]