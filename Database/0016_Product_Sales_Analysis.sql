-- =============================================
-- TEST QUERY PERFORMANCE
-- =============================================
-- Statisitcs for performace analysis on
SET STATISTICS TIME ON;  -- Shows query execution time
SET STATISTICS IO ON;    -- Shows I/O statistics

-- Query
SELECT 
	PROD.product_code AS 'Product',
	TEMP.calendar_year AS 'Year',
	REGION.region_province AS 'Province',
	SUM(FACT.sales_amount_with_discount) AS 'Total Sales'
FROM CUSTOMER_SALES_FACT AS FACT
	JOIN REGION_DIM AS REGION ON FACT.region_key = REGION.region_key
	JOIN DATE_DIM AS TEMP ON FACT.date_key = TEMP.date_key
	JOIN PRODUCT_DIM AS PROD ON FACT.product_key = PROD.product_key
GROUP BY PROD.product_code, REGION.region_province, TEMP.calendar_year
ORDER BY TEMP.calendar_year, REGION.region_province


-- Statisitcs for performace analysis off
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
