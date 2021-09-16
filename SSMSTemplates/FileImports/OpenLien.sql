USE [Evan] ;
GO
DECLARE
    @TableName NVARCHAR(MAX) = N'Houseamp_WA_OL_Chg_20210913'
  , @Distinct  BIT           = 1 ;

--SET @TableName = N'Quantarium_Houseamp_WA_Select_OpenLien_20210622' ;
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
FROM [Definition].[vOpenLien] AS [v] ;

SELECT @SQL AS [SQL] ;

EXEC( @SQL ) ;

SET @BCP = CONCAT('bcp "[Evan].[dbo].[', @TableName, ']" format nul -c -x -f C:\Evan\OpenLien.xml -t"', CHAR(9), '" -S 192.168.1.19 -U gvarol -P C@n@n6132') ;

SELECT @BCP AS [BCP] ;

EXEC @Return = [sys].[xp_cmdshell] @BCP ;

SET @SQL = CONCAT(CAST(NULL AS NVARCHAR(MAX)), 'CREATE OR ALTER VIEW [dbo].[v', @TableName, ']
AS
SELECT
   [DataFile].*
FROM
	OPENROWSET(BULK ''C:\Evan\', @TableName, '.txt'',
	FORMATFILE = ''C:\Evan\OpenLien.xml'',
	FIRSTROW = 2) AS [DataFile];
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
SELECT
	', STRING_AGG(
           CONCAT(
               CAST(NULL AS VARCHAR(MAX)), 'CASE WHEN TRIM([', [v].[ColumnName], ']) IN ('''',''NULL'') THEN NULL ELSE TRIM([', [v].[ColumnName], ']) END AS ['
             , [v].[FieldName], ']'), ',
	')WITHIN GROUP(ORDER BY [v].[Field #]), '
FROM [dbo].[v', @TableName, '] )[k]

SET @RowCount = @@ROWCOUNT

CREATE CLUSTERED COLUMNSTORE INDEX [CCI] ON [dbo].[', @TableName, ']

CREATE UNIQUE NONCLUSTERED INDEX [Quantarium_Internal_PID] ON [', @TableName, '] ([Quantarium_Internal_PID]) WITH (DATA_COMPRESSION = ROW)
')
FROM [Definition].[vOpenLien] AS [v] ;

SELECT @SQL AS [SQL] ;

EXEC [sys].[sp_executesql] @SQL, N'@RowCount BIGINT OUTPUT', @RowCount OUTPUT ;

SELECT
    @TableName AS [TableName]
  , @RowCount AS [RowCount] ;
GO

RETURN ;

SELECT
    [Quantarium_Internal_PID]
  , COUNT(1) AS [Cnt]
FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien_20210622]
GROUP BY [Quantarium_Internal_PID]
HAVING COUNT(1) > 1
ORDER BY COUNT(1) DESC ;

SELECT COUNT(1)
FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien_20210622]
WHERE [Quantarium_Internal_PID] = 144947666 ;

SELECT COUNT(1)
FROM( SELECT DISTINCT * FROM [dbo].[Quantarium_Houseamp_WA_Select_OpenLien_20210622] WHERE [Quantarium_Internal_PID] = 144947666 ) AS [k] ;
