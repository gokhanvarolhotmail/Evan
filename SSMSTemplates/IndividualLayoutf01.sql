USE [Evan] ;
GO
DROP TABLE IF EXISTS dbo.[Quantarium_Houseamp_WA_Select_DemoInd]

SELECT 
CAST([QId] AS BIGINT) AS [QId],
CAST([DBUSA_Household_ID] AS BIGINT) AS [Household_ID],
CAST([DBUSA_Individual_ID] AS BIGINT) AS [Individual_ID],
CAST([Location_ID] AS BIGINT) AS [Location_ID],
CAST([Full_Name] AS VARCHAR(65)) AS [Full_Name],
CAST([Name_Prefix] AS VARCHAR(2)) AS [Name_Prefix],
CAST([First_Name] AS VARCHAR(30)) AS [First_Name],
CAST([Middle_Initial] AS VARCHAR(1)) AS [Middle_Initial],
CAST([Last_Name] AS VARCHAR(30)) AS [Last_Name],
CAST([Suffix] AS VARCHAR(4)) AS [Suffix],
CAST([Gender] AS VARCHAR(1)) AS [Gender],
CAST([Date_Of_Birth_Year] AS SMALLINT) AS [Date_Of_Birth_Year],
CAST([Date_Of_Birth_Month] AS SMALLINT) AS [Date_Of_Birth_Month],
CAST([Age] AS SMALLINT) AS [Age],
CAST([Age_Code_Description] AS VARCHAR(8)) AS [Age_Code_Description],
CAST([Ethnic_Code] AS VARCHAR(3)) AS [Ethnic_Code],
CAST([Ethnic_Group] AS VARCHAR(1)) AS [Ethnic_Group],
CAST([Religious_Affiliation] AS VARCHAR(1)) AS [Religious_Affiliation],
CAST([Language_Preference] AS VARCHAR(3)) AS [Language_Preference],
CAST([Hispanic_Country_Of_Origin] AS VARCHAR(2)) AS [Hispanic_Country_Of_Origin],
CAST([Assimilation_Code] AS VARCHAR(1)) AS [Assimilation_Code],
CAST([Education_Individual] AS VARCHAR(1)) AS [Education_Individual],
CAST([Occupation_Individual] AS VARCHAR(1)) AS [Occupation_Individual],
CAST([Occupation_Individual_Range] AS VARCHAR(4)) AS [Occupation_Individual_Range],
CAST([Political_Party_Individual] AS VARCHAR(1)) AS [Political_Party_Individual],
CAST([Political_Ideology] AS VARCHAR(1)) AS [Political_Ideology],
CAST([Voter_ID] AS VARCHAR(14)) AS [Voter_ID],
CAST([Veteran_Individual] AS VARCHAR(1)) AS [Veteran_Individual],
CAST([Mail_Score_Code] AS VARCHAR(1)) AS [Mail_Score_Code],
CAST([Standardized_Address] AS VARCHAR(75)) AS [Standardized_Address],
CAST([City] AS VARCHAR(40)) AS [City],
CAST([State] AS VARCHAR(2)) AS [State],
CAST([Zip] AS VARCHAR(5)) AS [Zip],
CAST([ZIP_Plus4] AS VARCHAR(4)) AS [ZIP_Plus4],
CAST([Carrier_Route] AS VARCHAR(4)) AS [Carrier_Route],
CAST([Delivery_Point] AS VARCHAR(2)) AS [Delivery_Point],
CAST([Delivery_Point_Check_Digit] AS VARCHAR(2)) AS [Delivery_Point_Check_Digit],
CAST([Address_Street_Number] AS VARCHAR(20)) AS [Address_Street_Number],
CAST([Address_Street_Pre] AS VARCHAR(2)) AS [Address_Street_Pre],
CAST([Address_Street_Name] AS VARCHAR(50)) AS [Address_Street_Name],
CAST([Address_Street_Suffix] AS VARCHAR(5)) AS [Address_Street_Suffix],
CAST([Address_Street_Post] AS VARCHAR(2)) AS [Address_Street_Post],
CAST([Address_Suite_Name] AS VARCHAR(10)) AS [Address_Suite_Name],
CAST([Address_Suite_Number] AS VARCHAR(10)) AS [Address_Suite_Number],
CAST([Line_Of_Travel] AS VARCHAR(5)) AS [Line_Of_Travel],
CAST([GeoCode_Match_Level] AS VARCHAR(12)) AS [GeoCode_Match_Level],
CAST([Latitude] AS VARCHAR(20)) AS [Latitude],
CAST([Longitude] AS VARCHAR(20)) AS [Longitude],
CAST([Time_Zone_Code] AS VARCHAR(2)) AS [Time_Zone_Code],
CAST([Time_Zone_Description] AS VARCHAR(15)) AS [Time_Zone_Description],
CAST([Census_Tract] AS VARCHAR(6)) AS [Census_Tract],
CAST([Census_Block] AS VARCHAR(4)) AS [Census_Block],
CAST([County_Code] AS VARCHAR(3)) AS [County_Code],
CAST([County_Name] AS VARCHAR(25)) AS [County_Name],
CAST([FIPS_Code] AS VARCHAR(5)) AS [FIPS_Code],
CAST([CBSA_Code] AS VARCHAR(5)) AS [CBSA_Code],
CAST([CBSA_Description] AS VARCHAR(50)) AS [CBSA_Description],
CAST([Walk_Sequence] AS VARCHAR(4)) AS [Walk_Sequence],
CAST([District_Congressional] AS VARCHAR(2)) AS [District_Congressional],
CAST([District_State_Senate] AS VARCHAR(50)) AS [District_State_Senate],
CAST([District_State_House] AS VARCHAR(50)) AS [District_State_House],
CAST([District_State_Legislative] AS VARCHAR(50)) AS [District_State_Legislative],
CAST([DMA_Code] AS VARCHAR(3)) AS [DMA_Code],
CAST([DMA_Zone] AS VARCHAR(50)) AS [DMA_Zone],
CAST([Email_Present] AS VARCHAR(1)) AS [Email_Present],
CAST([Email] AS VARCHAR(100)) AS [Email],
CAST([Email_02] AS VARCHAR(100)) AS [Email_02],
CAST([Email_03] AS VARCHAR(100)) AS [Email_03],
CAST([Email_04] AS VARCHAR(100)) AS [Email_04],
CAST([Email_05] AS VARCHAR(100)) AS [Email_05],
CAST([Area_Code] AS VARCHAR(3)) AS [Area_Code],
CAST([Phone] AS VARCHAR(10)) AS [Phone],
CAST([DNC] AS VARCHAR(1)) AS [DNC],
CAST([Scrubbed_Phoneable] AS VARCHAR(1)) AS [Scrubbed_Phoneable],
CAST([Area_Code_Cell_Phone] AS VARCHAR(3)) AS [Area_Code_Cell_Phone],
CAST([Cell_Phone] AS VARCHAR(10)) AS [Cell_Phone],
CAST([Dwelling_Type] AS VARCHAR(1)) AS [Dwelling_Type],
CAST([Home_Owner_Renter] AS VARCHAR(1)) AS [Home_Owner_Renter],
CAST([Length_Of_Residence] AS SMALLINT) AS [Length_Of_Residence],
CAST([Length_of_Residence_Code] AS VARCHAR(1)) AS [Length_of_Residence_Code],
CAST([Length_Of_Residence_Description] AS VARCHAR(16)) AS [Length_Of_Residence_Description],
CAST([Recently_Moved_Flag] AS VARCHAR(1)) AS [Recently_Moved_Flag],
CAST([Recently_Moved_Year] AS SMALLINT) AS [Recently_Moved_Year],
CAST([Recently_Moved_Month] AS SMALLINT) AS [Recently_Moved_Month],
CAST([Household_Size] AS SMALLINT) AS [Household_Size],
CAST([Household_Rank] AS SMALLINT) AS [Household_Rank],
CAST([Number_Of_Adults] AS SMALLINT) AS [Number_Of_Adults],
CAST([Young_Adult_In_Household] AS VARCHAR(1)) AS [Young_Adult_In_Household],
CAST([Senior_Adult_In_Household] AS VARCHAR(1)) AS [Senior_Adult_In_Household],
CAST([Generations_In_Household] AS SMALLINT) AS [Generations_In_Household],
CAST([Marital_Status] AS VARCHAR(1)) AS [Marital_Status],
CAST([Recent_Divorce] AS VARCHAR(1)) AS [Recent_Divorce],
CAST([Single_Parent] AS VARCHAR(1)) AS [Single_Parent],
CAST([Children_Present] AS VARCHAR(1)) AS [Children_Present],
CAST([Number_Children] AS SMALLINT) AS [Number_Children],
CAST([Childrens_Age_00_02] AS VARCHAR(1)) AS [Childrens_Age_00_02],
CAST([Childrens_Age_00_02_Male] AS VARCHAR(1)) AS [Childrens_Age_00_02_Male],
CAST([Childrens_Age_00_02_Female] AS VARCHAR(1)) AS [Childrens_Age_00_02_Female],
CAST([Childrens_Age_00_02_Unknown] AS VARCHAR(1)) AS [Childrens_Age_00_02_Unknown],
CAST([Childrens_Age_03_05] AS VARCHAR(1)) AS [Childrens_Age_03_05],
CAST([Childrens_Age_03_05_Male] AS VARCHAR(1)) AS [Childrens_Age_03_05_Male],
CAST([Childrens_Age_03_05_Female] AS VARCHAR(1)) AS [Childrens_Age_03_05_Female],
CAST([Childrens_Age_03_05_Unknown] AS VARCHAR(1)) AS [Childrens_Age_03_05_Unknown],
CAST([Childrens_Age_06_10] AS VARCHAR(1)) AS [Childrens_Age_06_10],
CAST([Childrens_Age_06_10_Male] AS VARCHAR(1)) AS [Childrens_Age_06_10_Male],
CAST([Childrens_Age_06_10_Female] AS VARCHAR(1)) AS [Childrens_Age_06_10_Female],
CAST([Childrens_Age_06_10_Unknown] AS VARCHAR(1)) AS [Childrens_Age_06_10_Unknown],
CAST([Childrens_Age_11_15] AS VARCHAR(1)) AS [Childrens_Age_11_15],
CAST([Childrens_Age_11_15_Male] AS VARCHAR(1)) AS [Childrens_Age_11_15_Male],
CAST([Childrens_Age_11_15_Female] AS VARCHAR(1)) AS [Childrens_Age_11_15_Female],
CAST([Childrens_Age_11_15_Unknown] AS VARCHAR(1)) AS [Childrens_Age_11_15_Unknown],
CAST([Childrens_Age_16_17] AS VARCHAR(1)) AS [Childrens_Age_16_17],
CAST([Childrens_Age_16_17_Male] AS VARCHAR(1)) AS [Childrens_Age_16_17_Male],
CAST([Childrens_Age_16_17_Female] AS VARCHAR(1)) AS [Childrens_Age_16_17_Female],
CAST([Childrens_Age_16_17_Unknown] AS VARCHAR(1)) AS [Childrens_Age_16_17_Unknown],
CAST([Child_Near_High_School_Graduation] AS VARCHAR(1)) AS [Child_Near_High_School_Graduation],
CAST([College_Graduate] AS VARCHAR(1)) AS [College_Graduate],
CAST([Christian_Families] AS VARCHAR(1)) AS [Christian_Families],
CAST([Business_Owner] AS VARCHAR(1)) AS [Business_Owner],
CAST([SOHO] AS VARCHAR(1)) AS [SOHO],
CAST([Working_Woman] AS VARCHAR(1)) AS [Working_Woman],
CAST([Veteran_Present_In_Household] AS VARCHAR(1)) AS [Veteran_Present_In_Household],
CAST([Credit_Card_User] AS VARCHAR(1)) AS [Credit_Card_User],
CAST([Mail_Order_Donor] AS VARCHAR(1)) AS [Mail_Order_Donor],
CAST([Mail_Order_Buyer] AS VARCHAR(1)) AS [Mail_Order_Buyer],
CAST([Mail_Order_Responder] AS VARCHAR(1)) AS [Mail_Order_Responder],
CAST([TV_Satellite_Dish] AS VARCHAR(1)) AS [TV_Satellite_Dish],
CAST([Pet_Owner] AS VARCHAR(1)) AS [Pet_Owner],
CAST([Cat_Owner] AS VARCHAR(1)) AS [Cat_Owner],
CAST([Dog_Owner] AS VARCHAR(1)) AS [Dog_Owner],
CAST([Other_Pet_Owner] AS VARCHAR(1)) AS [Other_Pet_Owner],
CAST([New_Teen_Driver] AS VARCHAR(1)) AS [New_Teen_Driver],
CAST([New_Teen_Driver_Gender] AS VARCHAR(1)) AS [New_Teen_Driver_Gender],
CAST([Boat_Owner] AS VARCHAR(1)) AS [Boat_Owner],
CAST([Truck_Owner] AS VARCHAR(1)) AS [Truck_Owner],
CAST([Motorcycle_Owner] AS VARCHAR(1)) AS [Motorcycle_Owner],
CAST([RV_Owner] AS VARCHAR(1)) AS [RV_Owner],
CAST([Auto_Buy_New] AS VARCHAR(1)) AS [Auto_Buy_New],
CAST([Auto_Buy_Used] AS VARCHAR(1)) AS [Auto_Buy_Used],
CAST([Auto_Buy_Used_5_Months_Or_Less] AS VARCHAR(1)) AS [Auto_Buy_Used_5_Months_Or_Less],
CAST([Auto_Buy_Used_6_Months_Or_More] AS VARCHAR(1)) AS [Auto_Buy_Used_6_Months_Or_More],
CAST([Median_HseHld_Income] AS INT) AS [Median_HseHld_Income],
CAST([Median_HseHld_Income_Code] AS VARCHAR(1)) AS [Median_HseHld_Income_Code],
CAST([Median_HseHld_Income_Description] AS VARCHAR(20)) AS [Median_HseHld_Income_Description],
CAST([Income] AS BIGINT) AS [Income],
CAST([Income_Code] AS VARCHAR(1)) AS [Income_Code],
CAST([Income_Description] AS VARCHAR(24)) AS [Income_Description],
CAST([NetWorth] AS INT) AS [NetWorth],
CAST([NetWorth_Code] AS VARCHAR(1)) AS [NetWorth_Code],
CAST([NetWorth_Description] AS VARCHAR(22)) AS [NetWorth_Description],
CAST([Millionaire] AS VARCHAR(1)) AS [Millionaire],
CAST([Unsecured_Credit_Capacity] AS INT) AS [Unsecured_Credit_Capacity],
CAST([Unsecured_Credit_Capacity_Code] AS VARCHAR(1)) AS [Unsecured_Credit_Capacity_Code],
CAST([Unsecured_Credit_Capacity_Description] AS VARCHAR(18)) AS [Unsecured_Credit_Capacity_Description],
CAST([Discretionary_Income] AS INT) AS [Discretionary_Income],
CAST([Discretionary_Income_Code] AS VARCHAR(1)) AS [Discretionary_Income_Code],
CAST([Discretionary_Income_Description] AS VARCHAR(20)) AS [Discretionary_Income_Description],
CAST([Donor_Capacity] AS INT) AS [Donor_Capacity],
CAST([Donor_Capacity_Code] AS VARCHAR(1)) AS [Donor_Capacity_Code],
CAST([Donor_Capacity_Description] AS VARCHAR(16)) AS [Donor_Capacity_Description],
CAST([Investment_Properties_Owned] AS SMALLINT) AS [Investment_Properties_Owned],
CAST([Estimated_Area_Credit_Rating] AS VARCHAR(1)) AS [Estimated_Area_Credit_Rating],
CAST([CRA_Income_Classification_Code] AS VARCHAR(1)) AS [CRA_Income_Classification_Code],
CAST([Credit_Range_New_Credit] AS VARCHAR(1)) AS [Credit_Range_New_Credit],
CAST([Lines_Of_Credit] AS SMALLINT) AS [Lines_Of_Credit],
CAST([Home_Property_Type] AS VARCHAR(1)) AS [Home_Property_Type],
CAST([Home_Property_Type_Detail] AS VARCHAR(1)) AS [Home_Property_Type_Detail],
CAST([Home_Value] AS BIGINT) AS [Home_Value],
CAST([Home_Value_Code] AS VARCHAR(1)) AS [Home_Value_Code],
CAST([Home_Value_Description] AS VARCHAR(24)) AS [Home_Value_Description],
CAST([Median_Home_Value] AS INT) AS [Median_Home_Value],
CAST([Median_Home_Value_Code] AS VARCHAR(1)) AS [Median_Home_Value_Code],
CAST([Median_Home_Value_Description] AS VARCHAR(20)) AS [Median_Home_Value_Description],
CAST([Home_Built_Year] AS SMALLINT) AS [Home_Built_Year],
CAST([Home_Built_Year_Code] AS VARCHAR(1)) AS [Home_Built_Year_Code],
CAST([Home_Built_Year_Description] AS VARCHAR(12)) AS [Home_Built_Year_Description],
CAST([Home_Square_Footage] AS INT) AS [Home_Square_Footage],
CAST([Home_Square_Footage_Range] AS VARCHAR(1)) AS [Home_Square_Footage_Range],
CAST([Land_Square_Footage] AS BIGINT) AS [Land_Square_Footage],
CAST([Number_Of_Bedrooms] AS SMALLINT) AS [Number_Of_Bedrooms],
CAST([Number_Of_Bathrooms] AS SMALLINT) AS [Number_Of_Bathrooms],
CAST([Home_Air_Conditioning] AS VARCHAR(1)) AS [Home_Air_Conditioning],
CAST([Home_Swimming_Pool] AS VARCHAR(1)) AS [Home_Swimming_Pool],
CAST([Home_Sewer] AS VARCHAR(1)) AS [Home_Sewer],
CAST([Home_Water] AS VARCHAR(1)) AS [Home_Water],
CAST([Recent_Home_Buyer] AS VARCHAR(1)) AS [Recent_Home_Buyer],
CAST([Recent_Mortgage_Borrower] AS VARCHAR(1)) AS [Recent_Mortgage_Borrower],
CAST([New_Home_Owner_Flag] AS VARCHAR(1)) AS [New_Home_Owner_Flag],
CAST([Most_Recent_Home_Purchase_Date_Flag] AS VARCHAR(1)) AS [Most_Recent_Home_Purchase_Date_Flag],
CAST([Home_Purchase_Date] AS VARCHAR(6)) AS [Home_Purchase_Date],
CAST([Home_Purchase_Year] AS SMALLINT) AS [Home_Purchase_Year],
CAST([Home_Purchase_Amount] AS VARCHAR(1)) AS [Home_Purchase_Amount],
CAST([Home_Assessed_Value] AS VARCHAR(1)) AS [Home_Assessed_Value],
CAST([Home_Total_Loan] AS VARCHAR(1)) AS [Home_Total_Loan],
CAST([Home_Loan_Date_1_Year] AS SMALLINT) AS [Home_Loan_Date_1_Year],
CAST([Home_Loan_Date_1_Month] AS SMALLINT) AS [Home_Loan_Date_1_Month],
CAST([Home_Loan_Date_2_Year] AS SMALLINT) AS [Home_Loan_Date_2_Year],
CAST([Home_Loan_Date_2_Month] AS SMALLINT) AS [Home_Loan_Date_2_Month],
CAST([Home_Loan_Date_3_Year] AS SMALLINT) AS [Home_Loan_Date_3_Year],
CAST([Home_Loan_Date_3_Month] AS SMALLINT) AS [Home_Loan_Date_3_Month],
CAST([Home_Loan_Amount_1] AS VARCHAR(1)) AS [Home_Loan_Amount_1],
CAST([Home_Loan_Amount_2] AS VARCHAR(1)) AS [Home_Loan_Amount_2],
CAST([Home_Loan_Amount_3] AS VARCHAR(1)) AS [Home_Loan_Amount_3],
CAST([Home_Loan_Type_1] AS VARCHAR(1)) AS [Home_Loan_Type_1],
CAST([Home_Loan_Type_2] AS VARCHAR(1)) AS [Home_Loan_Type_2],
CAST([Home_Loan_Type_3] AS VARCHAR(1)) AS [Home_Loan_Type_3],
CAST([Home_Loan_Interest_Rate_1] AS VARCHAR(6)) AS [Home_Loan_Interest_Rate_1],
CAST([Home_Loan_Interest_Rate_2] AS VARCHAR(6)) AS [Home_Loan_Interest_Rate_2],
CAST([Home_Loan_Interest_Rate_3] AS VARCHAR(6)) AS [Home_Loan_Interest_Rate_3],
CAST([Home_Loan_Interest_Rate_Type_1] AS VARCHAR(1)) AS [Home_Loan_Interest_Rate_Type_1],
CAST([Home_Loan_Interest_Rate_Type_2] AS VARCHAR(1)) AS [Home_Loan_Interest_Rate_Type_2],
CAST([Home_Loan_Interest_Rate_Type_3] AS VARCHAR(1)) AS [Home_Loan_Interest_Rate_Type_3],
CAST([Home_Loan_Transaction_Type_1] AS VARCHAR(1)) AS [Home_Loan_Transaction_Type_1],
CAST([Home_Loan_Transaction_Type_2] AS VARCHAR(1)) AS [Home_Loan_Transaction_Type_2],
CAST([Home_Loan_Transaction_Type_3] AS VARCHAR(1)) AS [Home_Loan_Transaction_Type_3],
CAST([Home_Loan_Lender_Name_1] AS VARCHAR(150)) AS [Home_Loan_Lender_Name_1],
CAST([Home_Loan_Lender_Name_2] AS VARCHAR(150)) AS [Home_Loan_Lender_Name_2],
CAST([Home_Loan_Lender_Name_3] AS VARCHAR(150)) AS [Home_Loan_Lender_Name_3],
CAST([Home_Loan_To_Value_Code] AS VARCHAR(1)) AS [Home_Loan_To_Value_Code],
CAST([Home_Equity_Available_Code] AS VARCHAR(1)) AS [Home_Equity_Available_Code],
CAST([Home_Equity_Available_Description] AS VARCHAR(25)) AS [Home_Equity_Available_Description],
CAST([Donor_Charitable] AS VARCHAR(1)) AS [Donor_Charitable],
CAST([Donor_Animal_Welfare] AS VARCHAR(1)) AS [Donor_Animal_Welfare],
CAST([Donor_Arts_Cultural] AS VARCHAR(1)) AS [Donor_Arts_Cultural],
CAST([Donor_Childrens] AS VARCHAR(1)) AS [Donor_Childrens],
CAST([Donor_Environment_Wildlife] AS VARCHAR(1)) AS [Donor_Environment_Wildlife],
CAST([Donor_Health] AS VARCHAR(1)) AS [Donor_Health],
CAST([Donor_International_Aid] AS VARCHAR(1)) AS [Donor_International_Aid],
CAST([Donor_Political] AS VARCHAR(1)) AS [Donor_Political],
CAST([Donor_Political_Conservative] AS VARCHAR(1)) AS [Donor_Political_Conservative],
CAST([Donor_Political_Liberal] AS VARCHAR(1)) AS [Donor_Political_Liberal],
CAST([Donor_Religious] AS VARCHAR(1)) AS [Donor_Religious],
CAST([Donor_Veterans] AS VARCHAR(1)) AS [Donor_Veterans],
CAST([CC_American_Express] AS VARCHAR(1)) AS [CC_American_Express],
CAST([CC_American_Express_Gold_Platinum] AS VARCHAR(1)) AS [CC_American_Express_Gold_Platinum],
CAST([CC_Discover] AS VARCHAR(1)) AS [CC_Discover],
CAST([CC_Visa] AS VARCHAR(1)) AS [CC_Visa],
CAST([CC_Mastercard] AS VARCHAR(1)) AS [CC_Mastercard],
CAST([CC_Bank] AS VARCHAR(1)) AS [CC_Bank],
CAST([CC_Gas_Dept_Retail] AS VARCHAR(1)) AS [CC_Gas_Dept_Retail],
CAST([CC_Travel_Entertainment] AS VARCHAR(1)) AS [CC_Travel_Entertainment],
CAST([CC_Unknown] AS VARCHAR(1)) AS [CC_Unknown],
CAST([CC_Gold_Platinum] AS VARCHAR(1)) AS [CC_Gold_Platinum],
CAST([CC_Premium] AS VARCHAR(1)) AS [CC_Premium],
CAST([CC_Upscale_Dept] AS VARCHAR(1)) AS [CC_Upscale_Dept],
CAST([CC_New_Issue] AS VARCHAR(1)) AS [CC_New_Issue],
CAST([Home_Living] AS VARCHAR(1)) AS [Home_Living],
CAST([DIY_Living] AS VARCHAR(1)) AS [DIY_Living],
CAST([Sporty_Living] AS VARCHAR(1)) AS [Sporty_Living],
CAST([Upscale_Living] AS VARCHAR(1)) AS [Upscale_Living],
CAST([Cultural_Artistic_Living] AS VARCHAR(1)) AS [Cultural_Artistic_Living],
CAST([Highbrow] AS VARCHAR(1)) AS [Highbrow],
CAST([Common_Living] AS VARCHAR(1)) AS [Common_Living],
CAST([Professional_Living] AS VARCHAR(1)) AS [Professional_Living],
CAST([Broader_Living] AS VARCHAR(1)) AS [Broader_Living],
CAST([Arts] AS VARCHAR(1)) AS [Arts],
CAST([Theater_Performing_Arts] AS VARCHAR(1)) AS [Theater_Performing_Arts],
CAST([Food_Wines] AS VARCHAR(1)) AS [Food_Wines],
CAST([Foods_Natural] AS VARCHAR(1)) AS [Foods_Natural],
CAST([Cooking_General] AS VARCHAR(1)) AS [Cooking_General],
CAST([Cooking_Gourmet] AS VARCHAR(1)) AS [Cooking_Gourmet],
CAST([Aviation] AS VARCHAR(1)) AS [Aviation],
CAST([Auto_Work] AS VARCHAR(1)) AS [Auto_Work],
CAST([Automotive_Buff] AS VARCHAR(1)) AS [Automotive_Buff],
CAST([Beauty_Cosmetics] AS VARCHAR(1)) AS [Beauty_Cosmetics],
CAST([Career] AS VARCHAR(1)) AS [Career],
CAST([Career_Improvement] AS VARCHAR(1)) AS [Career_Improvement],
CAST([Parenting] AS VARCHAR(1)) AS [Parenting],
CAST([Childrens_Interests] AS VARCHAR(1)) AS [Childrens_Interests],
CAST([Grandchildren] AS VARCHAR(1)) AS [Grandchildren],
CAST([Community_Charities] AS VARCHAR(1)) AS [Community_Charities],
CAST([Religious_Inspirational] AS VARCHAR(1)) AS [Religious_Inspirational],
CAST([Crafts] AS VARCHAR(1)) AS [Crafts],
CAST([Photography] AS VARCHAR(1)) AS [Photography],
CAST([Sewing_Knitting_Needlework] AS VARCHAR(1)) AS [Sewing_Knitting_Needlework],
CAST([Collector_Avid] AS VARCHAR(1)) AS [Collector_Avid],
CAST([Collectibles_Grouping] AS VARCHAR(1)) AS [Collectibles_Grouping],
CAST([Collectibles_General] AS VARCHAR(1)) AS [Collectibles_General],
CAST([Collectibles_Stamps] AS VARCHAR(1)) AS [Collectibles_Stamps],
CAST([Collectibles_Coins] AS VARCHAR(1)) AS [Collectibles_Coins],
CAST([Collectibles_Arts] AS VARCHAR(1)) AS [Collectibles_Arts],
CAST([Collectibles_Antiques] AS VARCHAR(1)) AS [Collectibles_Antiques],
CAST([Collectibles_Sports_Memorabilia] AS VARCHAR(1)) AS [Collectibles_Sports_Memorabilia],
CAST([Education_Online] AS VARCHAR(1)) AS [Education_Online],
CAST([Exercise_Aerobic] AS VARCHAR(1)) AS [Exercise_Aerobic],
CAST([Exercise_Running_Jogging] AS VARCHAR(1)) AS [Exercise_Running_Jogging],
CAST([Exercise_Walking] AS VARCHAR(1)) AS [Exercise_Walking],
CAST([High_Tech_General] AS VARCHAR(1)) AS [High_Tech_General],
CAST([Games_Computer_Games] AS VARCHAR(1)) AS [Games_Computer_Games],
CAST([Games_Video_Games] AS VARCHAR(1)) AS [Games_Video_Games],
CAST([Games_Board_Puzzles] AS VARCHAR(1)) AS [Games_Board_Puzzles],
CAST([Gaming_Casino] AS VARCHAR(1)) AS [Gaming_Casino],
CAST([Consumer_Electronics] AS VARCHAR(1)) AS [Consumer_Electronics],
CAST([Environmental_Issues] AS VARCHAR(1)) AS [Environmental_Issues],
CAST([Gardening] AS VARCHAR(1)) AS [Gardening],
CAST([Home_Furnishings_Decorating] AS VARCHAR(1)) AS [Home_Furnishings_Decorating],
CAST([House_Plant] AS VARCHAR(1)) AS [House_Plant],
CAST([Home_Improvement_Grouping] AS VARCHAR(1)) AS [Home_Improvement_Grouping],
CAST([Home_Improvement] AS VARCHAR(1)) AS [Home_Improvement],
CAST([Home_Improvement_DIY] AS VARCHAR(1)) AS [Home_Improvement_DIY],
CAST([Health_Medical] AS VARCHAR(1)) AS [Health_Medical],
CAST([Dieting_Weight_Loss] AS VARCHAR(1)) AS [Dieting_Weight_Loss],
CAST([Self_Improvement] AS VARCHAR(1)) AS [Self_Improvement],
CAST([Investments_Grouping] AS VARCHAR(1)) AS [Investments_Grouping],
CAST([Investments_Foreign] AS VARCHAR(1)) AS [Investments_Foreign],
CAST([Investments_Personal] AS VARCHAR(1)) AS [Investments_Personal],
CAST([Investments_Real_Estate] AS VARCHAR(1)) AS [Investments_Real_Estate],
CAST([Investments_Stocks_Bonds] AS VARCHAR(1)) AS [Investments_Stocks_Bonds],
CAST([Money_Seekers] AS VARCHAR(1)) AS [Money_Seekers],
CAST([Sweepstakes_Contests] AS VARCHAR(1)) AS [Sweepstakes_Contests],
CAST([Music_Home_Stereo] AS VARCHAR(1)) AS [Music_Home_Stereo],
CAST([Music_Player] AS VARCHAR(1)) AS [Music_Player],
CAST([Music_Collector] AS VARCHAR(1)) AS [Music_Collector],
CAST([Music_Listener] AS VARCHAR(1)) AS [Music_Listener],
CAST([Movie_Grouping] AS VARCHAR(1)) AS [Movie_Grouping],
CAST([Movie_Music_General] AS VARCHAR(1)) AS [Movie_Music_General],
CAST([Movie_Collector] AS VARCHAR(1)) AS [Movie_Collector],
CAST([Reading_General] AS VARCHAR(1)) AS [Reading_General],
CAST([Reading_Audio_Books] AS VARCHAR(1)) AS [Reading_Audio_Books],
CAST([Reading_Magazines] AS VARCHAR(1)) AS [Reading_Magazines],
CAST([Reading_Religious_Inspirational] AS VARCHAR(1)) AS [Reading_Religious_Inspirational],
CAST([Reading_Science_Fiction] AS VARCHAR(1)) AS [Reading_Science_Fiction],
CAST([Reading_Financial_Newsletter_Subscribers] AS VARCHAR(1)) AS [Reading_Financial_Newsletter_Subscribers],
CAST([Current_Affairs_Politics] AS VARCHAR(1)) AS [Current_Affairs_Politics],
CAST([History_Military] AS VARCHAR(1)) AS [History_Military],
CAST([Outdoor_Grouping] AS VARCHAR(1)) AS [Outdoor_Grouping],
CAST([Outdoor_Enthusiast_General] AS VARCHAR(1)) AS [Outdoor_Enthusiast_General],
CAST([Outdoor_Fishing] AS VARCHAR(1)) AS [Outdoor_Fishing],
CAST([Outdoor_Boating_Sailing] AS VARCHAR(1)) AS [Outdoor_Boating_Sailing],
CAST([Outdoor_Camping_Hiking] AS VARCHAR(1)) AS [Outdoor_Camping_Hiking],
CAST([Outdoor_Hunting_Shooting] AS VARCHAR(1)) AS [Outdoor_Hunting_Shooting],
CAST([Outdoor_Scuba_Diving] AS VARCHAR(1)) AS [Outdoor_Scuba_Diving],
CAST([Spectator_Sports_Grouping] AS VARCHAR(1)) AS [Spectator_Sports_Grouping],
CAST([Spectator_Sports_General] AS VARCHAR(1)) AS [Spectator_Sports_General],
CAST([Spectator_Sports_Baseball] AS VARCHAR(1)) AS [Spectator_Sports_Baseball],
CAST([Spectator_Sports_Basketball] AS VARCHAR(1)) AS [Spectator_Sports_Basketball],
CAST([Spectator_Sports_Football] AS VARCHAR(1)) AS [Spectator_Sports_Football],
CAST([Spectator_Sports_Hockey] AS VARCHAR(1)) AS [Spectator_Sports_Hockey],
CAST([Spectator_Sports_Racing] AS VARCHAR(1)) AS [Spectator_Sports_Racing],
CAST([Spectator_Sports_Soccer] AS VARCHAR(1)) AS [Spectator_Sports_Soccer],
CAST([Spectator_Sports_TV_Sports] AS VARCHAR(1)) AS [Spectator_Sports_TV_Sports],
CAST([Spectator_NASCAR] AS VARCHAR(1)) AS [Spectator_NASCAR],
CAST([Smoking_Tobacco] AS VARCHAR(1)) AS [Smoking_Tobacco],
CAST([Sports_Grouping] AS VARCHAR(1)) AS [Sports_Grouping],
CAST([Sports_Equestrian] AS VARCHAR(1)) AS [Sports_Equestrian],
CAST([Sports_Golf] AS VARCHAR(1)) AS [Sports_Golf],
CAST([Sports_Motorcycling] AS VARCHAR(1)) AS [Sports_Motorcycling],
CAST([Sports_Skiing] AS VARCHAR(1)) AS [Sports_Skiing],
CAST([Sports_Tennis] AS VARCHAR(1)) AS [Sports_Tennis],
CAST([Travel_Grouping] AS VARCHAR(1)) AS [Travel_Grouping],
CAST([Travel_Cruises] AS VARCHAR(1)) AS [Travel_Cruises],
CAST([Travel_Domestic] AS VARCHAR(1)) AS [Travel_Domestic],
CAST([Travel_International] AS VARCHAR(1)) AS [Travel_International],
CAST([Travel_RV] AS VARCHAR(1)) AS [Travel_RV],
CAST([Science_Space] AS VARCHAR(1)) AS [Science_Space],
CAST([Woodworking] AS VARCHAR(1)) AS [Woodworking],
CAST([Buyer_Books] AS VARCHAR(1)) AS [Buyer_Books],
CAST([Buyer_Crafts_Hobbies] AS VARCHAR(1)) AS [Buyer_Crafts_Hobbies],
CAST([Buyer_Gardening_Farming] AS VARCHAR(1)) AS [Buyer_Gardening_Farming],
CAST([Buyer_Jewelry] AS VARCHAR(1)) AS [Buyer_Jewelry],
CAST([Buyer_Luggage] AS VARCHAR(1)) AS [Buyer_Luggage],
CAST([Buyer_Online] AS VARCHAR(1)) AS [Buyer_Online],
CAST([Buyer_Membership_Club] AS VARCHAR(1)) AS [Buyer_Membership_Club],
CAST([Buyer_Merchandise_Male] AS VARCHAR(1)) AS [Buyer_Merchandise_Male],
CAST([Buyer_Merchandise_Female] AS VARCHAR(1)) AS [Buyer_Merchandise_Female],
CAST([Buyer_Health_Beauty] AS VARCHAR(1)) AS [Buyer_Health_Beauty],
CAST([Buyer_Childrens_Babycare] AS VARCHAR(1)) AS [Buyer_Childrens_Babycare],
CAST([Buyer_Childrens_Learning_Toys] AS VARCHAR(1)) AS [Buyer_Childrens_Learning_Toys],
CAST([Buyer_Childrens_Back_To_School] AS VARCHAR(1)) AS [Buyer_Childrens_Back_To_School],
CAST([Apparel_Childrens] AS VARCHAR(1)) AS [Apparel_Childrens],
CAST([Apparel_Infant_Toddlers] AS VARCHAR(1)) AS [Apparel_Infant_Toddlers],
CAST([Apparel_Womens] AS VARCHAR(1)) AS [Apparel_Womens],
CAST([Apparel_Womens_Petite] AS VARCHAR(1)) AS [Apparel_Womens_Petite],
CAST([Apparel_Womens_Plus_Size] AS VARCHAR(1)) AS [Apparel_Womens_Plus_Size],
CAST([Apparel_Womens_Young] AS VARCHAR(1)) AS [Apparel_Womens_Young],
CAST([Apparel_Mens] AS VARCHAR(1)) AS [Apparel_Mens],
CAST([Apparel_Mens_Big_Tall] AS VARCHAR(1)) AS [Apparel_Mens_Big_Tall],
CAST([Apparel_Mens_Young] AS VARCHAR(1)) AS [Apparel_Mens_Young],
CAST([Auto_Parts_Accessories] AS VARCHAR(1)) AS [Auto_Parts_Accessories],
CAST([Military_Memorabilia_Weapons] AS VARCHAR(1)) AS [Military_Memorabilia_Weapons],
CAST([Musical_Instruments] AS VARCHAR(1)) AS [Musical_Instruments],
CAST([Photography_Video_Equipment] AS VARCHAR(1)) AS [Photography_Video_Equipment],
CAST([Sports_Leisure] AS VARCHAR(1)) AS [Sports_Leisure],
CAST([Value_Hunter] AS VARCHAR(1)) AS [Value_Hunter],
CAST([Last_Update_Date] AS DATE) AS [Last_Update_Date],
CAST([Source_Data] AS VARCHAR(15)) AS [Source_Data],
CAST([Production_Date] AS DATE) AS [Production_Date]
INTO dbo.[Quantarium_Houseamp_WA_Select_DemoInd]
FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoInd_20210622]
GO

SELECT TOP 100 * FROM dbo.[Quantarium_Houseamp_WA_Select_DemoInd]