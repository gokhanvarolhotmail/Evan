USE Evan
GO
--CREATE SCHEMA [Profile]
RETURN

--DROP TABLE [tempdb].[dbo].[Profile] 
SELECT CONCAT('SELECT ',STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), QUOTENAME(REPLACE(name,'''',''''''))),', ') WITHIN GROUP(ORDER BY NAME), ' FROM [dbo].[Houseamp_WA_MLS_20210415-20210913]') FROM sys.[dm_exec_describe_first_result_set]('SELECT * FROM [dbo].[Houseamp_WA_MLS_20210415-20210913]',NULL,NULL)
WHERE collation_name <> ''
GO
--DROP TABLE IF EXISTS [tempdb].[dbo].[Profile]
EXEC [dbo].[sp_AdvancedProfile]
    @ObjectName = NULL
  , @IncludeObjectLikeCommaDelimited = NULL
  , @ExcludeObjectLikeCommaDelimited = NULL
  , @SQLToProfile = 'SELECT [ad_area], [ad_block_number], [ad_city_name], [ad_county_code], [ad_cross_streets], [ad_directions], [Ad_geo_APNO], [ad_geo_carrier_route], [ad_geo_census_block_id], [ad_geo_city_name], [ad_geo_data_type], [ad_geo_location_quality_code], [ad_geo_match_code], [ad_geo_state], [ad_geo_street_designator], [ad_geo_street_direction], [ad_geo_street_name], [ad_geo_street_number], [ad_geo_street_post_dir], [ad_geo_street_pre_type], [ad_geo_street_unit_type], [ad_geo_street_zip4], [ad_geo_unit], [ad_geo_zip_code], [ad_lot_number], [ad_map_code], [ad_marketing_area], [ad_neighborhood], [ad_parcel_number], [ad_postal_code], [ad_state], [ad_street_designator], [ad_street_direction], [ad_street_name], [ad_street_post_dir], [ad_street_pre_type], [ad_street_unit_type], [ad_street_zip4], [ad_township], [ad_tract_number], [ad_unit], [ad_unstructured_address], [ad_zip_code], [ad_zone_features], [ag_coagent_id], [ag_coagent_name], [ag_coagent_phone], [ag_email], [ag_fax], [ag_id], [ag_may_represent_seller_and_buyer], [ag_mobile_phone], [ag_name], [ag_office_email], [ag_office_id], [ag_office_name], [ag_office_phone], [ag_pager], [ag_phone], [ag_reciprocal_link], [ag_remarks], [ag_representation_features], [ag_vmail], [ag_website], [con_approval_requirement], [con_management_features], [con_minimum_lease], [con_unit_level], [ex_building_condition], [ex_building_faces], [ex_construction_features], [ex_driveway_features], [ex_exterior_wall_features], [ex_fence_features], [ex_fld_zone_yn], [ex_foundation_features], [ex_garage_features], [ex_garage_type], [ex_general_features], [ex_golf_features], [ex_green_certification_features], [ex_green_generation_features], [ex_green_location_features], [ex_green_sustainability_features], [ex_horse_property_features], [ex_indoor_air_quality_features], [ex_location_features], [ex_lot_size_dimensions], [ex_lot_size_features], [ex_lot_size_source], [ex_lotsize_range], [ex_parking_features], [ex_patio_dimensions], [ex_patio_features], [ex_patio_yn], [ex_pool_dimensions], [ex_pool_features], [ex_pool_yn], [ex_railroad_features], [ex_road_features], [ex_roof_features], [ex_rv_parking_dimensions], [ex_sewer_features], [ex_solar_features], [ex_spa_features], [ex_spa_yn], [ex_sprinkler_features], [ex_style], [ex_style_features], [ex_subdivision_features], [ex_surface_water_features], [ex_view_features], [ex_water_conservation_features], [ex_wateraccess_features], [ex_waterfront_features], [ex_waterfront_name], [ex_waterstructures_features], [fi_additional_finance_Info], [fi_comp_trigger], [fi_finance_features], [fi_finance_sponsor], [fi_finance_terms], [fi_first_trust_deed_assumable], [fi_first_trust_deed_lender], [fi_first_trust_deed_rate], [fi_first_trust_deed_type], [fi_how_sold_features], [fi_ignore_comp_trigger], [fi_ignore_paid_yn], [fi_possession], [fi_second_trust_deed_assumable], [fi_second_trust_deed_lender], [fi_second_trust_deed_rate], [fi_second_trust_deed_type], [fi_sold_terms_features], [fi_tax_description_features], [if_appliance_features], [if_basement_features], [if_basement_yn], [if_ceiling_height], [if_cooling_features], [if_cooling_yn], [if_energy_features], [if_fireplace_features], [if_fireplace_yn], [if_floor_features], [if_general_features], [if_heating_features], [if_levels], [if_levels_features], [if_pet_features], [if_plumbing_features], [if_security_features], [if_security_system_yn], [if_special_features], [if_utilities_features], [if_water_features], [if_water_heater_features], [if_window_features], [in_additional_pictures_yn], [in_additions_alter_yn], [in_age_features], [In_amenity_features], [in_ap_number], [in_assessments], [in_association_features], [in_association_litigation_yn], [in_association_phone], [in_association_yn], [in_auction_type], [in_builder_name], [In_building_name], [In_community_features], [in_compensation_buy_agent], [in_compensation_nonrep], [in_compensation_transaction_agent], [in_compensation_variable_yn], [In_complex_name], [in_contingency_reason], [in_crop_features], [in_detail_url], [in_distress_type], [In_distress_type2], [in_exclusions], [in_farm_features], [in_foundation_aproximate_size], [in_handicap_features], [in_inclusions], [in_is_attached], [in_is_land_lease_for_purchase_yn], [in_keybox_features], [in_keybox_location], [in_last_transaction_code], [in_lease_option_yn], [in_lease_purchase_yn], [in_legal_description], [in_legal_features], [in_list_price_exclusion_remarks], [in_listing_agreement_type], [in_listing_detail_url], [in_listing_has_for_sale_sign_yn], [in_lockbox_number], [in_mello_roos_yn], [in_misc_char200_1], [in_misc_char200_10], [in_misc_char200_11], [in_misc_char200_12], [in_misc_char200_13], [in_misc_char200_14], [in_misc_char200_15], [in_misc_char200_16], [in_misc_char200_17], [in_misc_char200_18], [in_misc_char200_19], [in_misc_char200_2], [in_misc_char200_20], [in_misc_char200_3], [in_misc_char200_4], [in_misc_char200_5], [in_misc_char200_6], [in_misc_char200_7], [in_misc_char200_8], [in_misc_char200_9], [in_misc_search_11], [in_misc_search_12], [in_misc_search_13], [in_misc_search_14], [in_misc_search_15], [in_misc_search_features_1], [in_misc_search_features_10], [in_misc_search_features_2], [in_misc_search_features_3], [in_misc_search_features_4], [in_misc_search_features_5], [in_misc_search_features_6], [in_misc_search_features_7], [in_misc_search_features_8], [in_misc_search_features_9], [in_model_name], [in_occupant_features], [in_occupant_name], [in_occupant_phone], [in_owner_name], [in_owner_phone], [in_potential_use], [in_previous_status], [in_primary_use], [in_property_type], [in_public_remarks], [in_range_price_flag], [in_reciprocal_listing], [in_restrictions], [in_retreat_yn], [in_seller_agrees_to_pay_points], [in_selling_office_comp_type], [in_selling_office_compensation], [in_showing_contact_phone], [in_showing_instructions], [in_sold_agent_name], [in_sold_agent_office_id], [in_sold_agent_public_id], [in_sold_finance_terms], [in_sold_office_name], [in_sold_terms], [in_status], [in_subtype], [in_topography], [in_tract_code], [in_tract_name], [in_transfer_of_possession], [in_video_tour_branded], [in_video_tour_unbranded], [in_view_yn], [in_virtual_tour_link], [in_virtual_tour_nonmls_url], [in_virtual_tour_url_branded], [in_virtual_tour_url_branded2], [in_virtual_tourl_url2], [in_volt220_outlet_location], [land_features], [land_ownership_type], [listing_id], [mls_listing_agreement_type], [mls_listing_id], [mls_property_type], [mls_source], [mls_status_type], [mls_sub_type], [org_id], [reg_mls_code], [rm_bathroom_features], [rm_bedroom_features], [rm_bonus_features], [rm_bonus_yn], [rm_converted_bedroom_yn], [rm_den_yn], [rm_dining_features], [rm_family_yn], [rm_formal_dining_yn], [rm_general_features], [rm_kitchen_features], [rm_laundry_features], [rm_living_features], [rm_living_yn], [rm_master_dressing_area_yn], [rm_master_yn], [rm_room1_dimensions1], [rm_room1_dimensions2], [rm_room1_features], [rm_room1_type], [rm_room10_dimensions1], [rm_room10_dimensions2], [rm_room10_features], [rm_room10_type], [rm_room11_dimensions1], [rm_room11_dimensions2], [rm_room11_features], [rm_room11_type], [rm_room12_dimensions1], [rm_room12_dimensions2], [rm_room12_features], [rm_room12_type], [rm_room13_dimensions1], [rm_room13_dimensions2], [rm_room13_features], [rm_room13_type], [rm_room14_dimensions1], [rm_room14_dimensions2], [rm_room14_features], [rm_room14_type], [rm_room2_dimensions1], [rm_room2_dimensions2], [rm_room2_features], [rm_room2_type], [rm_room3_dimensions1], [rm_room3_dimensions2], [rm_room3_features], [rm_room3_type], [rm_room4_dimensions1], [rm_room4_dimensions2], [rm_room4_features], [rm_room4_type], [rm_room5_dimensions1], [rm_room5_dimensions2], [rm_room5_features], [rm_room5_type], [rm_room6_dimensions1], [rm_room6_dimensions2], [rm_room6_features], [rm_room6_type], [rm_room7_dimensions1], [rm_room7_dimensions2], [rm_room7_features], [rm_room7_type], [rm_room8_dimensions1], [rm_room8_dimensions2], [rm_room8_features], [rm_room8_type], [rm_room9_dimensions1], [rm_room9_dimensions2], [rm_room9_features], [rm_room9_type], [rm_termite_clear_yn], [rm_utility_features], [sc_elementary_school], [sc_high_school], [sc_junior_high_school], [sc_school_district], [un_1_features], [un_2_features], [un_3_features], [un_4_features], [un_5_features] FROM [dbo].[Houseamp_WA_MLS_20210415-20210913]'
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
-- DROP TABLE IF EXISTS [Profile].[MLS]
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
  INTO [Profile].[MLS]
FROM [tempdb].[dbo].[Profile] [t] WITH( NOLOCK )
WHERE  ([t].[Num+Null+Blank%] = 100 OR [t].[Int+Null+Blank%] = 100 OR [t].[Date+Null+Blank] = 100 OR [t].[YNTF+Null+Blank] = 100)
  AND columndef LIKE '%char%'




go
;WITH a AS (
SELECT CASE WHEN [t].[Date+Null+Blank%] = 100 THEN 'DATE' WHEN [t].[YNTF+Null+Blank%] = 100 THEN 'BIT' WHEN [t].[Date+Null+Blank%] = 100 THEN 'BIGINT'
WHEN [t].[Num+Null+Blank%] = 100 THEN 'REAL'
END AS NewDataType,*
FROM [Profile].MLS  t
)
UPDATE d SET d.[DataType]= NewDataType
FROM definition.MLS d INNER JOIN a ON a.[Column] = d.[FieldName]

