----------------- Database level queries -----------------
/*
Note:
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
DROP DATABASE retailStoreLATIN_1; -- DROP DATABASE statement is used to drop a particular database. To delete multiple databases you can use DROP DATABASE database1, database2, ...; 


