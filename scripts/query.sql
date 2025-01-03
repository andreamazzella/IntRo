-- Used in 10_sql.qmd
SELECT Period, OfficialCode, GeoName, SexDesc, AgeDesc, Population
   FROM Populations.dbo.vRes21_PHEC15_SingleYear
   WHERE (Age = 0)