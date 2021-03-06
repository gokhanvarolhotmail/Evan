USE [Evan] ;
GO

DECLARE
    @Type      VARCHAR(30)  = 'MLS'
  , @TableName VARCHAR(256) = '[dbo].[OpenLien_20210913]' ;
DECLARE
    @DriverId                           INT
  , @SQL                                NVARCHAR(MAX)
  , @Debug                              BIT           = 1
  , @OpenLien_DiffKeysCnt               BIGINT
  , @DemoIndividual_DiffKeysCnt         BIGINT
  , @DemoIndividual_DiffKeys_ArchiveCnt BIGINT
  , @DemoIndividual_Archive             BIGINT
  , @DemoIndividual_DelCnt              BIGINT
  , @DemoXRef_ArchiveCnt                BIGINT
  , @DemoXRef_DelCnt                    BIGINT
  , @OpenLien_ArchiveCnt                BIGINT
  , @OpenLien_DelCnt                    BIGINT
  , @OpenLien_InsCnt                    BIGINT
  , @MLS_ArchiveCnt                     BIGINT
  , @MLS_DelCnt                         BIGINT
  , @Message                            NVARCHAR(4000) ;

INSERT [Control].[Driver]( [Type], [TableName] )
VALUES( @Type, @TableName ) ;

SET @DriverId = SCOPE_IDENTITY() ;

UPDATE [d]
SET
    @TableName = [d].[TableName]
  , [d].[DateStarted] = GETDATE()
  , [d].[Status] = 50 /*Running*/
  , [d].[DateEnded] = NULL
  , [d].[SQL] = NULL
  , [d].[ErrorLine] = NULL
  , [d].[ErrorMessage] = NULL
  , [d].[ErrorNumber] = NULL
  , [d].[ErrorSeverity] = NULL
  , [d].[ErrorState] = NULL
FROM [Control].[Driver] AS [d]
WHERE [d].[DriverId] = @DriverId ;

IF OBJECT_ID(@TableName, 'U') IS NULL
    BEGIN
        SET @Message = CONCAT('Table: ', @TableName, ' does not exists!') ;

        THROW 50000, @Message, 1 ;
    END ;

BEGIN TRY
    DROP SYNONYM IF EXISTS [dbo].[OpenLien_Diff] ;
    DROP SYNONYM IF EXISTS [dbo].[MLS] ;
    DROP VIEW IF EXISTS [dbo].[KeysTable] ;

    IF @Type = 'OpenLien'
        BEGIN
            SET @SQL = N'CREATE SYNONYM [dbo].[OpenLien_Diff] FOR ' + @TableName ;

            EXEC( @SQL ) ;

            SET @SQL = N'CREATE OR ALTER VIEW [dbo].[KeysTable]
AS
SELECT
	[Quantarium_Internal_PID]
FROM ' +    @TableName ;

            EXEC( @SQL ) ;
        END ;
    ELSE IF @Type = 'MLS'
             BEGIN
                 SET @SQL = N'CREATE SYNONYM [dbo].[MLS] FOR ' + @TableName ;

                 EXEC( @SQL ) ;

                 SET @SQL = N'CREATE OR ALTER VIEW [dbo].[KeysTable]
AS
SELECT
	[PRD_Property_ID] as [Quantarium_Internal_PID]
