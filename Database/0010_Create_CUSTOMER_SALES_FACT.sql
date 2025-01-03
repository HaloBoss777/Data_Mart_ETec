IF NOT EXISTS (SELECT * FROM sysobjects WHERE [NAME]= 'CUSTOMER_SALES_FACT' AND xtype = 'U')
BEGIN

CREATE TABLE [dbo].[CUSTOMER_SALES_FACT](
	[date_key] int NOT NULL,							-- Part of composite primary key and foreign key to DATE_DIM
	[product_key] int NOT NULL,							-- Part of composite primary key and foreign key to PRODUCT_DIM
	[customer_key] int NOT NULL,						-- Part of composite primary key and foreign key to CUSTOMER_DIM
	[region_key] int NOT NULL,							-- Part of composite primary key and foreign key to REGION_DIM
	[supplier_key] int NOT NULL,						-- Part of composite primary key and foreign key to SUPPLIER_DIM
	[representative_key] int NOT NULL,					-- Part of composite primary key and foreign key to REPRESENTATIVE_DIM
	[transaction_key] int NOT NULL,						-- Part of composite primary key and foreign key to TRANSACTION_DIM
	[document_number] varchar(10) NOT NULL,				-- Link to operational transactional documentation
	[quantity] int NOT NULL,							-- Number of line item purchased
	[sales_amount] decimal(19,4) NOT NULL,				-- Line item total 
	[discount] decimal(19,4) NOT NULL,					-- Discount applied to line item total
	[discount_percentage] decimal(3,2) NOT NULL,		-- Discount percentage to be applied
	[sales_amount_with_discount] decimal(19,4) NOT NULL,-- Line item total after discount
	[product_sell_price] decimal(8, 2) NOT NULL,		-- Sell price of the product
	[product_bought_price] decimal(8,2) NOT NULL,		-- Bought price of the product

	CONSTRAINT [PK_CUSTOMER_SALES_FACT] PRIMARY KEY CLUSTERED
	(
		
		[date_key] ASC,
		[product_key] ASC,
		[customer_key] ASC,
		[region_key] ASC,
		[supplier_key] ASC,
		[representative_key] ASC,
		[transaction_key] ASC,
		[document_number] ASC

	) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

-- Foreign Key Constraints

-- DATE DIMENSION
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_CUSTOMER_SALES_FACT_DATE] FOREIGN KEY([date_key])
REFERENCES [dbo].[DATE_DIM] ([date_key])
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] CHECK CONSTRAINT [FK_CUSTOMER_SALES_FACT_DATE]

-- PRODUCT DIMENSION
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_CUSTOMER_SALES_FACT_PRODUCT] FOREIGN KEY([product_key])
REFERENCES [dbo].[PRODUCT_DIM] ([product_key])
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] CHECK CONSTRAINT [FK_CUSTOMER_SALES_FACT_PRODUCT]

-- CUSTOMER DIMENSION
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_CUSTOMER_SALES_FACT_CUSTOMER] FOREIGN KEY([customer_key])
REFERENCES [dbo].[CUSTOMER_DIM] ([customer_key])
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] CHECK CONSTRAINT [FK_CUSTOMER_SALES_FACT_CUSTOMER]

-- REGION DIMENSION
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_CUSTOMER_SALES_FACT_REGION] FOREIGN KEY([region_key])
REFERENCES [dbo].[REGION_DIM] ([region_key])
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] CHECK CONSTRAINT [FK_CUSTOMER_SALES_FACT_REGION]

-- SUPPLIER DIMENSION
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_CUSTOMER_SALES_FACT_SUPPLIER] FOREIGN KEY([supplier_key])
REFERENCES [dbo].[SUPPLIER_DIM] ([supplier_key])
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] CHECK CONSTRAINT [FK_CUSTOMER_SALES_FACT_SUPPLIER]

-- REPRESENTATIVE DIMENSION
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_CUSTOMER_SALES_FACT_REPRESENTATIVE] FOREIGN KEY ([representative_key])
REFERENCES [dbo].[REPRESENTATIVE_DIM] ([representative_key])
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] CHECK CONSTRAINT [FK_CUSTOMER_SALES_FACT_REPRESENTATIVE]

-- TRANSACTION DIMENSION
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_CUSTOMER_SALES_FACT_TRANSACTION] FOREIGN KEY ([transaction_key])
REFERENCES [dbo].[TRANSACTION_DIM] ([transaction_key])
ALTER TABLE [dbo].[CUSTOMER_SALES_FACT] CHECK CONSTRAINT [FK_CUSTOMER_SALES_FACT_TRANSACTION]

END