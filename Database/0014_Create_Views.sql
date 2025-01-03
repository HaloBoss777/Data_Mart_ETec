-- =====================================
-- View Creation For Reporting
-- =====================================

-- Date Dimension View
CREATE VIEW vw_Date_Dimension AS
SELECT *
FROM DATE_DIM;

-- Product Dimension View
CREATE VIEW vw_Product_Dimension AS
SELECT product_key, product_gender, product_material, product_style, product_colour, product_branding, product_fault_indicator, product_category, product_brand, product_is_current
FROM PRODUCT_DIM;

-- Supplier Dimension View
CREATE VIEW vw_Supplier_Dimension AS
SELECT *
FROM SUPPLIER_DIM;

-- Customer Dimension View
CREATE VIEW vw_Customer_Dimension AS
SELECT customer_key, customer_category, customer_is_current
FROM CUSTOMER_DIM;

-- Region Dimension View
CREATE VIEW vw_Region_Dimension AS
SELECT *
FROM REGION_DIM;

-- Representative Dimension View
CREATE VIEW vw_Representative_Dimension AS
SELECT *
FROM REPRESENTATIVE_DIM;

-- Transaction Dimension View
CREATE VIEW vw_Transaction_Dimension AS
SELECT *
FROM TRANSACTION_DIM;

-- Customer Sales Fact View
CREATE VIEW vw_Customer_Sales_Fact AS
SELECT
	-- Selecting facts
    csf.date_key,
    csf.product_key,
    csf.customer_key,
	csf.region_key,
	csf.supplier_key,
	csf.representative_key,
	csf.transaction_key,
	csf.document_number,
    csf.quantity,
    csf.sales_amount,
    csf.discount,
	csf.discount_percentage,
    csf.sales_amount_with_discount,
    csf.product_sell_price,
    csf.product_bought_price,

	-- Calculative Fields
	((csf.product_sell_price - csf.product_bought_price) * csf.quantity - csf.discount) AS profit,
	(csf.product_bought_price * csf.quantity) AS total_cost

FROM CUSTOMER_SALES_FACT AS csf;