FROM ' +         @TableName + N' [m]
WHERE [m].[in_status] = ''A''' ;

                 EXEC( @SQL ) ;
             END ;

    SET @SQL = NULL ;

    DROP TABLE IF EXISTS [dbo].[OpenLien_DiffKeys] ;

    SELECT [a].[Quantarium_Internal_PID]
    INTO [dbo].[OpenLien_DiffKeys]
    FROM [dbo].[OpenLien] AS [a]
    WHERE EXISTS ( SELECT 1 FROM [dbo].[KeysTable] AS [b] WHERE [a].[Quantarium_Internal_PID] = [b].[Quantarium_Internal_PID] ) AND @Debug = 0
    OPTION( RECOMPILE ) ;

    SET @OpenLien_DiffKeysCnt = @@ROWCOUNT ;

    IF @Debug = 0 AND @OpenLien_DiffKeysCnt = 0
        GOTO FINISHED ;

    INSERT [dbo].[OpenLien_DiffKeys_Archive] WITH( TABLOCK )
    SELECT
        @DriverId AS [DriverId]
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

    SET @DemoIndividual_DiffKeysCnt = @@ROWCOUNT ;

    INSERT [dbo].[DemoIndividual_DiffKeys_Archive] WITH( TABLOCK )
    SELECT
        @DriverId AS [DriverId]
      , [d].*
    FROM [dbo].[DemoIndividual_DiffKeys] AS [d] ;

    SET @DemoIndividual_DiffKeys_ArchiveCnt = @@ROWCOUNT ;

    INSERT [dbo].[DemoIndividual_Archive] WITH( TABLOCK )
    SELECT
        @DriverId AS [DriverId]
      , [dk].[Quantarium_Internal_PID]
      , [di].*
    FROM [dbo].[DemoIndividual] AS [di]
    INNER JOIN [dbo].[DemoIndividual_DiffKeys] AS [dk] ON [dk].[QId] = [di].[QId]
    WHERE @Debug = 0
    OPTION( RECOMPILE ) ;

    SET @DemoIndividual_Archive = @@ROWCOUNT ;

    IF @Type = 'OpenLien'
        BEGIN
            DELETE [di]
            FROM [dbo].[DemoIndividual] AS [di]
            WHERE EXISTS ( SELECT 1 FROM [dbo].[DemoIndividual_DiffKeys] AS [dk] WHERE [dk].[QId] = [di].[QId] ) AND @Debug = 0
            OPTION( RECOMPILE ) ;

            SET @DemoIndividual_DelCnt = @@ROWCOUNT ;
        END ;

    INSERT [dbo].[DemoXRef_Archive] WITH( TABLOCK )
    SELECT
        @DriverId AS [DriverId]
      , [d].*
    FROM [dbo].[DemoXRef] AS [d]
    WHERE EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [k] WHERE [k].[Quantarium_Internal_PID] = [d].[Quantarium_Internal_PID] ) AND @Debug = 0
    OPTION( RECOMPILE ) ;

    SET @DemoXRef_ArchiveCnt = @@ROWCOUNT ;

    IF @Type = 'OpenLien'
        BEGIN
            DELETE [d]
            FROM [dbo].[DemoXRef] AS [d]
            WHERE EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [k] WHERE [k].[Quantarium_Internal_PID] = [d].[Quantarium_Internal_PID] ) AND @Debug = 0
            OPTION( RECOMPILE ) ;

            SET @DemoXRef_DelCnt = @@ROWCOUNT ;
        END ;

    INSERT [dbo].[OpenLien_Archive] WITH( TABLOCK )
    SELECT
        @DriverId AS [DriverId]
      , [a].*
    FROM [dbo].[OpenLien] AS [a]
    WHERE EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [k] WHERE [k].[Quantarium_Internal_PID] = [a].[Quantarium_Internal_PID] ) AND @Debug = 0
    OPTION( RECOMPILE ) ;

    SET @OpenLien_ArchiveCnt = @@ROWCOUNT ;

    IF @Type = 'OpenLien'
        BEGIN
            DELETE [a]
            FROM [dbo].[OpenLien] AS [a]
            WHERE EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [k] WHERE [k].[Quantarium_Internal_PID] = [a].[Quantarium_Internal_PID] ) AND @Debug = 0
            OPTION( RECOMPILE ) ;

            SET @OpenLien_DelCnt = @@ROWCOUNT ;
        END ;

    IF @Type = 'OpenLien'
        BEGIN
            INSERT [dbo].[OpenLien] WITH( TABLOCK )
            SELECT *
            FROM [dbo].[OpenLien_Diff]
            WHERE @Debug = 0
            OPTION( RECOMPILE ) ;

            SET @OpenLien_InsCnt = @@ROWCOUNT ;
        END ;
    ELSE IF @Type = 'MLS'
             BEGIN
                 INSERT [dbo].[MLS_Archive] WITH( TABLOCK )
                 SELECT
                     @DriverId AS [DriverId]
                   , [m].*
                 FROM [dbo].[MLS] AS [m]
                 WHERE [m].[in_status] = 'A' AND EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [d] WHERE [d].[Quantarium_Internal_PID] = [m].[PRD_Property_ID] ) AND @Debug = 0
                 OPTION( RECOMPILE ) ;

                 SET @MLS_ArchiveCnt = @@ROWCOUNT ;

                 DELETE [m]
                 FROM [dbo].[MLS] AS [m]
                 WHERE [m].[in_status] = 'A' AND EXISTS ( SELECT 1 FROM [dbo].[OpenLien_DiffKeys] AS [d] WHERE [d].[Quantarium_Internal_PID] = [m].[PRD_Property_ID] ) AND @Debug = 0
                 OPTION( RECOMPILE ) ;

                 SET @MLS_DelCnt = @@ROWCOUNT ;
             END ;

    FINISHED:
    UPDATE [d]
    SET
        [d].[OpenLien_DiffKeysCnt] = @OpenLien_DiffKeysCnt
      , [d].[DemoIndividual_DiffKeysCnt] = @DemoIndividual_DiffKeysCnt
      , [d].[DemoIndividual_DiffKeys_ArchiveCnt] = @DemoIndividual_DiffKeys_ArchiveCnt
      , [d].[DemoIndividual_Archive] = @DemoIndividual_Archive
      , [d].[DemoIndividual_DelCnt] = @DemoIndividual_DelCnt
      , [d].[DemoXRef_ArchiveCnt] = @DemoXRef_ArchiveCnt
      , [d].[DemoXRef_DelCnt] = @DemoXRef_DelCnt
      , [d].[OpenLien_ArchiveCnt] = @OpenLien_ArchiveCnt
      , [d].[OpenLien_DelCnt] = @OpenLien_DelCnt
      , [d].[OpenLien_InsCnt] = @OpenLien_InsCnt
      , [d].[MLS_ArchiveCnt] = @MLS_ArchiveCnt
      , [d].[MLS_DelCnt] = @MLS_DelCnt
      , [d].[Status] = 100
      , [d].[DateEnded] = GETDATE()
      , [d].[SQL] = @SQL
      , [d].[ErrorLine] = NULL
      , [d].[ErrorMessage] = NULL
      , [d].[ErrorNumber] = NULL
      , [d].[ErrorSeverity] = NULL
      , [d].[ErrorState] = NULL
    FROM [Control].[Driver] AS [d]
    WHERE [d].[DriverId] = @DriverId ;
END TRY
BEGIN CATCH
    UPDATE [d]
    SET
        [d].[OpenLien_DiffKeysCnt] = @OpenLien_DiffKeysCnt
      , [d].[DemoIndividual_DiffKeysCnt] = @DemoIndividual_DiffKeysCnt
      , [d].[DemoIndividual_DiffKeys_ArchiveCnt] = @DemoIndividual_DiffKeys_ArchiveCnt
      , [d].[DemoIndividual_Archive] = @DemoIndividual_Archive
      , [d].[DemoIndividual_DelCnt] = @DemoIndividual_DelCnt
      , [d].[DemoXRef_ArchiveCnt] = @DemoXRef_ArchiveCnt
      , [d].[DemoXRef_DelCnt] = @DemoXRef_DelCnt
      , [d].[OpenLien_ArchiveCnt] = @OpenLien_ArchiveCnt
      , [d].[OpenLien_DelCnt] = @OpenLien_DelCnt
      , [d].[OpenLien_InsCnt] = @OpenLien_InsCnt
      , [d].[MLS_ArchiveCnt] = @MLS_ArchiveCnt
      , [d].[MLS_DelCnt] = @MLS_DelCnt
      , [d].[Status] = 90
      , [d].[DateEnded] = GETDATE()
      , [d].[SQL] = @SQL
      , [d].[ErrorLine] = ERROR_LINE()
      , [d].[ErrorMessage] = ERROR_MESSAGE()
      , [d].[ErrorNumber] = ERROR_NUMBER()
      , [d].[ErrorSeverity] = ERROR_SEVERITY()
      , [d].[ErrorState] = ERROR_STATE()
    FROM [Control].[Driver] AS [d]
    WHERE [d].[DriverId] = @DriverId ;
END CATCH ;
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
