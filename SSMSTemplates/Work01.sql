SET STATISTICS TIME ON ;

SELECT COUNT(1)
FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien_20210622] AS [o]
LEFT JOIN [dbo].[Quantarium_Houseamp_WA_Select_DemoXref_20210622] AS [d] ON [o].[Quantarium_Internal_PID] = [d].[Quantarium_Internal_PID]
LEFT JOIN [dbo].[Quantarium_Houseamp_WA_Select_DemoInd_20210622] AS [d1] ON [d1].[Location_ID] = [d].[Location_ID]
                                                                        AND [d1].[Household_ID] = [d].[Household_ID_Owner_1]
                                                                        AND [d1].[Individual_ID] = [d].[Individual_ID_Owner_1]
LEFT JOIN [dbo].[Quantarium_Houseamp_WA_Select_DemoInd_20210622] AS [d2] ON [d2].[Location_ID] = [d].[Location_ID]
                                                                        AND [d2].[Household_ID] = [d].[Household_ID_Owner_2]
                                                                        AND [d2].[Individual_ID] = [d].[Individual_ID_Owner_2] ;


SELECT TOP 100 * FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoXref]  b


SELECT * FROM metadata.columns WHERE columnname IN('Latitude','Longitude')
