IF NOT EXISTS (SELECT * FROM sysobjects WHERE [NAME]= 'SNAPSHOT_SALES_FACT' AND xtype = 'U')
BEGIN

CREATE TABLE [dbo].[SNAPSHOT_SALES_FACT](
	[date_key] int NOT NULL,				-- Part of composite primary key and foreign key to DATE_DIM
	[product_key] int NOT NULL,				-- Part of composite primary key and foreign key to PRODUCT_DIM
	[region_key] int NOT NULL,				-- Part of composite primary key and foreign key to REGION_DIM
	[supplier_key] int NOT NULL,			-- Part of composite primary key and foreign key to SUPPLIER_DIM
	[representative_key] int NOT NULL,		-- Part of composite primary key and foreign key to REPRESENTATIVE_DIM
	[transaction_key] int NOT NULL,			-- Part of composite primary key and foreign key to TRANSACTION_DIM
	[quantity] int NOT NULL,				-- Total number of line item purchased
	[total_sales] decimal(19,4) NOT NULL,	-- Aggregated sales value without discount
	[total_discount] decimal(19,4) NOT NULL,-- Aggregated discount value
	[total_cost] decimal(19,4) NOT NULL,	-- Aggregated product cost
	[gross_profit] decimal(19,4) NOT NULL,	-- Calculated Gross Profit

	CONSTRAINT [PK_SNAPSHOT_SALES_FACT] PRIMARY KEY CLUSTERED
	(
		
		[date_key] ASC,
		[product_key] ASC,
		[region_key] ASC,
		[supplier_key] ASC,
		[representative_key] ASC,
		[transaction_key] ASC

	) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

-- Foreign Key Constraints

-- DATE DIMENSION
ALTER TABLE [dbo].[SNAPSHOT_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_SNAPSHOT_SALES_FACT_DATE] FOREIGN KEY([date_key])
REFERENCES [dbo].[DATE_DIM] ([date_key])
ALTER TABLE [dbo].[SNAPSHOT_SALES_FACT] CHECK CONSTRAINT [FK_SNAPSHOT_SALES_FACT_DATE]

-- PRODUCT DIMENSION
ALTER TABLE [dbo].[SNAPSHOT_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_SNAPSHOT_SALES_FACT_PRODUCT] FOREIGN KEY([product_key])
REFERENCES [dbo].[PRODUCT_DIM] ([product_key])
ALTER TABLE [dbo].[SNAPSHOT_SALES_FACT] CHECK CONSTRAINT [FK_SNAPSHOT_SALES_FACT_PRODUCT]

-- REGION DIMENSION
ALTER TABLE [dbo].[SNAPSHOT_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_SNAPSHOT_SALES_FACT_REGION] FOREIGN KEY([region_key])
REFERENCES [dbo].[REGION_DIM] ([region_key])
ALTER TABLE [dbo].[SNAPSHOT_SALES_FACT] CHECK CONSTRAINT [FK_SNAPSHOT_SALES_FACT_REGION]

-- SUPPLIER DIMENSION
ALTER TABLE [dbo].[SNAPSHOT_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_SNAPSHOT_SALES_FACT_SUPPLIER] FOREIGN KEY([supplier_key])
REFERENCES [dbo].[SUPPLIER_DIM] ([supplier_key])
ALTER TABLE [dbo].[SNAPSHOT_SALES_FACT] CHECK CONSTRAINT [FK_SNAPSHOT_SALES_FACT_SUPPLIER]

-- REPRESENTATIVE DIMENSION
ALTER TABLE [dbo].[SNAPSHOT_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_SNAPSHOT_SALES_FACT_REPRESENTATIVE] FOREIGN KEY ([representative_key])
REFERENCES [dbo].[REPRESENTATIVE_DIM] ([representative_key])
ALTER TABLE [dbo].[SNAPSHOT_SALES_FACT] CHECK CONSTRAINT [FK_SNAPSHOT_SALES_FACT_REPRESENTATIVE]

-- TRANSACTION DIMENSION
ALTER TABLE [dbo].[SNAPSHOT_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_SNAPSHOT_SALES_FACT_TRANSACTION] FOREIGN KEY ([transaction_key])
REFERENCES [dbo].[TRANSACTION_DIM] ([transaction_key])
ALTER TABLE [dbo].[SNAPSHOT_SALES_FACT] CHECK CONSTRAINT [FK_SNAPSHOT_SALES_FACT_TRANSACTION]

END