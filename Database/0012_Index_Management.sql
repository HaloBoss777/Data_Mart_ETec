-- =============================================
-- Index Management in SQL Server
-- =============================================

-- =============================================
-- LIST ALL INDEXES IN THE DATABASE
-- =============================================
SELECT 
	t.name AS table_name,
	i.name AS index_name,
	i.type_desc AS index_type,
	i.is_unique,                          -- Shows if the index is unique
	i.is_primary_key,                     -- Indicates if it is a primary key index
	STRING_AGG(c.name, ', ') AS columns   -- List of columns in the index
FROM 
	sys.indexes i
	INNER JOIN sys.tables t ON i.object_id = t.object_id
	INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
	INNER JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = ic.column_id
WHERE 
	i.type > 0                            -- Excludes heap indexes (type = 0)
	AND t.is_ms_shipped = 0               -- Excludes system tables
GROUP BY 
	t.name, i.name, i.type_desc, i.is_unique, i.is_primary_key
ORDER BY 
	t.name, i.name;

-- =============================================
-- CREATE INDEXES
-- =============================================
-- DATE_DIM
CREATE NONCLUSTERED INDEX idx_fiscal_month ON [dbo].[DATE_DIM] ([fiscal_month]);
CREATE NONCLUSTERED INDEX idx_calander_year ON [dbo].[DATE_DIM] ([calendar_year]);
CREATE NONCLUSTERED INDEX idx_calendar_quarter ON [dbo].[DATE_DIM] ([calendar_quarter]);
CREATE NONCLUSTERED INDEX idx_day_in_month ON [dbo].[DATE_DIM] ([day_number_in_calendar_month]);

-- SUPPLIER_DIM
CREATE NONCLUSTERED INDEX idx_suppier_name ON [dbo].[SUPPLIER_DIM] ([supplier_name]);

-- REGION_DIM
CREATE NONCLUSTERED INDEX idx_region_provice ON [dbo].[REGION_DIM] ([region_province]);

-- PRODUCT_DIM
CREATE NONCLUSTERED INDEX idx_product_branding ON [dbo].[PRODUCT_DIM] ([product_branding]);
CREATE NONCLUSTERED INDEX idx_product_material ON [dbo].[PRODUCT_DIM] ([product_material]);
CREATE NONCLUSTERED INDEX idx_product_style ON [dbo].[PRODUCT_DIM] ([product_style]);
CREATE NONCLUSTERED INDEX idx_product_gender ON [dbo].[PRODUCT_DIM] ([product_gender]);

-- REPRESENTATIVE_DIM
CREATE NONCLUSTERED INDEX idx_representative_identification ON [dbo].[REPRESENTATIVE_DIM] ([representative_identification]);

-- FACT TABLE CUSTOMER_SALES_FACT
CREATE NONCLUSTERED INDEX idx_customer_sales_fact_document_number ON [dbo].[CUSTOMER_SALES_FACT] ([document_number]);


-- =============================================
-- DROP INDEXES
-- =============================================
-- DATE_DIM
DROP INDEX idx_fiscal_month ON [dbo].[DATE_DIM];
DROP INDEX idx_calander_year ON [dbo].[DATE_DIM];
DROP INDEX idx_calendar_quarter ON [dbo].[DATE_DIM];
DROP INDEX idx_day_in_month ON [dbo].[DATE_DIM];

-- SUPPLIER_DIM
DROP INDEX idx_suppier_name ON [dbo].[SUPPLIER_DIM];

-- REGION_DIM
DROP INDEX idx_region_provice ON [dbo].[REGION_DIM];

-- PRODUCT_DIM
DROP INDEX idx_product_branding ON [dbo].[PRODUCT_DIM];
DROP INDEX idx_product_material ON [dbo].[PRODUCT_DIM];
DROP INDEX idx_product_style ON [dbo].[PRODUCT_DIM];
DROP INDEX idx_product_gender ON [dbo].[PRODUCT_DIM];

-- REPRESENTATIVE_DIM
DROP INDEX idx_representative_identification ON [dbo].[REPRESENTATIVE_DIM];

-- FACT TABLE CUSTOMER_SALES_FACT
DROP INDEX idx_customer_sales_fact_document_number ON [dbo].[CUSTOMER_SALES_FACT];


-- =============================================
-- TEST QUERY PERFORMANCE
-- =============================================
-- You can use the following commands to test the performance before and after creating indexes.
-- SET STATISTICS TIME ON;  -- Shows query execution time
-- SET STATISTICS IO ON;    -- Shows I/O statistics

-- Example query to test:
-- SELECT fiscal_month, fiscal_year FROM [dbo].[DATE_DIM] WHERE fiscal_month = 3;

-- SET STATISTICS TIME OFF;
-- SET STATISTICS IO OFF;