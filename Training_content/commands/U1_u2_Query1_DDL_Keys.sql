CREATE DATABASE ;
GO
use TestData;
GO 1

-- expand and have a look. 
-- see dbo. -> multiple schemas with same tables. refere with dbo
CREATE TABLE Books (
    BookID INT
);

DROP TABLE Books;

CREATE TABLE ExampleNVARCHAR (
    SampleText NVARCHAR(3)
);
-- explain only basic insert. we will see insert soon in due time
INSERT INTO ExampleNVARCHAR VALUES('ABC');
INSERT INTO ExampleNVARCHAR VALUES(N'日本');

CREATE TABLE ExampleVARCHAR (
    SampleText VARCHAR(3)
);
INSERT INTO ExampleVARCHAR VALUES(N'日本');
INSERT INTO ExampleVARCHAR VALUES('ABC');


CREATE TABLE ExampleCHAR (
    CountryCode CHAR(3)
);
INSERT INTO ExampleCHAR (CountryCode) VALUES ('IND'), ('JPN');


CREATE TABLE ExampleDATETIME (
    EventDateTime DATETIME
);

INSERT INTO ExampleDATETIME (EventDateTime) VALUES ('2024-07-13 14:30:00'), ('2023-05-10 09:00:00');


-- ***************************** ---
-- create, constraints, select, alter

Create table u2_stadium(

StadiumID INT, 
StadiumName VARCHAR(50)   UNIQUE
)
-- explain constraints
Create table u2_stadium(

StadiumID INT NOT NULL,
StadiumName VARCHAR(50)   UNIQUE NOT NULL
)

Select StadiumID, StdiumName from u2_stadium;
Select StadiumID from u2_stadium;
Select * from u2_stadium;

-- I want to change stadiumname to allow 100
Alter Table u2_stadium
Alter Column StadiumName VARCHAR(100);

Alter Table u2_stadium 
ADD test INT;
-- Add new column
EXEC sp_rename 'u2_stadium.StadiumsID', 'StadiumID', 'COLUMN';


-- check script
create table u1_employeeSalary (id int,salary int, check (salary>50));
insert into u1_employeeSalary(id,salary) values(2,'5');


-- **************************************************

-- PRIMARY KEY. not saying not null or unique + additonalyy genertaed by DB engine
-- explain with normalization with many to many
-- new table u3_players, u3_stadium. Then both junction table
-- Show keys
-- Show inserts
--  show update with where condition
-- show delete with where condition
-- Step 1:
CREATE TABLE u3_Players(
)
CREATE TABLE u3_Stadium(
)
-- Step 2:
CREATE TABLE u3_Players(
PlayerID INT ,
FirstName VARCHAR(50),
LastName VARCHAR(50) 
)
-- Step 3:
-- DROP u3_Players
CREATE TABLE u3_Players(
PlayerID INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL
)

-- (2,2)
CREATE TABLE u3_Stadium(
ID INT PRIMARY KEY IDENTITY (2,2),
StadiumName VARCHAR(50) UNIQUE
)

-- Step 4 -- Junction table
CREATE TABLE u3_StadiumPlayers(
StadiumID INT,
PlayersID INT
PRIMARY KEY(StadiumID, PlayersID),
FOREIGN KEY(PlayersID) REFERENCES u3_Players(PlayerID), 
FOREIGN KEY(StadiumID) REFERENCES u3_Stadium(ID),
)


-- Insertion of data
INSERT INTO u3_players( FirstName, LastName) 
values('Shantanu', 'Viyas');
INSERT INTO u3_Players( FirstName, LastName)
values('Teja', 'Nandan');
select * from u2_playersauto;

INSERT INTO u3_Stadium(StadiumName)
VALUES ('JNehru')
INSERT INTO u3_Stadium(StadiumName)
VALUES ('VPatel')
GO

select * from u3_stadium;

--observe error
-- DATA VALUES(1,1)
-- DATA VALUES(1,2)
-- AGAIN DATA VALUES(1,2)
INSERT INTO u3_StadiumPlayers VALUES(1,2)
GO

-- explain update and delete with where condition
-- *****************************************
CREATE FUNCTION findtax(@amount DECIMAL(6,2)) 
RETURNS DECIMAL(6,4)
AS
BEGIN

END
--

CREATE FUNCTION findtax(@amount DECIMAL(6,2)) 
RETURNS DECIMAL(6,4)
AS
BEGIN
	RETURN @amount *  3

END;
GO
select dbo.findtax(5);
GO
DROP FUNCTION findtax;


