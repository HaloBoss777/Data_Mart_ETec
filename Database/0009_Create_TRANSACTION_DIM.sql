IF NOT EXISTS (SELECT * FROM sysobjects WHERE [NAME]= 'TRANSACTION_DIM' AND xtype = 'U')
BEGIN

CREATE TABLE [dbo].[TRANSACTION_DIM](
	[transaction_key] int IDENTITY(1,1) NOT NULL,	-- Surrogate primary key
	[transaction_type] varchar(25) NOT NULL,		-- Indicates type of transaction

	CONSTRAINT [PK_TRANSACTION_DIM] PRIMARY KEY CLUSTERED
	(

		[transaction_key] ASC

	) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

END