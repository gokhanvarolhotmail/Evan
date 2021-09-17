DECLARE @Type VARCHAR(30) = 'OpenLien' ;
DECLARE
    @getdate       DATE    = GETDATE()
  , @BatchId       INT     = 1
  , @ArchiveReason TINYINT = CASE WHEN @Type = 'OpenLien' THEN 1 WHEN @Type = 'MLS' THEN 2 END ;

IF @ArchiveReason IS NULL
    THROW 50000, 'Invalid Type!', 1 ;

DROP SYNONYM IF EXISTS [dbo].[OpenLien_Diff] ;

EXEC( 'CREATE SYNONYM [dbo].[OpenLien_Diff] FOR [dbo].[OpenLien_20210913] ;' ) ;

IF @Type = 'OpenLien'
    EXEC( 'CREATE OR ALTER VIEW [dbo].[KeysTable]
as
SELECT
	[Quantarium_Internal_PID]
FROM [dbo].[OpenLien_Diff]' ) ;
ELSE IF @Type = 'MLS'
    EXEC( 'CREATE OR ALTER VIEW [dbo].[KeysTable]
as
SELECT
	[PRD_Property_ID] as [Quantarium_Internal_PID]
FROM [dbo].[MLS] [m]
WHERE [m].[in_status] = ''A''' ) ;
ELSE
    EXEC( 'DROP VIEW IF EXISTS [dbo].[KeysTable]' ) ;

DROP TABLE IF EXISTS [dbo].[OpenLien_DiffKeys] ;

SELECT [a].[Quantarium_Internal_PID]
INTO [dbo].[OpenLien_DiffKeys]
FROM [dbo].[OpenLien] AS [a]
WHERE EXISTS ( SELECT 1 FROM [dbo].[KeysTable] AS [b] WHERE [a].[Quantarium_Internal_PID] = [b].[Quantarium_Internal_PID] )
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

IF @Type = 'OpenLien'
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

IF @Type = 'OpenLien'
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

IF @Type = 'OpenLien'
    DELETE [a]
    FROM [dbo].[OpenLien] AS [a]
    WHERE EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [k] WHERE [k].[Quantarium_Internal_PID] = [a].[Quantarium_Internal_PID] )
    OPTION( RECOMPILE ) ;

IF @Type = 'OpenLien'
    INSERT [dbo].[OpenLien] WITH( TABLOCK )
    SELECT *
    FROM [dbo].[OpenLien_Diff]
    OPTION( RECOMPILE ) ;
