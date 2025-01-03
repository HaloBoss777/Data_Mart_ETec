IF NOT EXISTS (SELECT * FROM sysobjects WHERE [NAME]= 'DATE_DIM' AND xtype = 'U')
BEGIN

CREATE TABLE [dbo].[DATE_DIM](
	[date_key] int IDENTITY(1,1) NOT NULL,		-- Suggorate primary key
	[day_of_week] varchar(10) NULL,				-- Weekday name
	[day_number_in_calendar_month] int NULL,	-- Day number in calander month
	[day_number_in_calendar_year] int NULL,		-- Day number in calander year
	[calendar_week_number_in_year] int NULL,	-- Number of week in year
	[calendar_month] varchar(10) NULL,			-- Name of calendar month
	[calendar_month_number_in_year] int NULL,	-- Number of month in year
	[calendar_yyyy_mm] varchar(6) NULL,			-- Shortend year and month string
	[calendar_quarter] int NULL,				-- Quarter in calendar year
	[calendar_year] int NULL,					-- Year
	[holiday_indicator] varchar(11) NULL,		-- Indicates if day is a holiday
	[weekday_indicator] varchar(11) NULL,		-- Indicates if day is a weekday
	[fiscal_month] varchar(10) NULL,			-- Name of fiscal month
	[fiscal_month_number_in_year] int NULL,		-- Number of month in fiscal year

	CONSTRAINT [PK_DATE_DIM] PRIMARY KEY CLUSTERED
	(

		[date_key] ASC

	) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

END