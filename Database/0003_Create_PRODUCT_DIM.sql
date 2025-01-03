IF NOT EXISTS (SELECT * FROM sysobjects WHERE [NAME]= 'PRODUCT_DIM' AND xtype = 'U')
BEGIN

CREATE TABLE [dbo].[PRODUCT_DIM](
	[product_key] int IDENTITY(1,1) NOT NULL,		-- Suggorate primary key
	[product_code] varchar(20) NOT NULL,			-- Operational system identifier
	[product_gender] varchar(6) NULL,				-- Customer gender focus
	[product_material] varchar(20) NULL,			-- Material compisition of product
	[product_style] varchar(30) NULL,				-- Product design style
	[product_colour] varchar(20) NULL,				-- Colour theme of the product
	[product_branding] varchar(20) NULL,			-- Size of product branding
	[product_fault_indicator] varchar(10) NOT NULL,	-- Describes product quality
	[product_category] varchar(10) NULL,			-- Indicates product range
	[product_brand] varchar(1) NULL,				-- Brand of product
	[product_is_current] bit NOT NULL,				-- Inducates if record is current

	CONSTRAINT [PK_PRODUCT_DIM] PRIMARY KEY CLUSTERED
	(

		[product_key] ASC

	) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

END