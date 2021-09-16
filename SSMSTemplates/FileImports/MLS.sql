USE [Evan] ;
GO
DECLARE
    @TableName NVARCHAR(MAX) = N'Houseamp_WA_MLS_20210415-20210913'
  , @Distinct  BIT           = 0
  , @Top       BIGINT        = NULL ;

SET @TableName = PARSENAME(@TableName, 1) ;

DECLARE
    @SQL                      NVARCHAR(MAX)
  , @BCP                      VARCHAR(4000)
  , @RowCount                 BIGINT
  , @Return                   INT
  , @Ignore_RECORD_ID_NOTNULL BIT = 1 ;

SELECT @SQL = CONCAT('DROP TABLE IF EXISTS [dbo].[', @TableName, ']
CREATE TABLE [dbo].[', @TableName, '](
	', STRING_AGG(CONCAT(CAST(QUOTENAME([ColumnName]) AS VARCHAR(MAX)), ' VARCHAR(8000)'), ',
	')WITHIN GROUP(ORDER BY [Field #]), '
)')
FROM [Definition].[vMLS] ;

SELECT @SQL AS [SQL] ;

EXEC( @SQL ) ;

SET @BCP = CONCAT('bcp "[Evan].[dbo].[', @TableName, ']" format nul -c -x -f C:\Evan\MLS.xml -t"', CHAR(9), '" -S 192.168.1.19 -U gvarol -P C@n@n6132') ;

SELECT @BCP AS [BCP] ;

EXEC @Return = [sys].[xp_cmdshell] @BCP ;

SET @SQL = CONCAT('DROP VIEW IF EXISTS [dbo].[v', @TableName, ']') ;

SELECT @SQL AS [SQL] ;

EXEC( @SQL ) ;

SET @SQL =
    CONCAT(
        CAST(NULL AS NVARCHAR(MAX)), 'CREATE OR ALTER VIEW [dbo].[v', @TableName, ']
AS
SELECT
   [DataFile].*
FROM
	OPENROWSET(BULK ''C:\Evan\'
      , @TableName, '.txt'',
	FORMATFILE = ''C:\Evan\MLS.xml'',
	FIRSTROW = 2) AS [DataFile]
'
      , CASE WHEN @Ignore_RECORD_ID_NOTNULL = 1 THEN
                 'WHERE TRY_CAST([RECORD_ID] AS BIGINT) IS NOT NULL
AND ([ad_county_fips] IN ('''', ''NULL'') OR TRY_CAST([ad_county_fips] AS BIGINT) IS NOT NULL)
AND ([ad_map_precision] IN ('''', ''NULL'') OR TRY_CAST([ad_map_precision] AS BIGINT) IS NOT NULL)
AND ([ad_street_number] IN ('''', ''NULL'') OR TRY_CAST([ad_street_number] AS BIGINT) IS NOT NULL)
AND ([ag_mask] IN ('''', ''NULL'') OR TRY_CAST([ag_mask] AS BIGINT) IS NOT NULL)
AND ([ex_lot_size_square_feet] IN ('''', ''NULL'') OR TRY_CAST([ex_lot_size_square_feet] AS BIGINT) IS NOT NULL)
AND ([ex_parking_spaces] IN ('''', ''NULL'') OR TRY_CAST([ex_parking_spaces] AS BIGINT) IS NOT NULL)
AND ([ex_parking_spaces_total] IN ('''', ''NULL'') OR TRY_CAST([ex_parking_spaces_total] AS BIGINT) IS NOT NULL)
AND ([fi_tax_period] IN ('''', ''NULL'') OR TRY_CAST([fi_tax_period] AS BIGINT) IS NOT NULL)
AND ([in_adom] IN ('''', ''NULL'') OR TRY_CAST([in_adom] AS BIGINT) IS NOT NULL)
AND ([in_association_period] IN ('''', ''NULL'') OR TRY_CAST([in_association_period] AS BIGINT) IS NOT NULL)
AND ([in_display_mask] IN ('''', ''NULL'') OR TRY_CAST([in_display_mask] AS BIGINT) IS NOT NULL)
AND ([in_image_count] IN ('''', ''NULL'') OR TRY_CAST([in_image_count] AS BIGINT) IS NOT NULL)
AND ([in_lease_period] IN ('''', ''NULL'') OR TRY_CAST([in_lease_period] AS BIGINT) IS NOT NULL)
AND ([in_lease_term] IN ('''', ''NULL'') OR TRY_CAST([in_lease_term] AS BIGINT) IS NOT NULL)
AND ([in_option_mask] IN ('''', ''NULL'') OR TRY_CAST([in_option_mask] AS BIGINT) IS NOT NULL)
AND ([fi_tax_year] IN ('''', ''NULL'') OR TRY_CAST([fi_tax_year] AS BIGINT) IS NOT NULL)
AND ([in_total_number_of_buildings] IN ('''', ''NULL'') OR TRY_CAST([in_total_number_of_buildings] AS BIGINT) IS NOT NULL)
AND ([in_year_remodeled] IN ('''', ''NULL'') OR TRY_CAST([in_year_remodeled] AS BIGINT) IS NOT NULL)
AND ([in_association_period2] IN ('''', ''NULL'') OR TRY_CAST([in_association_period2] AS BIGINT) IS NOT NULL)
AND ([in_HERS_rating] IN ('''', ''NULL'') OR TRY_CAST([in_HERS_rating] AS BIGINT) IS NOT NULL)
AND ([ex_carport_spaces] IN ('''', ''NULL'') OR TRY_CAST([ex_carport_spaces] AS BIGINT) IS NOT NULL)
AND ([ex_garage_remotes] IN ('''', ''NULL'') OR TRY_CAST([ex_garage_remotes] AS BIGINT) IS NOT NULL)
AND ([ex_garage_spaces] IN ('''', ''NULL'') OR TRY_CAST([ex_garage_spaces] AS BIGINT) IS NOT NULL)
AND ([if_fireplace_number] IN ('''', ''NULL'') OR TRY_CAST([if_fireplace_number] AS BIGINT) IS NOT NULL)
AND ([if_number_ceiling_fans] IN ('''', ''NULL'') OR TRY_CAST([if_number_ceiling_fans] AS BIGINT) IS NOT NULL)
AND ([in_living_square_feet] IN ('''', ''NULL'') OR TRY_CAST([in_living_square_feet] AS BIGINT) IS NOT NULL)
AND ([in_total_units_in_complex] IN ('''', ''NULL'') OR TRY_CAST([in_total_units_in_complex] AS BIGINT) IS NOT NULL)
AND ([in_year_built] IN ('''', ''NULL'') OR TRY_CAST([in_year_built] AS BIGINT) IS NOT NULL)
AND ([land_lease_term] IN ('''', ''NULL'') OR TRY_CAST([land_lease_term] AS BIGINT) IS NOT NULL)
AND ([rm_baths_full] IN ('''', ''NULL'') OR TRY_CAST([rm_baths_full] AS BIGINT) IS NOT NULL)
AND ([rm_baths_half] IN ('''', ''NULL'') OR TRY_CAST([rm_baths_half] AS BIGINT) IS NOT NULL)
AND ([rm_baths_quarter] IN ('''', ''NULL'') OR TRY_CAST([rm_baths_quarter] AS BIGINT) IS NOT NULL)
AND ([rm_baths_three_quarter] IN ('''', ''NULL'') OR TRY_CAST([rm_baths_three_quarter] AS BIGINT) IS NOT NULL)
AND ([rm_bedrooms_total] IN ('''', ''NULL'') OR TRY_CAST([rm_bedrooms_total] AS BIGINT) IS NOT NULL)
AND ([rm_rooms_total] IN ('''', ''NULL'') OR TRY_CAST([rm_rooms_total] AS BIGINT) IS NOT NULL)
AND ([rm_walk_in_closets] IN ('''', ''NULL'') OR TRY_CAST([rm_walk_in_closets] AS BIGINT) IS NOT NULL)
AND ([in_range_high_living_square_feet] IN ('''', ''NULL'') OR TRY_CAST([in_range_high_living_square_feet] AS BIGINT) IS NOT NULL)
AND ([in_range_low_living_square_feet] IN ('''', ''NULL'') OR TRY_CAST([in_range_low_living_square_feet] AS BIGINT) IS NOT NULL)
AND ([in_aproximate_above_ground_square_feet] IN ('''', ''NULL'') OR TRY_CAST([in_aproximate_above_ground_square_feet] AS BIGINT) IS NOT NULL)
AND ([in_aproximate_below_ground_square_feet] IN ('''', ''NULL'') OR TRY_CAST([in_aproximate_below_ground_square_feet] AS BIGINT) IS NOT NULL)
AND ([in_aproximate_finished_square_feet] IN ('''', ''NULL'') OR TRY_CAST([in_aproximate_finished_square_feet] AS BIGINT) IS NOT NULL)
AND ([in_aproximate_unfinished_square_feet] IN ('''', ''NULL'') OR TRY_CAST([in_aproximate_unfinished_square_feet] AS BIGINT) IS NOT NULL)
AND ([in_basement_Square_Feet_range_high] IN ('''', ''NULL'') OR TRY_CAST([in_basement_Square_Feet_range_high] AS BIGINT) IS NOT NULL)
AND ([in_basement_Square_Feet_range_low] IN ('''', ''NULL'') OR TRY_CAST([in_basement_Square_Feet_range_low] AS BIGINT) IS NOT NULL)
AND ([in_basement_unheated_Square_Feet_range_high] IN ('''', ''NULL'') OR TRY_CAST([in_basement_unheated_Square_Feet_range_high] AS BIGINT) IS NOT NULL)
AND ([in_basement_unheated_Square_Feet_range_low] IN ('''', ''NULL'') OR TRY_CAST([in_basement_unheated_Square_Feet_range_low] AS BIGINT) IS NOT NULL)
AND ([in_lower_level_Square_Feet_range_high] IN ('''', ''NULL'') OR TRY_CAST([in_lower_level_Square_Feet_range_high] AS BIGINT) IS NOT NULL)
AND ([in_lower_level_Square_Feet_range_low] IN ('''', ''NULL'') OR TRY_CAST([in_lower_level_Square_Feet_range_low] AS BIGINT) IS NOT NULL)
AND ([in_lower_level_unheated_Square_Feet_range_high] IN ('''', ''NULL'') OR TRY_CAST([in_lower_level_unheated_Square_Feet_range_high] AS BIGINT) IS NOT NULL)
AND ([in_lower_level_unheated_Square_Feet_range_low] IN ('''', ''NULL'') OR TRY_CAST([in_lower_level_unheated_Square_Feet_range_low] AS BIGINT) IS NOT NULL)
AND ([in_main_level_Square_feet_range_high] IN ('''', ''NULL'') OR TRY_CAST([in_main_level_Square_feet_range_high] AS BIGINT) IS NOT NULL)
AND ([in_main_level_Square_feet_range_low] IN ('''', ''NULL'') OR TRY_CAST([in_main_level_Square_feet_range_low] AS BIGINT) IS NOT NULL)
AND ([in_main_level_unheated_Square_feet_range_high] IN ('''', ''NULL'') OR TRY_CAST([in_main_level_unheated_Square_feet_range_high] AS BIGINT) IS NOT NULL)
AND ([in_main_level_unheated_Square_feet_range_low] IN ('''', ''NULL'') OR TRY_CAST([in_main_level_unheated_Square_feet_range_low] AS BIGINT) IS NOT NULL)
AND ([in_third_level_Square_feet_range_high] IN ('''', ''NULL'') OR TRY_CAST([in_third_level_Square_feet_range_high] AS BIGINT) IS NOT NULL)
AND ([in_third_level_Square_feet_range_low] IN ('''', ''NULL'') OR TRY_CAST([in_third_level_Square_feet_range_low] AS BIGINT) IS NOT NULL)
AND ([in_third_level_unheated_square_feet_range_high] IN ('''', ''NULL'') OR TRY_CAST([in_third_level_unheated_square_feet_range_high] AS BIGINT) IS NOT NULL)
AND ([in_third_level_unheated_square_feet_range_low] IN ('''', ''NULL'') OR TRY_CAST([in_third_level_unheated_square_feet_range_low] AS BIGINT) IS NOT NULL)
AND ([in_unheated_square_feet_range_high] IN ('''', ''NULL'') OR TRY_CAST([in_unheated_square_feet_range_high] AS BIGINT) IS NOT NULL)
AND ([in_unheated_square_feet_range_low] IN ('''', ''NULL'') OR TRY_CAST([in_unheated_square_feet_range_low] AS BIGINT) IS NOT NULL)
AND ([in_upper_level_square_feet_range_high] IN ('''', ''NULL'') OR TRY_CAST([in_upper_level_square_feet_range_high] AS BIGINT) IS NOT NULL)
AND ([in_upper_level_square_feet_range_low] IN ('''', ''NULL'') OR TRY_CAST([in_upper_level_square_feet_range_low] AS BIGINT) IS NOT NULL)
AND ([in_upper_level_unheated_square_feet_range_high] IN ('''', ''NULL'') OR TRY_CAST([in_upper_level_unheated_square_feet_range_high] AS BIGINT) IS NOT NULL)
AND ([in_upper_level_unheated_square_feet_range_low] IN ('''', ''NULL'') OR TRY_CAST([in_upper_level_unheated_square_feet_range_low] AS BIGINT) IS NOT NULL)
AND ([in_misc_int4_1] IN ('''', ''NULL'') OR TRY_CAST([in_misc_int4_1] AS BIGINT) IS NOT NULL)
AND ([in_misc_int4_2] IN ('''', ''NULL'') OR TRY_CAST([in_misc_int4_2] AS BIGINT) IS NOT NULL)
AND ([in_misc_int4_3] IN ('''', ''NULL'') OR TRY_CAST([in_misc_int4_3] AS BIGINT) IS NOT NULL)
AND ([in_misc_int4_4] IN ('''', ''NULL'') OR TRY_CAST([in_misc_int4_4] AS BIGINT) IS NOT NULL)
AND ([in_misc_int4_5] IN ('''', ''NULL'') OR TRY_CAST([in_misc_int4_5] AS BIGINT) IS NOT NULL)
AND ([in_misc_int4_6] IN ('''', ''NULL'') OR TRY_CAST([in_misc_int4_6] AS BIGINT) IS NOT NULL)
AND ([in_misc_int4_7] IN ('''', ''NULL'') OR TRY_CAST([in_misc_int4_7] AS BIGINT) IS NOT NULL)
AND ([in_misc_int4_8] IN ('''', ''NULL'') OR TRY_CAST([in_misc_int4_8] AS BIGINT) IS NOT NULL)
AND ([in_misc_int4_9] IN ('''', ''NULL'') OR TRY_CAST([in_misc_int4_9] AS BIGINT) IS NOT NULL)
AND ([in_misc_int4_10] IN ('''', ''NULL'') OR TRY_CAST([in_misc_int4_10] AS BIGINT) IS NOT NULL)
AND ([rm_baths_3rd_level] IN ('''', ''NULL'') OR TRY_CAST([rm_baths_3rd_level] AS BIGINT) IS NOT NULL)
AND ([rm_baths_4th_level] IN ('''', ''NULL'') OR TRY_CAST([rm_baths_4th_level] AS BIGINT) IS NOT NULL)
AND ([rm_baths_lower_level] IN ('''', ''NULL'') OR TRY_CAST([rm_baths_lower_level] AS BIGINT) IS NOT NULL)
AND ([rm_baths_main_level] IN ('''', ''NULL'') OR TRY_CAST([rm_baths_main_level] AS BIGINT) IS NOT NULL)
AND ([rm_baths_upper_level] IN ('''', ''NULL'') OR TRY_CAST([rm_baths_upper_level] AS BIGINT) IS NOT NULL)
AND ([in_internet_dom] IN ('''', ''NULL'') OR TRY_CAST([in_internet_dom] AS BIGINT) IS NOT NULL)
AND ([update_job_id] IN ('''', ''NULL'') OR TRY_CAST([update_job_id] AS BIGINT) IS NOT NULL)
AND ([PRD_Property_ID] IN ('''', ''NULL'') OR TRY_CAST([PRD_Property_ID] AS BIGINT) IS NOT NULL)
AND ([MatchModel] IN ('''', ''NULL'') OR TRY_CAST([MatchModel] AS BIGINT) IS NOT NULL)
AND ([LatestList] IN ('''', ''NULL'') OR TRY_CAST([LatestList] AS BIGINT) IS NOT NULL)


AND ([fi_first_trust_deed_due] IN ('''', ''NULL'') OR TRY_CAST([fi_first_trust_deed_due] AS DATE) IS NOT NULL)
AND ([fi_second_trust_deed_due] IN ('''', ''NULL'') OR TRY_CAST([fi_second_trust_deed_due] AS DATE) IS NOT NULL)
AND ([in_close_date] IN ('''', ''NULL'') OR TRY_CAST([in_close_date] AS DATE) IS NOT NULL)
AND ([in_escrow_date] IN ('''', ''NULL'') OR TRY_CAST([in_escrow_date] AS DATE) IS NOT NULL)
AND ([in_list_date] IN ('''', ''NULL'') OR TRY_CAST([in_list_date] AS DATE) IS NOT NULL)
AND ([in_load_date] IN ('''', ''NULL'') OR TRY_CAST([in_load_date] AS DATE) IS NOT NULL)
AND ([in_modify_date] IN ('''', ''NULL'') OR TRY_CAST([in_modify_date] AS DATE) IS NOT NULL)
AND ([in_offmarket_date] IN ('''', ''NULL'') OR TRY_CAST([in_offmarket_date] AS DATE) IS NOT NULL)
AND ([in_pending_date] IN ('''', ''NULL'') OR TRY_CAST([in_pending_date] AS DATE) IS NOT NULL)
AND ([in_projected_escrow_close_date] IN ('''', ''NULL'') OR TRY_CAST([in_projected_escrow_close_date] AS DATE) IS NOT NULL)
AND ([in_pull_date] IN ('''', ''NULL'') OR TRY_CAST([in_pull_date] AS DATE) IS NOT NULL)
AND ([in_sold_date] IN ('''', ''NULL'') OR TRY_CAST([in_sold_date] AS DATE) IS NOT NULL)
AND ([in_status_date] IN ('''', ''NULL'') OR TRY_CAST([in_status_date] AS DATE) IS NOT NULL)
AND ([in_system_expire_date] IN ('''', ''NULL'') OR TRY_CAST([in_system_expire_date] AS DATE) IS NOT NULL)
AND ([in_transact_date] IN ('''', ''NULL'') OR TRY_CAST([in_transact_date] AS DATE) IS NOT NULL)
AND ([in_withdrawn_date] IN ('''', ''NULL'') OR TRY_CAST([in_withdrawn_date] AS DATE) IS NOT NULL)
AND ([in_cancel_date] IN ('''', ''NULL'') OR TRY_CAST([in_cancel_date] AS DATE) IS NOT NULL)
AND ([in_HERS_year] IN ('''', ''NULL'') OR TRY_CAST([in_HERS_year] AS DATE) IS NOT NULL)
AND ([in_remodeled_date] IN ('''', ''NULL'') OR TRY_CAST([in_remodeled_date] AS DATE) IS NOT NULL)

AND ([fi_first_trust_deed_amount] IN ('''', ''NULL'') OR TRY_CAST([fi_first_trust_deed_amount] AS MONEY) IS NOT NULL)
AND ([fi_first_trust_deed_fee] IN ('''', ''NULL'') OR TRY_CAST([fi_first_trust_deed_fee] AS MONEY) IS NOT NULL)
AND ([fi_gross_equity] IN ('''', ''NULL'') OR TRY_CAST([fi_gross_equity] AS MONEY) IS NOT NULL)
AND ([fi_second_trust_deed_amount] IN ('''', ''NULL'') OR TRY_CAST([fi_second_trust_deed_amount] AS MONEY) IS NOT NULL)
AND ([fi_second_trust_deed_fee] IN ('''', ''NULL'') OR TRY_CAST([fi_second_trust_deed_fee] AS MONEY) IS NOT NULL)
AND ([fi_tax_amount] IN ('''', ''NULL'') OR TRY_CAST([fi_tax_amount] AS MONEY) IS NOT NULL)
AND ([in_association_dues1] IN ('''', ''NULL'') OR TRY_CAST([in_association_dues1] AS MONEY) IS NOT NULL)
AND ([in_association_dues2] IN ('''', ''NULL'') OR TRY_CAST([in_association_dues2] AS MONEY) IS NOT NULL)
AND ([in_lease_amount] IN ('''', ''NULL'') OR TRY_CAST([in_lease_amount] AS MONEY) IS NOT NULL)
AND ([in_list_price] IN ('''', ''NULL'') OR TRY_CAST([in_list_price] AS MONEY) IS NOT NULL)
AND ([in_orig_list_price] IN ('''', ''NULL'') OR TRY_CAST([in_orig_list_price] AS MONEY) IS NOT NULL)
AND ([in_pending_price] IN ('''', ''NULL'') OR TRY_CAST([in_pending_price] AS MONEY) IS NOT NULL)
AND ([in_previous_list_price] IN ('''', ''NULL'') OR TRY_CAST([in_previous_list_price] AS MONEY) IS NOT NULL)
AND ([in_range_high_price] IN ('''', ''NULL'') OR TRY_CAST([in_range_high_price] AS MONEY) IS NOT NULL)
AND ([in_range_low_price] IN ('''', ''NULL'') OR TRY_CAST([in_range_low_price] AS MONEY) IS NOT NULL)
AND ([in_sold_price] IN ('''', ''NULL'') OR TRY_CAST([in_sold_price] AS MONEY) IS NOT NULL)
AND ([in_total_assessed_value] IN ('''', ''NULL'') OR TRY_CAST([in_total_assessed_value] AS MONEY) IS NOT NULL)
AND ([fi_anual_gross_expense] IN ('''', ''NULL'') OR TRY_CAST([fi_anual_gross_expense] AS MONEY) IS NOT NULL)
AND ([fi_price_per_square_foot] IN ('''', ''NULL'') OR TRY_CAST([fi_price_per_square_foot] AS MONEY) IS NOT NULL)
AND ([in_assessments_expense] IN ('''', ''NULL'') OR TRY_CAST([in_assessments_expense] AS MONEY) IS NOT NULL)
AND ([fi_sold_price_per_acre] IN ('''', ''NULL'') OR TRY_CAST([fi_sold_price_per_acre] AS MONEY) IS NOT NULL)
AND ([fi_sold_price_per_square_foot] IN ('''', ''NULL'') OR TRY_CAST([fi_sold_price_per_square_foot] AS MONEY) IS NOT NULL)
AND ([in_concession_value] IN ('''', ''NULL'') OR TRY_CAST([in_concession_value] AS MONEY) IS NOT NULL)
AND ([con_maintenance_fee] IN ('''', ''NULL'') OR TRY_CAST([con_maintenance_fee] AS MONEY) IS NOT NULL)
AND ([land_lease_amount] IN ('''', ''NULL'') OR TRY_CAST([land_lease_amount] AS MONEY) IS NOT NULL)
AND ([land_lease_transfer_amount] IN ('''', ''NULL'') OR TRY_CAST([land_lease_transfer_amount] AS MONEY) IS NOT NULL)
AND ([fi_price_per_acre] IN ('''', ''NULL'') OR TRY_CAST([fi_price_per_acre] AS MONEY) IS NOT NULL)

AND [DataSource] <> ''''
'
        END, '	;
') ;

SELECT @SQL AS [SQL] ;

EXEC( @SQL ) ;

SELECT
    @SQL =
    CONCAT(
        'DROP TABLE IF EXISTS [dbo].[' , @TableName, ']

SELECT', CASE WHEN @Distinct = 1 THEN ' DISTINCT' END, '
	', STRING_AGG(REPLACE([v].[Casted], '[Column]', QUOTENAME([v].[FieldName])), ',
	'), '
INTO [dbo].[', @TableName, ']
FROM(
SELECT', CASE WHEN @Top > 0 THEN CONCAT(' TOP(', @Top, ')')END, '
	', STRING_AGG(
           CONCAT(
               CAST(NULL AS VARCHAR(MAX)), 'CASE WHEN TRIM([', [v].[columnname], ']) IN ('''',''NULL'') THEN NULL ELSE TRIM([', [v].[columnname], ']) END AS ['
             , [v].[FieldName], ']'), ',
	')WITHIN GROUP(ORDER BY [v].[Field #]), '
FROM [dbo].[v', @TableName, '] )[k]

SET @RowCount = @@ROWCOUNT

CREATE CLUSTERED COLUMNSTORE INDEX [CCI] ON [dbo].[', @TableName, ']

CREATE UNIQUE NONCLUSTERED INDEX [RECORD_ID] ON [dbo].[', @TableName, '] ([RECORD_ID]) WITH (DATA_COMPRESSION = ROW)
')
FROM [Definition].[vMLS] AS [v] ;

SELECT @SQL AS [SQL] ;

EXEC [sys].[sp_executesql] @SQL, N'@RowCount BIGINT OUTPUT', @RowCount OUTPUT ;

SELECT
    @TableName AS [TableName]
  , @RowCount AS [RowCount] ;
GO
