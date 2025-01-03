IF NOT EXISTS (SELECT * FROM sysobjects WHERE [NAME]= 'REPRESENTATIVE_DIM' AND xtype = 'U')
BEGIN

CREATE TABLE [dbo].[REPRESENTATIVE_DIM](
	[representative_key] int IDENTITY(1,1) NOT NULL,		-- Surrogate primary key
	[representative_identification] varchar(3) NOT NULL,	-- Represents various representatives 
	[representative_type] varchar(40) NOT NULL,				-- Types of representative
	[representative_commission_type] varchar(12) NOT NULL,	-- Indicates commission calculation method
	[representative_commission] decimal(3,2) NOT NULL,		-- Commission percentage

	CONSTRAINT [PK_REPRESENTATIVE_DIM] PRIMARY KEY CLUSTERED
	(

		[representative_key] ASC

	) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

END