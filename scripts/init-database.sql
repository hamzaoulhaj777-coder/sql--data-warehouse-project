/*
====================================================================
Create Database and Schemas
====================================================================
Script Purpose:
  This script creates a new database named 'DataWarehouse' after checking if it already exists.
  If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
  within the database: 'bronze', 'silver', and 'gold'.

WARNING:
  Running this script will drop the entire 'DataWarehouse' database if it exists.
  All data in the database will be permanently deleted. Proceed with caution
  and ensure you have proper backups before running this script.
*/

-- Switch to the master database context to safely perform drop/create operations

USE master;
GO 

-- Check if 'DataWarehouse' already exists; if so, drop it
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Force close any existing connections to prevent the script from locking up
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    
    DROP DATABASE DataWarehouse;
END
GO

-- Create the new database
CREATE DATABASE DataWarehouse;
GO

-- Switch context to the newly created database
USE DataWarehouse;
GO

-- Create the medallion architecture schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO


USE master ; 
GO 
--DROP AND recreate the 'datawarehouse' database 
IF EXISTS ( SELECT 1 FROM sys.database WHERE name = 'DataWarehouse')
BEGIN 
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse ;
END; 
GO 
  -- create the 'datawarehouse' database 
CREATE DATABASE DataWarehouse; 

USE DataWarehouse;
GO
-- Create Schemas 
CREATE SCHEMA bronze ;
GO
  
CREATE SCHEMA silver ; 
GO
  
CREATE SCHEMA gold ; 
GO

