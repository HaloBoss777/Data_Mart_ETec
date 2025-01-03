IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ETec Sales Data Mart')
BEGIN
    CREATE DATABASE [ETec Sales Data Mart]
END