----------------- Database -----------------
/*
Databases are collection of objects like tables, stored procedure,	functions, etc.
In MS SQL Server, there are two sorts of databases:
* System Database: System Databases are created automatically once we install MS SQL Server.
* User Database: User databases are created by users.
Link: https://learn.microsoft.com/en-us/sql/t-sql/statements/create-database-transact-sql?view=sql-server-ver17&tabs=sqlpool
*/


-- Create Database --
CREATE DATABASE retailStore; -- This statement is used to create a simple database.
CREATE DATABASE retailStoreLATIN_1 -- Create database with Windows Latin-1 collation (Code Page 1252)
COLLATE Latin1_General_100_CI_AS;


-- Show Databases in SQL Server --
SELECT *  FROM sys.databases; -- Provides info of all the databases available in the server
EXEC sp_databases; -- System stored procedure to list all the databases
SELECT name, database_id FROM sys.databases WHERE database_id > 4; -- List all user created databases


-- Use Database --
USE retailStore; -- USE statement is used to change the database context


-- Drop Database --
USE master;
DROP DATABASE retailStoreLATIN_1; -- DROP DATABASE statement is used to drop a particular database. To delete multiple databases you can use DROP DATABASE database1, database2, ...; 


-- Database backup --
-- This statement is used to create a full backup a particular database to a disk
USE retailStoreLATIN_1;
GO
BACKUP DATABASE retailStoreLATIN_1
TO DISK = 'D:\INSTALLER\DB BACKUP\retailStoreLATIN_1.bak' -- backup file will be created in this particular location
WITH FORMAT, -- ensures that the backup file is initialized and any existing backup on the disk is overwritten.
MEDIANAME = 'retailStoreLATIN_1Backup', -- label for the backup media
NAME = 'Full Backup of retailStoreLATIN_1'; -- descriptive name for the backup set
GO
-- Restore backup
RESTORE DATABASE retailStoreLATIN_1
FROM DISK = 'D:\INSTALLER\DB BACKUP\retailStoreLATIN_1.bak'
WITH REPLACE; -- Overwrites the existing GeekDB database if it already exists



----------------- Schema -----------------
/* 
A schema is a collection of database objects including tables, views, triggers, stored procedures, indexes, etc.
A schema always belongs to one database.
schema_name.object_name
In-build schema dbo, guest, sys, and INFORMATION_SCHEMA.
*/

-- Statement to create schema --
USE retailStore;
GO
CREATE SCHEMA retail;
GO


-- Show Schema in SQL Server --
SELECT * FROM sys.schemas; -- List all the schema in a particular database
-- List all the schemas along with schema owner
SELECT 
    s.name AS schema_name, 
    u.name AS schema_owner
FROM sys.schemas s INNER JOIN sys.sysusers u ON u.uid = s.principal_id ORDER BY s.name;


-- Alter Schema --
-- ALTER SCHEMA target_schema_name TRANSFER [ entity_type :: ] securable_name;
ALTER SCHEMA sales TRANSFER OBJECT::dbo.offices;   --Transfer this dbo.offices table to the sales schema


-- Drop Schema --
DROP SCHEMA IF EXISTS retail;


----------------- Table -----------------
/*
Tables are used to store data in the database. 
Tables are uniquely named within a database and schema. 
Each table contains one or more columns. 
And each column has an associated data type and constrains.
NOT NULL/NULL - Enforces that a column can or cannot accept NULL values.
UNIQUE - Ensures that all values in a column or set of columns are distinct.
PRIMARY KEY - Uniquely identifies each row in a table.
FOREIGN KEY - Establishes a relationship/link to a column in another table.
CHECK - Limits the value range based on a logical condition.
DEFAULT - Provides a fallback value if no value is explicitly inserted.
Link: https://learn.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver17&source=recommendations
*/
