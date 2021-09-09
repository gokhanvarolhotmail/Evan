USE [Evan] ;
GO
SELECT
    CASE WHEN [Field #] BETWEEN 4 AND 9 THEN 'Contact Name'
        WHEN [Field #] BETWEEN 10 AND 27 THEN 'Individual'
        WHEN [Field #] BETWEEN 28 AND 63 THEN 'Address'
        WHEN [Field #] BETWEEN 64 AND 75 THEN 'Email/Phone'
        WHEN [Field #] BETWEEN 46 AND 140 THEN 'Household'
        WHEN [Field #] BETWEEN 141 AND 164 THEN 'Income/Financial'
        WHEN [Field #] BETWEEN 165 AND 184 THEN 'Property'
        WHEN [Field #] BETWEEN 185 AND 220 THEN 'Mortgage and Loan'
        WHEN [Field #] BETWEEN 221 AND 232 THEN 'Donor'
        WHEN [Field #] BETWEEN 233 AND 245 THEN 'Credit Card'
        WHEN [Field #] BETWEEN 246 AND 260 THEN 'Lifestyle/Interest/Culture'
        WHEN [Field #] BETWEEN 261 AND 355 THEN 'Hobby/Interest'
        WHEN [Field #] BETWEEN 356 AND 383 THEN 'Buying Activity'
        WHEN [Field #] BETWEEN 384 AND 386 THEN 'Production Information'
    END AS [FieldGroup]
  , *
INTO [IndividualLayout]
FROM [#temp2] ;

CREATE UNIQUE CLUSTERED INDEX [Field #] ON [dbo].[IndividualLayout]( [Field #] ) ;

CREATE UNIQUE NONCLUSTERED INDEX [Field Name] ON [dbo].[IndividualLayout]( [Field Name] ) ;
