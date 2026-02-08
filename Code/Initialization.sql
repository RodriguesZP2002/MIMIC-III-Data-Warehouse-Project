/* 
================================
=====    INTIALIZATION     =====
================================

CREATE THE Mimic_III DATABASE AND ITS SCHEMAS
  LEVEL 1: RAW DATA
  LEVEL 2: CLEANED DATA
  LEVEL 3: TRANSFORMED DATA
*/

USE Master;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Mimic_III_DW')
BEGIN
	ALTER DATABASE Mimic_III_DW SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE Mimic_III_DW;
END;
GO

CREATE DATABASE Mimic_III_DW;
Go

USE Mimic_III_DW;
Go

Create SCHEMA Level_1;
Go

Create SCHEMA Level_2;
Go

Create SCHEMA Level_3;
Go
