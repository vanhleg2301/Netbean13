USE [master]
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'TestDateDB')
	DROP DATABASE TestDateDB
GO

-- Create the TestDateDB database.
CREATE DATABASE TestDateDB
GO

USE TestDateDB;
GO

-- Create table Person
CREATE TABLE Person
(id varchar (10) PRIMARY KEY,
 name varchar(40),
 dob Date
)
GO

-- Insert data into the Person table.
-- default date: 
--set DATEFORMAT YMD
--GO
INSERT INTO Person VALUES ('A1', 'Hoa', '1997-03-17')
INSERT INTO Person VALUES ('A3', 'La', '1997-03-17')
GO

set DATEFORMAT DMY
GO
INSERT INTO Person VALUES ('A2', 'Canh', '20-04-1995')
INSERT INTO Person VALUES ('A4', 'Cay', '18-03-1996')
GO

set DATEFORMAT MDY
GO
INSERT INTO Person VALUES ('A6', 'Goc', '06-19-1998')
INSERT INTO Person VALUES ('A5', 'Re', '03-21-1999')
GO

Select * from Person
GO

