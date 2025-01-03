IF NOT EXISTS (SELECT * FROM sysobjects WHERE [NAME]= 'REGION_DIM' AND xtype = 'U')
BEGIN

CREATE TABLE [dbo].[REGION_DIM](
	[region_key] int IDENTITY(1,1) NOT NULL,	-- Surrogate primary key
	[region_country] varchar(15) NOT NULL,		-- Name of Country
	[region_province] varchar(30) NOT NULL,		-- Province in Country
	[region_city] varchar(30) NOT NULL,			-- City in Province

	CONSTRAINT [PK_REGION_DIM] PRIMARY KEY CLUSTERED
	(

		[region_key] ASC

	) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

END