DECLARE
    @SQL    NVARCHAR(MAX)
  , @Input  NVARCHAR(MAX) =
    N'Income_Code	Income_Description
1	Up to $10,000
2	$10,000 to $14,999
3	$15,000 to $19,999
4	$20,000 to $24,999
5	$25,000 to $29,999
6	$30,000 to $34,999
7	$35,000 to $39,999
8	$40,000 to $44,999
9	$45,000 to $49,999
A	$50,000 to $54,999
B	$55,000 to $59,999
C	$60,000 to $64,999
D	$65,000 to $74,999
E	$75,000 to $99,999
F	$100,000 to $149,999
G	$150,000 to $174,999
H	$175,000 to $199,999
I	$200,000 to $249,999
J	$250,000 to $499,999
K	$500,000 to $999,999
L	$1,000,000 to $1,999,999
M	$2,000,000 to $4,999,999
N	Over $5,000,000'
  , @Output NVARCHAR(MAX) ;

EXEC [dbo].[sp_Values] @Input = @Input, @PrintOutput = 0, @Output = @Output OUTPUT ;

DECLARE @TempTableName VARCHAR(MAX) = CONCAT('[##Table_', LEFT(REPLACE(NEWID(), '-', ''), 12), ']') ;

SELECT @TempTableName ;
SET @SQL = CONCAT('SELECT * INTO ', @TempTableName, ' FROM(', @Output, ') [k]') ;

EXEC( @SQL ) ;

--EXEC ('SELECT * FROM ' + @TempTableName)
SELECT
    CONCAT(
        'DROP TABLE IF EXISTS ' , MAX(CASE WHEN [column_ordinal] = 1 THEN QUOTENAME(REPLACE([name], '_', ''))END), '

SELECT ', STRING_AGG(CASE WHEN [column_ordinal] = 2 AND [name] LIKE '%Description' THEN CONCAT(QUOTENAME([name]), ' as [Description]')ELSE QUOTENAME([name])END, ',
'), '
INTO ', MAX(CASE WHEN [column_ordinal] = 1 THEN QUOTENAME(REPLACE([name], '_', ''))END), '
FROM (', @Output, ') [k]

CREATE UNIQUE CLUSTERED INDEX ', MAX(CASE WHEN [column_ordinal] = 1 THEN QUOTENAME([name])END), ' ON ', MAX(CASE WHEN [column_ordinal] = 1 THEN QUOTENAME(REPLACE([name], '_', ''))END), ' (', MAX(CASE WHEN [column_ordinal] = 1 THEN QUOTENAME([name])END), ')
CREATE UNIQUE NONCLUSTERED INDEX ', MAX(CASE WHEN [column_ordinal] = 2 AND [name] LIKE '%Description' THEN '[Description]' WHEN [column_ordinal] = 2 THEN QUOTENAME([name])END), ' ON ', MAX(CASE WHEN [column_ordinal] = 1 THEN QUOTENAME(REPLACE([name], '_', ''))END), ' ('
      , MAX(CASE WHEN [column_ordinal] = 2 AND [name] LIKE '%Description' THEN '[Description]' WHEN [column_ordinal] = 2 THEN QUOTENAME([name])END))
FROM [sys].[dm_exec_describe_first_result_set]('SELECT * FROM ' + @TempTableName, NULL, NULL) ;

