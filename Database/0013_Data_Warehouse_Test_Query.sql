-- =============================================
-- TEST QUERY PERFORMANCE SCRIPT
-- =============================================
-- This script can be used to test query performance 
-- before and after creating indexes on the data warehouse.
-- =============================================

-- Enable statistics to show query execution time and I/O stats
SET STATISTICS TIME ON;  -- Shows query execution time
SET STATISTICS IO ON;    -- Shows I/O statistics

-- =============================================
-- Test Query
-- =============================================
SELECT 
    -- Selecting facts
    csf.date_key,
    csf.product_key,
    csf.customer_key,
    csf.quantity,
    csf.sales_amount,
    csf.discount,
    csf.sales_amount_with_discount,
    csf.product_sell_price,
    csf.product_bought_price,
    
    -- Calculated fields
    (csf.sales_amount - csf.discount) AS net_sales_amount,
    (csf.product_sell_price - csf.product_bought_price) AS profit_margin,
    
    -- Date Dimension details
    dd.calendar_year,
    dd.calendar_month,
    dd.day_of_week,

    -- Customer Dimension details
    cd.customer_identification,
    cd.customer_category,
    cd.customer_is_current,

    -- Product Dimension details
    pd.product_code,
    pd.product_category,
    pd.product_brand,
    pd.product_is_current,

    -- Region Dimension details
    rd.region_country,
    rd.region_province,
    rd.region_city,

    -- Supplier Dimension details
    sd.supplier_name,
    sd.supplier_exclusive,
    sd.supplier_credit_limit,

    -- Representative Dimension details
    rdim.representative_identification,
    rdim.representative_type,
    rdim.representative_commission,

    -- Transaction Dimension details
    td.transaction_type

FROM 
    customer_sales_fact csf

-- Joining with the Date Dimension
JOIN date_dim dd 
    ON csf.date_key = dd.date_key

-- Joining with the Customer Dimension
JOIN customer_dim cd 
    ON csf.customer_key = cd.customer_key

-- Joining with the Product Dimension
JOIN product_dim pd 
    ON csf.product_key = pd.product_key

-- Joining with the Region Dimension
JOIN region_dim rd 
    ON csf.region_key = rd.region_key

-- Joining with the Supplier Dimension
JOIN supplier_dim sd 
    ON csf.supplier_key = sd.supplier_key

-- Joining with the Representative Dimension
JOIN representative_dim rdim 
    ON csf.representative_key = rdim.representative_key

-- Joining with the Transaction Dimension
JOIN transaction_dim td 
    ON csf.transaction_key = td.transaction_key

-- Filtering for active customers and products
WHERE 
    cd.customer_is_current = 1
    AND pd.product_is_current = 1

-- Aggregating data by region, product, and time period
GROUP BY 
    csf.date_key, csf.product_key, csf.customer_key, csf.quantity, csf.sales_amount, 
    csf.discount, csf.sales_amount_with_discount, csf.product_sell_price, csf.product_bought_price,
    dd.calendar_year, dd.calendar_month, dd.day_of_week,
    cd.customer_identification, cd.customer_category, cd.customer_is_current,
    pd.product_code, pd.product_category, pd.product_brand, pd.product_is_current,
    rd.region_country, rd.region_province, rd.region_city,
    sd.supplier_name, sd.supplier_exclusive, sd.supplier_credit_limit,
    rdim.representative_identification, rdim.representative_type, rdim.representative_commission,
    td.transaction_type

-- Ordering by net sales amount
ORDER BY 
    net_sales_amount DESC;

-- =============================================
-- Example query for testing (optional)
-- SELECT fiscal_month, fiscal_year FROM [dbo].[DATE_DIM] WHERE fiscal_month = 3;
-- =============================================

-- Disable statistics after the query
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
