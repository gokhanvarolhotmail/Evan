USE [Evan] ;
GO
DECLARE
    @TableName NVARCHAR(MAX) = N'Houseamp_WA_MLS_20210415-20210913'
  , @Distinct  BIT           = 0
  , @Top       BIGINT        = null;

SET @TableName = PARSENAME(@TableName, 1) ;

DECLARE
    @SQL      NVARCHAR(MAX)
  , @BCP      VARCHAR(4000)
  , @RowCount BIGINT
  , @Return   INT ,@Ignore_RECORD_ID_NOTNULL BIT = 1

DROP TABLE IF EXISTS [#cols] ;

SELECT *
INTO [#cols]
FROM [Util].[dbo].ParseDelimited(
         'RECORD_ID	org_id	listing_id	ad_area	ad_block_number	ad_city_name	ad_county_code	ad_county_fips	ad_cross_streets	ad_directions	ad_geo_city_name	ad_geo_state	ad_geo_street_designator	ad_geo_street_direction	ad_geo_street_name	ad_geo_street_number	ad_geo_street_post_dir	ad_geo_street_pre_type	ad_geo_street_unit_type	ad_geo_street_zip4	ad_geo_unit	ad_lot_number	ad_map_code	ad_map_precision	ad_marketing_area	ad_neighborhood	ad_parcel_number	ad_postal_code	ad_state	ad_street_designator	ad_street_direction	ad_street_name	ad_street_number	ad_street_post_dir	ad_street_pre_type	ad_street_unit_type	ad_street_zip4	ad_tract_number	ad_unit	ad_zip_code	ad_zone_features	ag_coagent_id	ag_coagent_name	ag_coagent_phone	ag_email	ag_fax	ag_id	ag_mask	ag_may_represent_seller_and_buyer	ag_mobile_phone	ag_name	ag_office_email	ag_office_id	ag_office_name	ag_office_phone	ag_pager	ag_phone	ag_reciprocal_link	ag_remarks	ag_representation_features	ag_vmail	ag_website	ex_fld_zone_yn	ex_location_features	ex_lot_size_acres	ex_lot_size_dimensions	ex_lot_size_features	ex_lot_size_source	ex_lot_size_square_feet	ex_lotsize_range	ex_parking_features	ex_parking_spaces	ex_parking_spaces_total	ex_road_features	ex_sewer_features	ex_style	ex_view_features	ex_wateraccess_features	ex_waterfront_features	fi_additional_finance_Info	fi_comp_trigger	fi_finance_features	fi_finance_sponsor	fi_finance_terms	fi_first_trust_deed_amount	fi_first_trust_deed_assumable	fi_first_trust_deed_due	fi_first_trust_deed_fee	fi_first_trust_deed_interest	fi_first_trust_deed_lender	fi_first_trust_deed_rate	fi_first_trust_deed_type	fi_gross_equity	fi_ignore_comp_trigger	fi_ignore_paid_yn	fi_possession	fi_second_trust_deed_amount	fi_second_trust_deed_assumable	fi_second_trust_deed_due	fi_second_trust_deed_fee	fi_second_trust_deed_interest	fi_second_trust_deed_lender	fi_second_trust_deed_rate	fi_second_trust_deed_type	fi_tax_amount	fi_tax_description_features	fi_tax_period	fi_total_tax_rate	if_levels_features	if_special_features	if_utilities_features	if_water_features	in_additional_pictures_yn	in_adom	in_ap_number	in_association_dues1	in_association_dues2	in_association_features	in_association_litigation_yn	in_association_period	in_association_phone	in_association_yn	in_close_date	in_compensation_buy_agent	in_compensation_nonrep	in_compensation_transaction_agent	in_detail_url	in_display_mask	in_escrow_date	in_exclusions	in_image_count	in_last_transaction_code	in_latitude	in_lease_amount	in_lease_period	in_lease_option_yn	in_lease_term	in_legal_description	in_legal_features	in_list_date	in_list_price	in_list_price_exclusion_remarks	in_listing_agreement_type	in_listing_has_for_sale_sign_yn	in_listing_loaded_by_broker	in_load_date	in_longitude	in_modify_date	in_offmarket_date	in_option_mask	in_orig_list_price	in_owner_name	in_owner_phone	in_pending_date	in_pending_price	in_previous_list_price	in_previous_status	in_projected_escrow_close_date	in_property_type	in_public_remarks	in_pull_date	in_range_high_price	in_range_low_price	in_range_price_flag	in_reciprocal_listing	in_restrictions	in_seller_agrees_to_pay_points	in_selling_office_comp	in_selling_office_comp_type	in_selling_office_compensation	in_showing_instructions	in_sold_agent_name	in_sold_agent_office_id	in_sold_agent_public_id	in_sold_date	in_sold_finance_terms	in_sold_office_name	in_sold_price	in_sold_terms	in_status	in_status_date	in_subtype	in_system_expire_date	in_total_assessed_value	in_tract_code	in_tract_name	in_transact_date	in_transfer_of_possession	in_view_yn	in_virtual_tour_link	in_withdrawn_date	reg_mls_code	sc_elementary_school	sc_high_school	sc_junior_high_school	sc_school_district	ad_geo_zip_code	ad_geo_match_code	ad_geo_location_quality_code	ad_geo_data_type	ad_township	ex_surface_water_features	fi_anual_gross_expense	fi_price_per_square_foot	fi_tax_year	in_assessments	in_assessments_expense	in_primary_use	ad_geo_census_block_id	in_distress_type	mls_listing_id	Ad_geo_altitude	Ad_geo_APNO	In_community_features	In_building_name	In_complex_name	mls_source	In_distress_type2	ex_driveway_features	ex_exterior_wall_features	ex_railroad_features	fi_sold_price_per_acre	fi_sold_price_per_square_foot	fi_sold_terms_features	if_basement_yn	in_cancel_date	in_handicap_features	in_total_number_of_buildings	mls_listing_agreement_type	mls_property_type	mls_status_type	mls_sub_type	fi_how_sold_features	ad_geo_carrier_route	ex_waterfront_name	in_year_remodeled	mls_latitude	mls_longitude	ad_unstructured_address	ex_green_certification_features	ex_green_generation_features	ex_green_location_features	ex_green_sustainability_features	ex_indoor_air_quality_features	ex_water_conservation_features	if_water_heater_features	in_association_period2	in_auction_date	in_auction_type	in_compensation_variable_yn	in_concession_value	in_contingency_reason	in_HERS_rating	in_HERS_year	in_inclusions	in_lease_purchase_yn	in_listing_detail_url	in_video_tour_branded	in_video_tour_unbranded	in_virtual_tour_nonmls_url	in_virtual_tour_url_branded	in_virtual_tour_url_branded2	in_virtual_tourl_url2	in_lockbox_number	in_showing_contact_phone	con_approval_requirement	con_maintenance_fee	con_management_features	con_minimum_lease	con_unit_level	ex_building_condition	ex_building_faces	ex_building_square_feet	ex_carport_spaces	ex_construction_features	ex_fence_features	ex_foundation_features	ex_garage_features	ex_garage_remotes	ex_garage_spaces	ex_garage_type	ex_general_features	ex_golf_features	ex_horse_property_features	ex_patio_dimensions	ex_patio_features	ex_patio_yn	ex_pool_dimensions	ex_pool_features	ex_pool_yn	ex_roof_features	ex_rv_parking_dimensions	ex_solar_features	ex_spa_features	ex_spa_yn	ex_sprinkler_features	ex_style_features	ex_subdivision_features	ex_waterstructures_features	if_appliance_features	if_basement_features	if_cooling_features	if_cooling_yn	if_energy_features	if_fireplace_features	if_fireplace_number	if_fireplace_yn	if_floor_features	if_general_features	if_heating_features	if_levels	if_number_ceiling_fans	if_pet_features	if_plumbing_features	if_security_features	if_security_system_yn	if_window_features	in_additions_alter_yn	in_age_features	in_builder_name	in_is_attached	in_is_land_lease_for_purchase_yn	in_keybox_features	in_keybox_location	in_living_square_feet	in_mello_roos_yn	in_model_name	in_occupant_features	in_occupant_name	in_occupant_phone	in_remodeled_date	in_retreat_yn	in_total_units_in_complex	in_volt220_outlet_location	in_year_built	land_features	land_lease_amount	land_lease_expire_date	land_lease_renew_date	land_lease_term	land_lease_transfer_amount	land_ownership_type	rm_bathroom_features	rm_baths_full	rm_baths_half	rm_baths_quarter	rm_baths_three_quarter	rm_baths_total	rm_bedroom_features	rm_bedrooms_total	rm_bonus_features	rm_bonus_yn	rm_converted_bedroom_yn	rm_den_yn	rm_dining_features	rm_family_yn	rm_formal_dining_yn	rm_general_features	rm_kitchen_features	rm_laundry_features	rm_living_features	rm_living_yn	rm_master_dressing_area_yn	rm_master_yn	rm_room1_features	rm_room1_type	rm_room1_dimensions1	rm_room1_dimensions2	rm_room2_features	rm_room2_type	rm_room2_dimensions1	rm_room2_dimensions2	rm_room3_features	rm_room3_type	rm_room3_dimensions1	rm_room3_dimensions2	rm_room4_features	rm_room4_type	rm_room4_dimensions1	rm_room4_dimensions2	rm_room5_features	rm_room5_type	rm_room5_dimensions1	rm_room5_dimensions2	rm_room6_features	rm_room6_type	rm_room6_dimensions1	rm_room6_dimensions2	rm_room7_features	rm_room7_type	rm_room7_dimensions1	rm_room7_dimensions2	rm_room8_features	rm_room8_type	rm_room8_dimensions1	rm_room8_dimensions2	rm_room9_features	rm_room9_type	rm_room9_dimensions1	rm_room9_dimensions2	rm_room10_features	rm_room10_type	rm_room10_dimensions1	rm_room10_dimensions2	rm_room11_features	rm_room11_type	rm_room11_dimensions1	rm_room11_dimensions2	rm_room12_features	rm_room12_type	rm_room12_dimensions1	rm_room12_dimensions2	rm_room13_features	rm_room13_type	rm_room13_dimensions1	rm_room13_dimensions2	rm_room14_features	rm_room14_type	rm_room14_dimensions1	rm_room14_dimensions2	rm_rooms_total	rm_termite_clear_yn	rm_utility_features	rm_walk_in_closets	in_range_high_living_square_feet	in_range_low_living_square_feet	if_ceiling_height	in_aproximate_above_ground_square_feet	in_aproximate_below_ground_square_feet	in_aproximate_finished_square_feet	in_aproximate_unfinished_square_feet	in_basement_Square_Feet_range_high	in_basement_Square_Feet_range_low	in_basement_unheated_Square_Feet_range_high	in_basement_unheated_Square_Feet_range_low	in_foundation_aproximate_size	in_lower_level_Square_Feet_range_high	in_lower_level_Square_Feet_range_low	in_lower_level_unheated_Square_Feet_range_high	in_lower_level_unheated_Square_Feet_range_low	in_main_level_Square_feet_range_high	in_main_level_Square_feet_range_low	in_main_level_unheated_Square_feet_range_high	in_main_level_unheated_Square_feet_range_low	in_third_level_Square_feet_range_high	in_third_level_Square_feet_range_low	in_third_level_unheated_square_feet_range_high	in_third_level_unheated_square_feet_range_low	in_unheated_square_feet_range_high	in_unheated_square_feet_range_low	in_upper_level_square_feet_range_high	in_upper_level_square_feet_range_low	in_upper_level_unheated_square_feet_range_high	in_upper_level_unheated_square_feet_range_low	in_misc_char200_1	in_misc_char200_2	in_misc_char200_3	in_misc_char200_4	in_misc_char200_5	in_misc_char200_6	in_misc_char200_7	in_misc_char200_8	in_misc_char200_9	in_misc_char200_10	in_misc_dec_1	in_misc_dec_2	in_misc_dec_3	in_misc_dec_4	in_misc_dec_5	in_misc_dec_6	in_misc_dec_7	in_misc_dec_8	in_misc_dec_9	in_misc_dec_10	in_misc_int4_1	in_misc_int4_2	in_misc_int4_3	in_misc_int4_4	in_misc_int4_5	in_misc_int4_6	in_misc_int4_7	in_misc_int4_8	in_misc_int4_9	in_misc_int4_10	fi_price_per_acre	rm_baths_3rd_level	rm_baths_4th_level	rm_baths_lower_level	rm_baths_main_level	rm_baths_upper_level	in_crop_features	in_farm_features	in_internet_dom	in_misc_char200_11	in_misc_char200_12	in_misc_char200_13	in_misc_char200_14	in_misc_char200_15	in_misc_char200_16	in_misc_char200_17	in_misc_char200_18	in_misc_char200_19	in_misc_char200_20	in_misc_date_1	in_misc_date_2	in_misc_search_11	in_misc_search_12	in_misc_search_13	in_misc_search_14	in_misc_search_15	in_misc_search_features_1	in_misc_search_features_10	in_misc_search_features_2	in_misc_search_features_3	in_misc_search_features_4	in_misc_search_features_5	in_misc_search_features_6	in_misc_search_features_7	in_misc_search_features_8	in_misc_search_features_9	in_potential_use	un_1_features	un_2_features	un_3_features	un_4_features	un_5_features	In_amenity_features	in_topography	update_job_id	PRD_Property_ID	MatchModel	LatestList	CurrentListDate	OriginalListPrice	q_orgid	DataSource'
       , '	') ;

SELECT @SQL = CONCAT('DROP TABLE IF EXISTS [dbo].[', @TableName, ']
CREATE TABLE [dbo].[', @TableName, '](
	', STRING_AGG(CONCAT(CAST(QUOTENAME([Field]) AS VARCHAR(MAX)), ' VARCHAR(8000)'), ',
	')WITHIN GROUP(ORDER BY [FieldNum]), '
)')
FROM [#cols] ;

SELECT @SQL AS [SQL] ;

EXEC( @SQL ) ;

SET @BCP = CONCAT('bcp "[Evan].[dbo].[', @TableName, ']" format nul -c -x -f C:\Evan\MLS.xml -t"', CHAR(9), '" -S 192.168.1.19 -U gvarol -P C@n@n6132') ;

SELECT @BCP AS [BCP] ;

EXEC @Return = [sys].[xp_cmdshell] @BCP ;

SET @SQL = CONCAT('DROP VIEW IF EXISTS [dbo].[v', @TableName, ']')

SELECT @SQL AS [SQL] ;

EXEC( @SQL ) ;

SET @SQL = CONCAT(CAST(NULL AS NVARCHAR(MAX)), 'CREATE OR ALTER VIEW [dbo].[v', @TableName, ']
AS
SELECT
   [DataFile].*
FROM
	OPENROWSET(BULK ''C:\Evan\', @TableName, '.txt'',
	FORMATFILE = ''C:\Evan\MLS.xml'',
	FIRSTROW = 2) AS [DataFile]
',CASE WHEN @Ignore_RECORD_ID_NOTNULL = 1 THEN 'WHERE TRY_CAST([RECORD_ID] AS BIGINT) IS NOT NULL
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


AND [DataSource] <> ''''' END,'	;
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
SELECT', CASE WHEN @Top > 0 THEN CONCAT(' TOP(', @Top, ')')END, '
	', STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), 'CASE WHEN TRIM([', [c].[Field], ']) IN ('''',''NULL'') THEN NULL ELSE TRIM([', [c].[Field], ']) END AS [', [c].[Field], ']'), ',
	')WITHIN GROUP(ORDER BY [c].[FieldNum]), '
FROM [dbo].[v', @TableName, '] )[k]

SET @RowCount = @@ROWCOUNT

CREATE CLUSTERED COLUMNSTORE INDEX [CCI] ON [dbo].[', @TableName, ']

CREATE UNIQUE NONCLUSTERED INDEX [RECORD_ID] ON [dbo].[', @TableName, '] ([RECORD_ID]) WITH (DATA_COMPRESSION = ROW)
')
FROM [#cols] AS [c]
FULL OUTER JOIN [Definition].[vMLS] AS [v] ON [v].[Field #] = [c].[FieldNum] ;

SELECT @SQL AS [SQL] ;

EXEC [sys].[sp_executesql] @SQL, N'@RowCount BIGINT OUTPUT', @RowCount OUTPUT ;

SELECT
    @TableName AS [TableName]
  , @RowCount AS [RowCount] ;
GO
return
SELECT QUOTENAME(field)+',', CONCAT('(',QUOTENAME(field) , ' IN ('''', ''NULL'') OR TRY_CAST(',QUOTENAME(field),' AS MONEY) IS NOT NULL) AND')

,REPLACE(CONCAT('AND (',QUOTENAME(field) , ' IN ('''', ''NULL'') OR TRY_CAST(',QUOTENAME(field),' AS BIGINT) IS NOT NULL)'),'''','''''')

FROM [#cols] AS [c]
FULL OUTER JOIN [Definition].[vMLS] AS [v] ON [v].[Field #] = [c].[FieldNum] 
WHERE [casted] LIKE '% as %INT)%'