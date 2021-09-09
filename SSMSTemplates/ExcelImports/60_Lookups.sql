USE Evan
go
IF SCHEMA_ID('Lookup') IS null
EXEC('CREATE SCHEMA [Lookup]')
GO

SELECT CONCAT('ALTER SCHEMA [Lookup] TRANSFER [dbo].[',t.name,']
GO
') AS SQL FROM sys.schemas s INNER JOIN sys.tables t ON t.schema_id = s.schema_id
WHERE s.name= 'dbo'
AND t.name IN
(
N'DiscretionaryIncomeCode',
N'MedianHseHldIncomeCode',
N'UnsecuredCreditCapacityCode',
N'DonorCapacityCode',
N'EstimatedAreaCreditRating',
N'CreditRangeNewCredit',
N'CRAIncomeClassificationCode',
N'HomeValueCode',
N'MedianHomeValueCode',
N'HomePropertyType',
N'HomePropertyTypeDetail',
N'HomeBuiltYearCode',
N'HomeSquareFootageRange',
N'HomeAirConditioning',
N'HomeSewer',
N'HomeWater',
N'HomeAssessedValue_HomePurchaseAmount',
N'HomeLoanAmount_HomeTotalLoan',
N'HomeEquityAvailableCode',
N'HomeLoanTransactionType',
N'HomeLoanType',
N'HomeLoanToValueCode',
N'OpenLien',
N'CodeXlate',
N'FipsList2',
N'GeoMatchCode',
N'GeoLocationCode',
N'IndividualLayout',
N'DemoQIDXrefLayout',
N'Landuse',
N'FieldPopulationCounts',
N'EthnicCode',
N'HispanicCountryOfOrigin',
N'EthnicGroup',
N'FIPSList',
N'ReligiousAffiliation',
N'AssimilationCode',
N'LanguagePreference',
N'OccupationIndividualRange',
N'OccupationIndividual',
N'EducationIndividual',
N'PoliticalPartyIndividual',
N'PoliticalIdeology',
N'AddressStreetPrePost',
N'TimeZoneCode',
N'MailScoreCode',
N'NumberChildren',
N'HouseholdSize',
N'BusinessOwner',
N'LengthOfResidenceCode',
N'IncomeCode',
N'NetWorthCode'
)
