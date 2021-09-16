USE [Evan] ;
GO
DECLARE
    @TableName NVARCHAR(MAX) = N'Quantarium_Houseamp_WA_Select_DemoInd_20210622'
  , @Distinct  BIT           = 1 ;

SET @TableName = PARSENAME(@TableName, 1) ;

DECLARE
    @SQL      NVARCHAR(MAX)
  , @BCP      VARCHAR(4000)
  , @RowCount BIGINT
  , @Return   INT ;

SELECT @SQL = CONCAT('DROP TABLE IF EXISTS [dbo].[', @TableName, ']
CREATE TABLE [dbo].[', @TableName, '](
	', STRING_AGG(CONCAT(CAST(QUOTENAME([v].[ColumnName]) AS VARCHAR(MAX)), ' VARCHAR(8000)'), ',
	')WITHIN GROUP(ORDER BY [v].[Field #]), '
)')
FROM [Definition].[vIndividual] AS [v] ;

SELECT @SQL AS [SQL] ;

EXEC( @SQL ) ;

SET @BCP = CONCAT('bcp "[Evan].[dbo].[', @TableName, ']" format nul -c -x -f C:\Evan\Individual.xml -t"', CHAR(9), '" -S 192.168.1.19 -U gvarol -P C@n@n6132') ;

SELECT @BCP AS [BCP] ;

EXEC @Return = [sys].[xp_cmdshell] @BCP ;

SET @SQL = CONCAT(CAST(NULL AS NVARCHAR(MAX)), 'CREATE OR ALTER VIEW [dbo].[v', @TableName, ']
AS
SELECT
   [DataFile].*
FROM
	OPENROWSET(BULK ''C:\Evan\', @TableName, '.txt'',
	FORMATFILE = ''C:\Evan\Individual.xml'',
	FIRSTROW = 2) AS [DataFile];
') ;

SELECT @SQL AS [SQL] ;

EXEC( @SQL ) ;

SELECT @SQL = CONCAT('DROP TABLE IF EXISTS [dbo].[', @TableName, ']

SELECT', CASE WHEN @Distinct = 1 THEN ' DISTINCT' END, '
	', STRING_AGG(REPLACE([v].[Casted], '[Column]', QUOTENAME([v].[FieldName])), ',
	')WITHIN GROUP(ORDER BY [v].[Field #]), '
INTO [dbo].[', @TableName, ']
FROM(
SELECT
	', STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), 'CASE WHEN TRIM([', [v].[ColumnName], ']) IN ('''',''NULL'') THEN NULL ELSE TRIM([', [v].[ColumnName], ']) END AS [', [v].[FieldName], ']'), ',
	')WITHIN GROUP(ORDER BY [v].[Field #]), '
FROM [dbo].[v', @TableName, '] )[k]

SET @RowCount = @@ROWCOUNT

CREATE CLUSTERED COLUMNSTORE INDEX [CCI] ON [dbo].[', @TableName, ']

CREATE UNIQUE NONCLUSTERED INDEX [QId] ON [', @TableName, '] ([QId]) WITH (DATA_COMPRESSION = ROW)
')
FROM [Definition].[vIndividual] AS [v] ;

SELECT @SQL AS [SQL] ;

EXEC [sys].[sp_executesql] @SQL, N'@RowCount BIGINT OUTPUT', @RowCount OUTPUT ;

SELECT
    @TableName AS [TableName]
  , @RowCount AS [RowCount] ;
GO

RETURN ;
