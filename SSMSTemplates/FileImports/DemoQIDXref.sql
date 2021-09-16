USE [Evan] ;
GO
DECLARE
    @TableName        NVARCHAR(MAX) = N'Quantarium_Houseamp_WA_Select_DemoXref_20210622'
  , @Distinct         BIT           = 1
  , @CreateFormatFile BIT           = 1 ;

SET @TableName = PARSENAME(@TableName, 1) ;

DECLARE
    @SQL      NVARCHAR(MAX)
  , @BCP      VARCHAR(4000)
  , @RowCount BIGINT
  , @Return   INT ;

IF @CreateFormatFile = 1
    BEGIN
        DROP TABLE IF EXISTS [#cols] ;

        SELECT *
        INTO [#cols]
        FROM [Util].[dbo].ParseDelimited(
                 'Location_ID	Household_ID_Owner_1	Individual_ID_Owner_1	Age_Owner_1	Ethnic_Code_Owner_1	Gender_Owner_1	Quantarium_Owner_Name_1_Matched_Ind	Quantarium_Demo_QId_1	Household_ID_Owner_2	Individual_ID_Owner_2	Age_Owner_2	Ethnic_Code_Owner_2	Gender_Owner_2	Quantarium_Owner_Name_2_Matched_Ind	Quantarium_Demo_QId_2	Quantarium_Internal_PID	FIPS_Code	CountyName	Assessors_Parcel_Number	Quantarium_Standardized_Land_Use_Code	UseDesc	Quantarium_Res_/_NonRes	Quantarium_Owner_Occupied	Quantarium_Address_Matched_Ind	Quantarium_Number_Of_Owners_On_Asmt	Quantarium_Number_Of_Owners_On_Demo	Start_Date	CrossRefQId	Processed_Date'
               , '	') ;

        SELECT @SQL = CONCAT('DROP TABLE IF EXISTS [dbo].[', @TableName, ']
CREATE TABLE [dbo].[', @TableName, '](
	', STRING_AGG(CONCAT(CAST(QUOTENAME([Field]) AS VARCHAR(MAX)), ' VARCHAR(4000)'), ',
	')WITHIN GROUP(ORDER BY [FieldNum]), '
)')
        FROM [#cols] ;

        SELECT @SQL AS [SQL] ;

        EXEC( @SQL ) ;

        SET @BCP = CONCAT('bcp "[Evan].[dbo].[', @TableName, ']" format nul -c -x -f C:\Evan\DemoQIDXref.xml -t"', CHAR(9), '" -S 192.168.1.19 -U gvarol -P C@n@n6132') ;

        SELECT @BCP AS [BCP] ;

        EXEC @Return = [sys].[xp_cmdshell] @BCP ;
    END ;

SET @SQL = CONCAT(CAST(NULL AS NVARCHAR(MAX)), 'CREATE OR ALTER VIEW [dbo].[v', @TableName, ']
AS
SELECT
   [DataFile].*
FROM
	OPENROWSET(BULK ''C:\Evan\', @TableName, '.txt'',
	FORMATFILE = ''C:\Evan\DemoQIDXref.xml'',
	FIRSTROW = 2) AS [DataFile];
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
SELECT
	', STRING_AGG(CONCAT(CAST(NULL AS VARCHAR(MAX)), 'CASE WHEN TRIM([', [c].[Field], ']) IN ('''',''NULL'') THEN NULL ELSE TRIM([', [c].[Field], ']) END AS [', [c].[Field], ']'), ',
	')WITHIN GROUP(ORDER BY [c].[FieldNum]), '
FROM [dbo].[v', @TableName, '] )[k]

SET @RowCount = @@ROWCOUNT

CREATE UNIQUE CLUSTERED INDEX [Location_ID] ON [', @TableName, '] ([Location_ID]) WITH (DATA_COMPRESSION = ROW)
')
FROM [#cols] AS [c]
FULL OUTER JOIN [Definition].[vDemoQIDXref] AS [v] ON [v].[Field #] = [c].[FieldNum] ;

SELECT @SQL AS [SQL] ;

EXEC [sys].[sp_executesql] @SQL, N'@RowCount BIGINT OUTPUT', @RowCount OUTPUT ;

SELECT
    @TableName AS [TableName]
  , @RowCount AS [RowCount] ;
GO

RETURN ;

SELECT *
FROM [#cols] ;

SELECT *
FROM [Definition].[vDemoQIDXref] ;
