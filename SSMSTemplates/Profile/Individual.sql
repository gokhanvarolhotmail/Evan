USE Evan
GO
--CREATE SCHEMA [Profile]
RETURN

--DROP TABLE [tempdb].[dbo].[Profile]
SELECT CONCAT('SELECT ',STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), QUOTENAME(REPLACE(name,'''',''''''))),', ') WITHIN GROUP(ORDER BY NAME), ' FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoInd_20210622]') FROM sys.[dm_exec_describe_first_result_set]('SELECT * FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoInd_20210622]',NULL,NULL)
WHERE collation_name <> ''
GO
--DROP TABLE IF EXISTS [tempdb].[dbo].[Profile]
EXEC [dbo].[sp_AdvancedProfile]
    @ObjectName = NULL
  , @IncludeObjectLikeCommaDelimited = NULL
  , @ExcludeObjectLikeCommaDelimited = NULL
  , @SQLToProfile = 'SELECT [Address_Street_Name], [Address_Street_Number], [Address_Street_Post], [Address_Street_Pre], [Address_Street_Suffix], [Address_Suite_Name], [Address_Suite_Number], [Age_Code_Description], [Apparel_Childrens], [Apparel_Infant_Toddlers], [Apparel_Mens], [Apparel_Mens_Big_Tall], [Apparel_Mens_Young], [Apparel_Womens], [Apparel_Womens_Petite], [Apparel_Womens_Plus_Size], [Apparel_Womens_Young], [Area_Code], [Area_Code_Cell_Phone], [Arts], [Assimilation_Code], [Auto_Buy_New], [Auto_Buy_Used], [Auto_Buy_Used_5_Months_Or_Less], [Auto_Buy_Used_6_Months_Or_More], [Auto_Parts_Accessories], [Auto_Work], [Automotive_Buff], [Aviation], [Beauty_Cosmetics], [Boat_Owner], [Broader_Living], [Business_Owner], [Buyer_Books], [Buyer_Childrens_Babycare], [Buyer_Childrens_Back_To_School], [Buyer_Childrens_Learning_Toys], [Buyer_Crafts_Hobbies], [Buyer_Gardening_Farming], [Buyer_Health_Beauty], [Buyer_Jewelry], [Buyer_Luggage], [Buyer_Membership_Club], [Buyer_Merchandise_Female], [Buyer_Merchandise_Male], [Buyer_Online], [Career], [Career_Improvement], [Carrier_Route], [Cat_Owner], [CBSA_Code], [CBSA_Description], [CC_American_Express], [CC_American_Express_Gold_Platinum], [CC_Bank], [CC_Discover], [CC_Gas_Dept_Retail], [CC_Gold_Platinum], [CC_Mastercard], [CC_New_Issue], [CC_Premium], [CC_Travel_Entertainment], [CC_Unknown], [CC_Upscale_Dept], [CC_Visa], [Cell_Phone], [Census_Block], [Census_Tract], [Child_Near_High_School_Graduation], [Children_Present], [Childrens_Age_00_02], [Childrens_Age_00_02_Female], [Childrens_Age_00_02_Male], [Childrens_Age_00_02_Unknown], [Childrens_Age_03_05], [Childrens_Age_03_05_Female], [Childrens_Age_03_05_Male], [Childrens_Age_03_05_Unknown], [Childrens_Age_06_10], [Childrens_Age_06_10_Female], [Childrens_Age_06_10_Male], [Childrens_Age_06_10_Unknown], [Childrens_Age_11_15], [Childrens_Age_11_15_Female], [Childrens_Age_11_15_Male], [Childrens_Age_11_15_Unknown], [Childrens_Age_16_17], [Childrens_Age_16_17_Female], [Childrens_Age_16_17_Male], [Childrens_Age_16_17_Unknown], [Childrens_Interests], [Christian_Families], [City], [Collectibles_Antiques], [Collectibles_Arts], [Collectibles_Coins], [Collectibles_General], [Collectibles_Grouping], [Collectibles_Sports_Memorabilia], [Collectibles_Stamps], [Collector_Avid], [College_Graduate], [Common_Living], [Community_Charities], [Consumer_Electronics], [Cooking_General], [Cooking_Gourmet], [County_Code], [County_Name], [CRA_Income_Classification_Code], [Crafts], [Credit_Card_User], [Credit_Range_New_Credit], [Cultural_Artistic_Living], [Current_Affairs_Politics], [Delivery_Point], [Delivery_Point_Check_Digit], [Dieting_Weight_Loss], [Discretionary_Income_Code], [Discretionary_Income_Description], [District_Congressional], [District_State_House], [District_State_Legislative], [District_State_Senate], [DIY_Living], [DMA_Code], [DMA_Zone], [DNC], [Dog_Owner], [Donor_Animal_Welfare], [Donor_Arts_Cultural], [Donor_Capacity_Code], [Donor_Capacity_Description], [Donor_Charitable], [Donor_Childrens], [Donor_Environment_Wildlife], [Donor_Health], [Donor_International_Aid], [Donor_Political], [Donor_Political_Conservative], [Donor_Political_Liberal], [Donor_Religious], [Donor_Veterans], [Dwelling_Type], [Education_Individual], [Education_Online], [Email], [Email_02], [Email_03], [Email_04], [Email_05], [Email_Present], [Environmental_Issues], [Estimated_Area_Credit_Rating], [Ethnic_Code], [Ethnic_Group], [Exercise_Aerobic], [Exercise_Running_Jogging], [Exercise_Walking], [FIPS_Code], [First_Name], [Food_Wines], [Foods_Natural], [Full_Name], [Games_Board_Puzzles], [Games_Computer_Games], [Games_Video_Games], [Gaming_Casino], [Gardening], [Gender], [GeoCode_Match_Level], [Grandchildren], [Health_Medical], [High_Tech_General], [Highbrow], [Hispanic_Country_Of_Origin], [History_Military], [Home_Air_Conditioning], [Home_Assessed_Value], [Home_Built_Year_Code], [Home_Built_Year_Description], [Home_Equity_Available_Code], [Home_Equity_Available_Description], [Home_Furnishings_Decorating], [Home_Improvement], [Home_Improvement_DIY], [Home_Improvement_Grouping], [Home_Living], [Home_Loan_Amount_1], [Home_Loan_Amount_2], [Home_Loan_Amount_3], [Home_Loan_Interest_Rate_1], [Home_Loan_Interest_Rate_2], [Home_Loan_Interest_Rate_3], [Home_Loan_Interest_Rate_Type_1], [Home_Loan_Interest_Rate_Type_2], [Home_Loan_Interest_Rate_Type_3], [Home_Loan_Lender_Name_1], [Home_Loan_Lender_Name_2], [Home_Loan_Lender_Name_3], [Home_Loan_To_Value_Code], [Home_Loan_Transaction_Type_1], [Home_Loan_Transaction_Type_2], [Home_Loan_Transaction_Type_3], [Home_Loan_Type_1], [Home_Loan_Type_2], [Home_Loan_Type_3], [Home_Owner_Renter], [Home_Property_Type], [Home_Property_Type_Detail], [Home_Purchase_Amount], [Home_Purchase_Date], [Home_Sewer], [Home_Square_Footage_Range], [Home_Swimming_Pool], [Home_Total_Loan], [Home_Value_Code], [Home_Value_Description], [Home_Water], [House_Plant], [Income_Code], [Income_Description], [Investments_Foreign], [Investments_Grouping], [Investments_Personal], [Investments_Real_Estate], [Investments_Stocks_Bonds], [Language_Preference], [Last_Name], [Latitude], [Length_of_Residence_Code], [Length_Of_Residence_Description], [Line_Of_Travel], [Longitude], [Mail_Order_Buyer], [Mail_Order_Donor], [Mail_Order_Responder], [Mail_Score_Code], [Marital_Status], [Median_Home_Value_Code], [Median_Home_Value_Description], [Median_HseHld_Income_Code], [Median_HseHld_Income_Description], [Middle_Initial], [Military_Memorabilia_Weapons], [Millionaire], [Money_Seekers], [Most_Recent_Home_Purchase_Date_Flag], [Motorcycle_Owner], [Movie_Collector], [Movie_Grouping], [Movie_Music_General], [Music_Collector], [Music_Home_Stereo], [Music_Listener], [Music_Player], [Musical_Instruments], [Name_Prefix], [NetWorth_Code], [NetWorth_Description], [New_Home_Owner_Flag], [New_Teen_Driver], [New_Teen_Driver_Gender], [Occupation_Individual], [Occupation_Individual_Range], [Other_Pet_Owner], [Outdoor_Boating_Sailing], [Outdoor_Camping_Hiking], [Outdoor_Enthusiast_General], [Outdoor_Fishing], [Outdoor_Grouping], [Outdoor_Hunting_Shooting], [Outdoor_Scuba_Diving], [Parenting], [Pet_Owner], [Phone], [Photography], [Photography_Video_Equipment], [Political_Ideology], [Political_Party_Individual], [Professional_Living], [Reading_Audio_Books], [Reading_Financial_Newsletter_Subscribers], [Reading_General], [Reading_Magazines], [Reading_Religious_Inspirational], [Reading_Science_Fiction], [Recent_Divorce], [Recent_Home_Buyer], [Recent_Mortgage_Borrower], [Recently_Moved_Flag], [Religious_Affiliation], [Religious_Inspirational], [RV_Owner], [Science_Space], [Scrubbed_Phoneable], [Self_Improvement], [Senior_Adult_In_Household], [Sewing_Knitting_Needlework], [Single_Parent], [Smoking_Tobacco], [SOHO], [Source_Data], [Spectator_NASCAR], [Spectator_Sports_Baseball], [Spectator_Sports_Basketball], [Spectator_Sports_Football], [Spectator_Sports_General], [Spectator_Sports_Grouping], [Spectator_Sports_Hockey], [Spectator_Sports_Racing], [Spectator_Sports_Soccer], [Spectator_Sports_TV_Sports], [Sports_Equestrian], [Sports_Golf], [Sports_Grouping], [Sports_Leisure], [Sports_Motorcycling], [Sports_Skiing], [Sports_Tennis], [Sporty_Living], [Standardized_Address], [State], [Suffix], [Sweepstakes_Contests], [Theater_Performing_Arts], [Time_Zone_Code], [Time_Zone_Description], [Travel_Cruises], [Travel_Domestic], [Travel_Grouping], [Travel_International], [Travel_RV], [Truck_Owner], [TV_Satellite_Dish], [Unsecured_Credit_Capacity_Code], [Unsecured_Credit_Capacity_Description], [Upscale_Living], [Value_Hunter], [Veteran_Individual], [Veteran_Present_In_Household], [Voter_ID], [Walk_Sequence], [Woodworking], [Working_Woman], [Young_Adult_In_Household], [Zip], [ZIP_Plus4] FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoInd_20210622]'
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
-- DROP TABLE IF EXISTS [Profile].[Individual]
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
  INTO [Profile].[Individual]
FROM [tempdb].[dbo].[Profile] [t] WITH( NOLOCK )
WHERE  ([t].[Num+Null+Blank%] = 100 OR [t].[Int+Null+Blank%] = 100 OR [t].[Date+Null+Blank] = 100 OR [t].[YNTF+Null+Blank] = 100)
  AND columndef LIKE '%char%'



go
;WITH a AS (
SELECT CASE WHEN [t].[Date+Null+Blank%] = 100 THEN 'DATE' WHEN [t].[YNTF+Null+Blank%] = 100 THEN 'BIT' WHEN [t].[Date+Null+Blank%] = 100 THEN 'BIGINT'
WHEN [t].[Num+Null+Blank%] = 100 THEN 'REAL'
END AS NewDataType,*
FROM [Profile].[Individual]  t
)
UPDATE d SET d.[Data Type]= NewDataType
FROM definition.[Individual] d INNER JOIN a ON a.[Column] = d.[Field Name]
