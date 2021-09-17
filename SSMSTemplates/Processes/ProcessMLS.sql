
SELECT * FROM MLS m
INNER JOIN [dbo].[OpenLien] AS [o] ON m.PRD_Property_ID = o.[Quantarium_Internal_PID]
WHERE m.[in_status] = 'A'


SELECT TOP 100 [PRD_Property_ID], in_load_date,in_list_date,in_sold_date ,[in_status],[LatestList], [MatchModel]  FROM mls





SELECT COUNT(1)
FROM [dbo].[OpenLien] AS [o]
LEFT JOIN [dbo].[DemoXRef] AS [d] ON [o].[Quantarium_Internal_PID] = [d].[Quantarium_Internal_PID]
LEFT JOIN [dbo].[DemoIndividual] AS [d1] ON [d1].[Location_ID] = [d].[Location_ID] AND [d1].[Household_ID] = [d].[Household_ID_Owner_1] AND [d1].[Individual_ID] = [d].[Individual_ID_Owner_1]
LEFT JOIN [dbo].[DemoIndividual] AS [d2] ON [d2].[Location_ID] = [d].[Location_ID] AND [d2].[Household_ID] = [d].[Household_ID_Owner_2] AND [d2].[Individual_ID] = [d].[Individual_ID_Owner_2] ;


SELECT TOP 10 * FROM [dbo].[DemoIndividual]

SELECT TOP 100 * FROM [dbo].[Quantarium_Houseamp_WA_Select_DemoXref]  b


SELECT * FROM metadata.columns WHERE columnname IN('Latitude','Longitude')

DROP SYNONYM IF EXISTS [dbo].[OpenLien_Diff] ;

EXEC( 'CREATE SYNONYM [dbo].[OpenLien_Diff]
FOR [dbo].[OpenLien_20210913] ;' ) ;

DROP TABLE IF EXISTS [dbo].[OpenLien_DiffKeys] ;

SELECT [a].[Quantarium_Internal_PID]
INTO [dbo].[OpenLien_DiffKeys]
FROM [dbo].[OpenLien] AS [a]
WHERE EXISTS ( SELECT 1 FROM [dbo].[OpenLien_Diff] AS [b] WHERE [a].[Quantarium_Internal_PID] = [b].[Quantarium_Internal_PID] )
OPTION( RECOMPILE ) ;

IF @@ROWCOUNT = 0
    RETURN ;

DROP TABLE IF EXISTS [dbo].[DemoIndividual_DiffKeys] ;

SELECT DISTINCT
       [k].[Quantarium_Internal_PID]
     , [k].[QId]
INTO [dbo].[DemoIndividual_DiffKeys]
FROM( SELECT
          [k].[Quantarium_Internal_PID]
        , [d1].[QId]
      FROM [dbo].[OpenLien_DiffKeys] AS [k]
      INNER JOIN [dbo].[DemoXRef] AS [d] ON [k].[Quantarium_Internal_PID] = [d].[Quantarium_Internal_PID]
      INNER JOIN [dbo].[DemoIndividual] AS [d1] ON [d1].[Location_ID] = [d].[Location_ID] AND [d1].[Household_ID] = [d].[Household_ID_Owner_1] AND [d1].[Individual_ID] = [d].[Individual_ID_Owner_1]
      UNION ALL
      SELECT
          [k].[Quantarium_Internal_PID]
        , [d2].[QId]
      FROM [dbo].[OpenLien_DiffKeys] AS [k]
      INNER JOIN [dbo].[DemoXRef] AS [d] ON [k].[Quantarium_Internal_PID] = [d].[Quantarium_Internal_PID]
      INNER JOIN [dbo].[DemoIndividual] AS [d2] ON [d2].[Location_ID] = [d].[Location_ID] AND [d2].[Household_ID] = [d].[Household_ID_Owner_2] AND [d2].[Individual_ID] = [d].[Individual_ID_Owner_2] ) AS [k]
OPTION( RECOMPILE ) ;

DECLARE
    @getdate       DATE    = GETDATE()
  , @BatchId       INT     = 1
  , @ArchiveReason TINYINT = 1 ;

SELECT
    @getdate AS [DateAdded]
  , @BatchId AS [BatchId]
  , @ArchiveReason AS [ArchiveReason]
  , [dk].[Quantarium_Internal_PID]
  , [di].*
INTO [dbo].[DemoIndividual_Archive]
FROM [dbo].[DemoIndividual] AS [di]
INNER JOIN [dbo].[DemoIndividual_DiffKeys] AS [dk] ON [dk].[QId] = [di].[QId]
OPTION( RECOMPILE ) ;

DELETE [di]
FROM [dbo].[DemoIndividual] AS [di]
WHERE EXISTS ( SELECT 1 FROM [dbo].[DemoIndividual_DiffKeys] AS [dk] WHERE [dk].[QId] = [di].[QId] )
OPTION( RECOMPILE ) ;

SELECT
    @getdate AS [DateAdded]
  , @BatchId AS [BatchId]
  , @ArchiveReason AS [ArchiveReason]
  , [d].*
INTO [dbo].[DemoXRef_Archive]
FROM [dbo].[DemoXRef] AS [d]
INNER JOIN [dbo].[OpenLien_DiffKeys] AS [k] ON [k].[Quantarium_Internal_PID] = [d].[Quantarium_Internal_PID]
OPTION( RECOMPILE ) ;

DELETE [d]
FROM [dbo].[DemoXRef] AS [d]
WHERE EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [k] WHERE [k].[Quantarium_Internal_PID] = [d].[Quantarium_Internal_PID] )
OPTION( RECOMPILE ) ;

SELECT
    @getdate AS [DateAdded]
  , @BatchId AS [BatchId]
  , @ArchiveReason AS [ArchiveReason]
  , [a].*
INTO [dbo].[OpenLien_Archive]
FROM [dbo].[OpenLien] AS [a]
INNER JOIN [dbo].[OpenLien_DiffKeys] AS [k] ON [k].[Quantarium_Internal_PID] = [a].[Quantarium_Internal_PID]
OPTION( RECOMPILE ) ;

DELETE [a]
FROM [dbo].[OpenLien] AS [a]
WHERE EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [k] WHERE [k].[Quantarium_Internal_PID] = [a].[Quantarium_Internal_PID] )
OPTION( RECOMPILE ) ;

INSERT [dbo].[OpenLien] WITH( TABLOCK )
SELECT *
FROM [dbo].[OpenLien_Diff]
OPTION( RECOMPILE ) ;

