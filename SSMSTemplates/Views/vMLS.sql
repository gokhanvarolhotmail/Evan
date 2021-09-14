USE [Evan] ;
GO
CREATE OR ALTER VIEW [Definition].[vMLS]
AS
SELECT
    *
  , CAST(CONCAT('CAST([Column] AS ', [k].[ColumnDef], ') AS ', QUOTENAME(REPLACE([k].[FieldName], ' ', '_'))) AS VARCHAR(MAX)) AS [Casted]
FROM( SELECT [FieldNo] AS [Field #], [FieldName], [MaxLen] AS [Max_Length], [Numbers], [DataType] AS [Data_Type], [ColumnDef] FROM [Definition].[MLS] ) AS [k] ;
GO
;