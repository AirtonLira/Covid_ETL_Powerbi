IF NOT EXISTS ( SELECT name FROM master.dbo.sysdatabases WHERE name = 'DesafioRadix')
BEGIN
	CREATE DATABASE DesafioRadix
END
GO

IF OBJECT_ID('dbo.Staging') IS NULL
BEGIN
	CREATE TABLE Staging
	(
		Id_Staging INT PRIMARY KEY IDENTITY(1,1),
		Province_State VARCHAR(80),
		Country_Region VARCHAR(80),
		Lat VARCHAR(50),
		Long VARCHAR(50),
		Dates DATE,
		Amount INT,
		Month INT,
		YEAR INT,
		DAY INT,
		Date_id INT,
		Locate_id INT,
		Country_id INT,
		province_id INT,
		Situation_id INT,
		FileNamePath VARCHAR(150)

	)
END

/*
 Create table COVID
*/

IF OBJECT_ID('dbo.Covid') IS NULL
BEGIN
	CREATE TABLE Covid
	(
		Covid_id INT PRIMARY KEY IDENTITY(1,1),
		Date_id INT,
		Locate_id INT,
		Country_id INT,
		Situation_id INT,
		province_id INT,
		Amount INT 
	)
END
GO

/*
 Create table DimProvince
*/

IF OBJECT_ID('dbo.DimProvince') IS NULL
BEGIN
	CREATE TABLE DimProvince
	(
		Province_id INT PRIMARY KEY IDENTITY(1,1),
		Province_name VARCHAR(80)
	)
END
GO


/*
 Create table DimCountry
*/

IF OBJECT_ID('dbo.DimCountry') IS NULL
BEGIN
	CREATE TABLE DimCountry
	(
		Country_id INT PRIMARY KEY IDENTITY(1,1),
		Country_name VARCHAR(80)
	)
END
GO

/*
 Create table DimData
*/

IF OBJECT_ID('dbo.DimData') IS NULL
BEGIN
	CREATE TABLE DimData
	(
		Data_id INT PRIMARY KEY IDENTITY(1,1),
		Year INT,
		Month INT,
		DAY INT,
		Date_Complete DATE	
	)
END
GO

/*
 Create table DimSituation
*/
IF OBJECT_ID('dbo.DimSituation') IS NULL
BEGIN
	CREATE TABLE DimSituation
	(
		Situation_id INT PRIMARY KEY IDENTITY(1,1),
		Situation VARCHAR(150)
	)
END
GO

/*
 Create table DimLocate
*/
IF OBJECT_ID('dbo.DimLocate') IS NULL
BEGIN
	CREATE TABLE DimLocate
	(
		Locate_id INT PRIMARY KEY IDENTITY(1,1),
		Latitude VARCHAR(50),
		Longitude VARCHAR(50)
	)
END
GO
