IF NOT EXISTS (SELECT * FROM sysobjects WHERE [NAME]= 'SUPPLIER_DIM' AND xtype = 'U')
BEGIN

CREATE TABLE [dbo].[SUPPLIER_DIM](
	[supplier_key] int IDENTITY(1,1) NOT NULL,		-- Suggorate primary key
	[supplier_name] varchar(30) NOT NULL,			-- Supplier company name
	[supplier_exclusive] varchar(13) NULL,			-- Indicates exclusivity with Etec
	[supplier_credit_limit] decimal(19, 2) NOT NULL,-- Credit limit with supplier

	CONSTRAINT [PK_SUPPLIER_DIM] PRIMARY KEY CLUSTERED
	(

		[supplier_key] ASC

	) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

END