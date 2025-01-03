-- =============================================
-- TEST QUERY PERFORMANCE
-- =============================================
-- Statisitcs for performace analysis on
SET STATISTICS TIME ON;  -- Shows query execution time
SET STATISTICS IO ON;    -- Shows I/O statistics

-- Query
SELECT 
	REP.representative_key AS 'Representative Identity',
	REGION.region_province AS 'Province',
	TEMP.calendar_year AS 'Date',
	SUM(FACT.sales_amount_with_discount) AS 'Sales Total'
FROM CUSTOMER_SALES_FACT AS FACT
	JOIN REPRESENTATIVE_DIM AS REP ON FACT.representative_key = REP.representative_key
	JOIN REGION_DIM AS REGION ON FACT.region_key = REGION.region_key
	JOIN DATE_DIM AS TEMP ON FACT.date_key = TEMP.date_key
WHERE REGION.region_key = 2 AND TEMP.calendar_year = 2019
GROUP BY REP.representative_key, REGION.region_province, TEMP.calendar_year
ORDER BY REP.representative_key


-- Statisitcs for performace analysis off
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
