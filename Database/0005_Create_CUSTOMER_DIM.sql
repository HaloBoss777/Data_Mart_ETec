IF NOT EXISTS (SELECT * FROM sysobjects WHERE [NAME]= 'CUSTOMER_DIM' AND xtype = 'U')
BEGIN

CREATE TABLE [dbo].[CUSTOMER_DIM](
	[customer_key] int IDENTITY(1,1) NOT NULL,		-- Suggorate primary key
	[customer_identification] varchar(10) NOT NULL,	-- Operational system identifier
	[customer_category] varchar(20) NOT NULL,		-- Description of customer
	[customer_is_current] bit NOT NULL,				-- Inducates if record is current

	CONSTRAINT [PK_CUSTOMER_DIM] PRIMARY KEY CLUSTERED
	(

		[customer_key] ASC

	) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

END