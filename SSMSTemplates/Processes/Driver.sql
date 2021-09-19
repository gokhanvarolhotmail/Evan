USE [Evan] ;
GO
CREATE TABLE [Control].[DriverStatus] ( [Status] TINYINT NOT NULL PRIMARY KEY CLUSTERED, [Description] VARCHAR(100) NOT NULL UNIQUE NONCLUSTERED ) ;

INSERT [Control].[DriverStatus]( [Status], [Description] )
VALUES( 10, 'Initial' )
    , ( 50, 'Running' )
    , ( 90, 'Failed' )
    , ( 100, 'Succeeded' ) ;

CREATE TABLE [Control].[Driver]
(
    [DriverId]                           INT            IDENTITY NOT NULL
  , [Type]                               VARCHAR(30)    NOT NULL
  , [TableName]                          VARCHAR(256)   NOT NULL
  , [Status]                             TINYINT        NOT NULL CONSTRAINT [Control_Driver$Status_DF] DEFAULT(( 10 ))
  , [OpenLien_DiffKeysCnt]               BIGINT         NULL
  , [DemoIndividual_DiffKeysCnt]         BIGINT         NULL
  , [DemoIndividual_DiffKeys_ArchiveCnt] BIGINT         NULL
  , [DemoIndividual_Archive]             BIGINT         NULL
  , [DemoIndividual_DelCnt]              BIGINT         NULL
  , [DemoXRef_ArchiveCnt]                BIGINT         NULL
  , [DemoXRef_DelCnt]                    BIGINT         NULL
  , [OpenLien_ArchiveCnt]                BIGINT         NULL
  , [OpenLien_DelCnt]                    BIGINT         NULL
  , [OpenLien_InsCnt]                    BIGINT         NULL
  , [MLS_ArchiveCnt]                     BIGINT         NULL
  , [MLS_DelCnt]                         BIGINT         NULL
  , [DateAdded]                          DATETIME2(3)   NOT NULL CONSTRAINT [Control_Driver$DateAdded_GETDATE_DF] DEFAULT( GETDATE())
  , [DateStarted]                        DATETIME2(3)   NULL
  , [DateEnded]                          DATETIME2(3)   NULL
  , [SQL]                                NVARCHAR(MAX)  NULL
  , [ErrorLine]                          INT            NULL
  , [ErrorMessage]                       NVARCHAR(4000) NULL
  , [ErrorNumber]                        INT            NULL
  , [ErrorSeverity]                      INT            NULL
  , [ErrorState]                         INT            NULL
)TEXTIMAGE_ON [PRIMARY] ;
GO
ALTER TABLE [Control].[Driver] ADD CONSTRAINT [Control_Driver_PKC] PRIMARY KEY CLUSTERED( [DriverId] )WITH( SORT_IN_TEMPDB = ON )ON [PRIMARY] ;
GO
ALTER TABLE [Control].[Driver] ADD CONSTRAINT [CK__Driver__TableNam__64CCF2AE] CHECK( CONCAT(QUOTENAME(PARSENAME([TableName], ( 2 ))), '.', QUOTENAME(PARSENAME([TableName], ( 1 )))) = [TableName] ) ;
GO
ALTER TABLE [Control].[Driver] ADD CONSTRAINT [CK__Driver__Type__63D8CE75] CHECK( [Type] = 'MLS' OR [Type] = 'OpenLien' ) ;
GO
ALTER TABLE [Control].[Driver] ADD CONSTRAINT [Control_Driver$Status_Control_DriverStatus_FK] FOREIGN KEY( [Status] )REFERENCES [Control].[DriverStatus]( [Status] ) ;
GO

ALTER TABLE [Control].[Driver] ADD UNIQUE NONCLUSTERED( [TableName] ) ;