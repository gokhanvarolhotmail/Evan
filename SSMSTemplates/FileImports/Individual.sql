USE [Evan] ;
GO
DECLARE
    @TableName NVARCHAR(MAX) = N'Quantarium_Houseamp_WA_Select_DemoInd_20210622'
  , @Distinct  BIT           = 1 ;

SET @TableName = PARSENAME(@TableName, 1) ;

DECLARE
    @SQL      NVARCHAR(MAX)
  , @BCP      VARCHAR(4000)
  , @RowCount BIGINT
  , @Return   INT ;

DROP TABLE IF EXISTS [#cols] ;

SELECT *
INTO [#cols]
FROM [Util].[dbo].ParseDelimited(
         'QId	DBUSA_Household_ID	DBUSA_Individual_ID	Location_ID	Full_Name	Name_Prefix	First_Name	Middle_Initial	Last_Name	Suffix	Gender	Date_Of_Birth_Year	Date_Of_Birth_Month	Age	Age_Code_Description	Ethnic_Code	Ethnic_Group	Religious_Affiliation	Language_Preference	Hispanic_Country_Of_Origin	Assimilation_Code	Education_Individual	Occupation_Individual	Occupation_Individual_Range	Political_Party_Individual	Political_Ideology	Voter_ID	Veteran_Individual	Mail_Score_Code	Standardized_Address	City	State	Zip	ZIP_Plus4	Carrier_Route	Delivery_Point	Delivery_Point_Check_Digit	Address_Street_Number	Address_Street_Pre	Address_Street_Name	Address_Street_Suffix	Address_Street_Post	Address_Suite_Name	Address_Suite_Number	Line_Of_Travel	GeoCode_Match_Level	Latitude	Longitude	Time_Zone_Code	Time_Zone_Description	Census_Tract	Census_Block	County_Code	County_Name	FIPS_Code	CBSA_Code	CBSA_Description	Walk_Sequence	District_Congressional	District_State_Senate	District_State_House	District_State_Legislative	DMA_Code	DMA_Zone	Email_Present	Email	Email_02	Email_03	Email_04	Email_05	Area_Code	Phone	DNC	Scrubbed_Phoneable	Area_Code_Cell_Phone	Cell_Phone	Dwelling_Type	Home_Owner_Renter	Length_Of_Residence	Length_of_Residence_Code	Length_Of_Residence_Description	Recently_Moved_Flag	Recently_Moved_Year	Recently_Moved_Month	Household_Size	Household_Rank	Number_Of_Adults	Young_Adult_In_Household	Senior_Adult_In_Household	Generations_In_Household	Marital_Status	Recent_Divorce	Single_Parent	Children_Present	Number_Children	Childrens_Age_00_02	Childrens_Age_00_02_Male	Childrens_Age_00_02_Female	Childrens_Age_00_02_Unknown	Childrens_Age_03_05	Childrens_Age_03_05_Male	Childrens_Age_03_05_Female	Childrens_Age_03_05_Unknown	Childrens_Age_06_10	Childrens_Age_06_10_Male	Childrens_Age_06_10_Female	Childrens_Age_06_10_Unknown	Childrens_Age_11_15	Childrens_Age_11_15_Male	Childrens_Age_11_15_Female	Childrens_Age_11_15_Unknown	Childrens_Age_16_17	Childrens_Age_16_17_Male	Childrens_Age_16_17_Female	Childrens_Age_16_17_Unknown	Child_Near_High_School_Graduation	College_Graduate	Christian_Families	Business_Owner	SOHO	Working_Woman	Veteran_Present_In_Household	Credit_Card_User	Mail_Order_Donor	Mail_Order_Buyer	Mail_Order_Responder	TV_Satellite_Dish	Pet_Owner	Cat_Owner	Dog_Owner	Other_Pet_Owner	New_Teen_Driver	New_Teen_Driver_Gender	Boat_Owner	Truck_Owner	Motorcycle_Owner	RV_Owner	Auto_Buy_New	Auto_Buy_Used	Auto_Buy_Used_5_Months_Or_Less	Auto_Buy_Used_6_Months_Or_More	Median_HseHld_Income	Median_HseHld_Income_Code	Median_HseHld_Income_Description	Income	Income_Code	Income_Description	NetWorth	NetWorth_Code	NetWorth_Description	Millionaire	Unsecured_Credit_Capacity	Unsecured_Credit_Capacity_Code	Unsecured_Credit_Capacity_Description	Discretionary_Income	Discretionary_Income_Code	Discretionary_Income_Description	Donor_Capacity	Donor_Capacity_Code	Donor_Capacity_Description	Investment_Properties_Owned	Estimated_Area_Credit_Rating	CRA_Income_Classification_Code	Credit_Range_New_Credit	Lines_Of_Credit	Home_Property_Type	Home_Property_Type_Detail	Home_Value	Home_Value_Code	Home_Value_Description	Median_Home_Value	Median_Home_Value_Code	Median_Home_Value_Description	Home_Built_Year	Home_Built_Year_Code	Home_Built_Year_Description	Home_Square_Footage	Home_Square_Footage_Range	Land_Square_Footage	Number_Of_Bedrooms	Number_Of_Bathrooms	Home_Air_Conditioning	Home_Swimming_Pool	Home_Sewer	Home_Water	Recent_Home_Buyer	Recent_Mortgage_Borrower	New_Home_Owner_Flag	Most_Recent_Home_Purchase_Date_Flag	Home_Purchase_Date	Home_Purchase_Year	Home_Purchase_Amount	Home_Assessed_Value	Home_Total_Loan	Home_Loan_Date_1_Year	Home_Loan_Date_1_Month	Home_Loan_Date_2_Year	Home_Loan_Date_2_Month	Home_Loan_Date_3_Year	Home_Loan_Date_3_Month	Home_Loan_Amount_1	Home_Loan_Amount_2	Home_Loan_Amount_3	Home_Loan_Type_1	Home_Loan_Type_2	Home_Loan_Type_3	Home_Loan_Interest_Rate_1	Home_Loan_Interest_Rate_2	Home_Loan_Interest_Rate_3	Home_Loan_Interest_Rate_Type_1	Home_Loan_Interest_Rate_Type_2	Home_Loan_Interest_Rate_Type_3	Home_Loan_Transaction_Type_1	Home_Loan_Transaction_Type_2	Home_Loan_Transaction_Type_3	Home_Loan_Lender_Name_1	Home_Loan_Lender_Name_2	Home_Loan_Lender_Name_3	Home_Loan_To_Value_Code	Home_Equity_Available_Code	Home_Equity_Available_Description	Donor_Charitable	Donor_Animal_Welfare	Donor_Arts_Cultural	Donor_Childrens	Donor_Environment_Wildlife	Donor_Health	Donor_International_Aid	Donor_Political	Donor_Political_Conservative	Donor_Political_Liberal	Donor_Religious	Donor_Veterans	CC_American_Express	CC_American_Express_Gold_Platinum	CC_Discover	CC_Visa	CC_Mastercard	CC_Bank	CC_Gas_Dept_Retail	CC_Travel_Entertainment	CC_Unknown	CC_Gold_Platinum	CC_Premium	CC_Upscale_Dept	CC_New_Issue	Home_Living	DIY_Living	Sporty_Living	Upscale_Living	Cultural_Artistic_Living	Highbrow	Common_Living	Professional_Living	Broader_Living	Arts	Theater_Performing_Arts	Food_Wines	Foods_Natural	Cooking_General	Cooking_Gourmet	Aviation	Auto_Work	Automotive_Buff	Beauty_Cosmetics	Career	Career_Improvement	Parenting	Childrens_Interests	Grandchildren	Community_Charities	Religious_Inspirational	Crafts	Photography	Sewing_Knitting_Needlework	Collector_Avid	Collectibles_Grouping	Collectibles_General	Collectibles_Stamps	Collectibles_Coins	Collectibles_Arts	Collectibles_Antiques	Collectibles_Sports_Memorabilia	Education_Online	Exercise_Aerobic	Exercise_Running_Jogging	Exercise_Walking	High_Tech_General	Games_Computer_Games	Games_Video_Games	Games_Board_Puzzles	Gaming_Casino	Consumer_Electronics	Environmental_Issues	Gardening	Home_Furnishings_Decorating	House_Plant	Home_Improvement_Grouping	Home_Improvement	Home_Improvement_DIY	Health_Medical	Dieting_Weight_Loss	Self_Improvement	Investments_Grouping	Investments_Foreign	Investments_Personal	Investments_Real_Estate	Investments_Stocks_Bonds	Money_Seekers	Sweepstakes_Contests	Music_Home_Stereo	Music_Player	Music_Collector	Music_Listener	Movie_Grouping	Movie_Music_General	Movie_Collector	Reading_General	Reading_Audio_Books	Reading_Magazines	Reading_Religious_Inspirational	Reading_Science_Fiction	Reading_Financial_Newsletter_Subscribers	Current_Affairs_Politics	History_Military	Outdoor_Grouping	Outdoor_Enthusiast_General	Outdoor_Fishing	Outdoor_Boating_Sailing	Outdoor_Camping_Hiking	Outdoor_Hunting_Shooting	Outdoor_Scuba_Diving	Spectator_Sports_Grouping	Spectator_Sports_General	Spectator_Sports_Baseball	Spectator_Sports_Basketball	Spectator_Sports_Football	Spectator_Sports_Hockey	Spectator_Sports_Racing	Spectator_Sports_Soccer	Spectator_Sports_TV_Sports	Spectator_NASCAR	Smoking_Tobacco	Sports_Grouping	Sports_Equestrian	Sports_Golf	Sports_Motorcycling	Sports_Skiing	Sports_Tennis	Travel_Grouping	Travel_Cruises	Travel_Domestic	Travel_International	Travel_RV	Science_Space	Woodworking	Buyer_Books	Buyer_Crafts_Hobbies	Buyer_Gardening_Farming	Buyer_Jewelry	Buyer_Luggage	Buyer_Online	Buyer_Membership_Club	Buyer_Merchandise_Male	Buyer_Merchandise_Female	Buyer_Health_Beauty	Buyer_Childrens_Babycare	Buyer_Childrens_Learning_Toys	Buyer_Childrens_Back_To_School	Apparel_Childrens	Apparel_Infant_Toddlers	Apparel_Womens	Apparel_Womens_Petite	Apparel_Womens_Plus_Size	Apparel_Womens_Young	Apparel_Mens	Apparel_Mens_Big_Tall	Apparel_Mens_Young	Auto_Parts_Accessories	Military_Memorabilia_Weapons	Musical_Instruments	Photography_Video_Equipment	Sports_Leisure	Value_Hunter	Last_Update_Date	Source_Data	Production_Date' , '	') ;

SELECT @SQL = CONCAT('DROP TABLE IF EXISTS [dbo].[', @TableName, ']
CREATE TABLE [dbo].[', @TableName, '](
	', STRING_AGG(CONCAT(CAST(QUOTENAME([Field]) AS VARCHAR(MAX)), ' VARCHAR(8000)'), ',
	')WITHIN GROUP(ORDER BY [FieldNum]), '
)')
FROM [#cols] ;

SELECT @SQL AS [SQL] ;

EXEC( @SQL ) ;

SET @BCP = CONCAT('bcp "[Evan].[dbo].[', @TableName, ']" format nul -c -x -f C:\Evan\Individual.xml -t"', CHAR(9), '" -S 192.168.1.19 -U gvarol -P C@n@n6132') ;

SELECT @BCP AS [BCP] ;

EXEC @Return = [sys].[xp_cmdshell] @BCP ;

SET @SQL = CONCAT(CAST(NULL AS NVARCHAR(MAX)), 'CREATE OR ALTER VIEW [dbo].[v', @TableName, ']
AS
SELECT
   [DataFile].*
FROM
	OPENROWSET(BULK ''C:\Evan\', @TableName, '.txt'',
	FORMATFILE = ''C:\Evan\Individual.xml'',
	FIRSTROW = 2) AS [DataFile];
') ;

SELECT @SQL AS [SQL] ;

EXEC( @SQL ) ;

--SET @BCP = CONCAT('bcp "[Evan].[dbo].[', @TableName, ']" in "C:\Evan\', @TableName, '.txt" -F 2 -c -t \t -S 192.168.1.19 -a 65535 -U gvarol -P C@n@n6132') ;

--SELECT @BCP AS [BCP] ;

--EXEC @Return = [sys].[xp_cmdshell] @BCP ;

--IF @Return <> 0
--    THROW 50000, 'Bulk Insert Failed!', 1 ;
SELECT @SQL = CONCAT('DROP TABLE IF EXISTS [dbo].[', @TableName, ']

SELECT', CASE WHEN @Distinct = 1 THEN ' DISTINCT' END, '
	', STRING_AGG(REPLACE([v].[Casted], '[Column]', QUOTENAME([c].[Field])), ',
	'), '
INTO [dbo].[', @TableName, ']
FROM(
SELECT
	', STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), 'CASE WHEN TRIM([', [c].[Field], ']) IN ('''',''NULL'') THEN NULL ELSE TRIM([', [c].[Field], ']) END AS [', [c].[Field], ']'), ',
	')WITHIN GROUP(ORDER BY [c].[FieldNum]), '
FROM [dbo].[v', @TableName, '] )[k]

SET @RowCount = @@ROWCOUNT

CREATE CLUSTERED COLUMNSTORE INDEX [CCI] ON [dbo].[', @TableName, ']

CREATE UNIQUE NONCLUSTERED INDEX [QId] ON [', @TableName, '] ([QId]) WITH (DATA_COMPRESSION = ROW)
')
FROM [#cols] AS [c]
FULL OUTER JOIN [Definition].[vIndividual] AS [v] ON [v].[Field #] = [c].[FieldNum] ;

SELECT @SQL AS [SQL] ;

EXEC [sys].[sp_executesql] @SQL, N'@RowCount BIGINT OUTPUT', @RowCount OUTPUT ;

SELECT
    @TableName AS [TableName]
  , @RowCount AS [RowCount] ;
GO

RETURN ;

