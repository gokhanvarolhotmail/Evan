USE [Evan] ;
GO
DECLARE @Type VARCHAR(30) = 'MLS' ;
DECLARE
    @getdate       DATE    = GETDATE()
  , @BatchId       INT     = 1
  , @ArchiveReason TINYINT = CASE WHEN @Type = 'OpenLien' THEN 1 WHEN @Type = 'MLS' THEN 2 END
  , @Debug         BIT     = 1 ;

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
WHERE EXISTS ( SELECT 1 FROM [dbo].[KeysTable] AS [b] WHERE [a].[Quantarium_Internal_PID] = [b].[Quantarium_Internal_PID] ) AND @Debug = 0
OPTION( RECOMPILE ) ;

IF @Debug = 0 AND @@ROWCOUNT = 0
    RETURN ;

INSERT [dbo].[OpenLien_DiffKeys_Archive] WITH( TABLOCK )
SELECT
    @getdate AS [DateAdded]
  , @BatchId AS [BatchId]
  , @ArchiveReason AS [ArchiveReason]
  , [d].*
FROM [dbo].[OpenLien_DiffKeys] AS [d] ;

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
WHERE @Debug = 0
OPTION( RECOMPILE ) ;

INSERT [dbo].[DemoIndividual_DiffKeys_Archive] WITH( TABLOCK )
SELECT
    @getdate AS [DateAdded]
  , @BatchId AS [BatchId]
  , @ArchiveReason AS [ArchiveReason]
  , [d].*
FROM [dbo].[DemoIndividual_DiffKeys] AS [d] ;

INSERT [dbo].[DemoIndividual_Archive] WITH( TABLOCK )
SELECT
    @getdate AS [DateAdded]
  , @BatchId AS [BatchId]
  , @ArchiveReason AS [ArchiveReason]
  , [dk].[Quantarium_Internal_PID]
  , [di].*
FROM [dbo].[DemoIndividual] AS [di]
INNER JOIN [dbo].[DemoIndividual_DiffKeys] AS [dk] ON [dk].[QId] = [di].[QId]
WHERE @Debug = 0
OPTION( RECOMPILE ) ;

IF @Type = 'OpenLien'
    DELETE [di]
    FROM [dbo].[DemoIndividual] AS [di]
    WHERE EXISTS ( SELECT 1 FROM [dbo].[DemoIndividual_DiffKeys] AS [dk] WHERE [dk].[QId] = [di].[QId] ) AND @Debug = 0
    OPTION( RECOMPILE ) ;

INSERT [dbo].[DemoXRef_Archive] WITH( TABLOCK )
SELECT
    @getdate AS [DateAdded]
  , @BatchId AS [BatchId]
  , @ArchiveReason AS [ArchiveReason]
  , [d].*
FROM [dbo].[DemoXRef] AS [d]
WHERE EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [k] WHERE [k].[Quantarium_Internal_PID] = [d].[Quantarium_Internal_PID] ) AND @Debug = 0
OPTION( RECOMPILE ) ;

IF @Type = 'OpenLien'
    DELETE [d]
    FROM [dbo].[DemoXRef] AS [d]
    WHERE EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [k] WHERE [k].[Quantarium_Internal_PID] = [d].[Quantarium_Internal_PID] ) AND @Debug = 0
    OPTION( RECOMPILE ) ;

INSERT [dbo].[OpenLien_Archive] WITH( TABLOCK )
SELECT
    @getdate AS [DateAdded]
  , @BatchId AS [BatchId]
  , @ArchiveReason AS [ArchiveReason]
  , [a].*
FROM [dbo].[OpenLien] AS [a]
WHERE EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [k] WHERE [k].[Quantarium_Internal_PID] = [a].[Quantarium_Internal_PID] ) AND @Debug = 0
OPTION( RECOMPILE ) ;

IF @Type = 'OpenLien'
    DELETE [a]
    FROM [dbo].[OpenLien] AS [a]
    WHERE EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [k] WHERE [k].[Quantarium_Internal_PID] = [a].[Quantarium_Internal_PID] ) AND @Debug = 0
    OPTION( RECOMPILE ) ;

IF @Type = 'OpenLien'
    INSERT [dbo].[OpenLien] WITH( TABLOCK )
    SELECT *
    FROM [dbo].[OpenLien_Diff]
    WHERE @Debug = 0
    OPTION( RECOMPILE ) ;
ELSE IF @Type = 'MLS'
         BEGIN
             INSERT [dbo].[MLS_Archive] WITH( TABLOCK )
             SELECT
                 @getdate AS [DateAdded]
               , @BatchId AS [BatchId]
               , @ArchiveReason AS [ArchiveReason]
               , [m].*
             FROM [dbo].[MLS] AS [m]
             WHERE [m].[in_status] = 'A' AND EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [d] WHERE [d].[Quantarium_Internal_PID] = [m].[PRD_Property_ID] ) AND @Debug = 0
             OPTION( RECOMPILE ) ;

             DELETE [m]
             FROM [dbo].[MLS] AS [m]
             WHERE [m].[in_status] = 'A' AND EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [d] WHERE [d].[Quantarium_Internal_PID] = [m].[PRD_Property_ID] ) AND @Debug = 0
             OPTION( RECOMPILE ) ;
         END ;
GO
/*
CREATE CLUSTERED COLUMNSTORE INDEX [CCI] ON [dbo].[DemoIndividual_DiffKeys] ;
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI] ON [dbo].[OpenLien_DiffKeys] ;
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI] ON [dbo].[DemoIndividual_DiffKeys_Archive] ;
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI] ON [dbo].[OpenLien_DiffKeys_Archive] ;
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI] ON [dbo].[MLS_Archive] ;
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI] ON [dbo].[OpenLien_Archive] ;
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI] ON [dbo].[DemoXRef_Archive] ;
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI] ON [dbo].[DemoIndividual_Archive] ;
GO
*/