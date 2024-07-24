Use SPORTS1

CREATE TABLE Books(

ID INT,
ISBN INT
);

INSERT INTO Books Values (1);



CREATE TABLE ExampleNVARCHAR (
    SampleText NVARCHAR(3)
);
INSERT INTO ExampleNVARCHAR VALUES('ABC');
INSERT INTO ExampleNVARCHAR VALUES(N'日本');
Select * from ExampleNVARCHAR;

CREATE TABLE ExampleCHAR (
    CountryCode CHAR(3)
);

INSERT INTO ExampleCHAR values('INDIA')
SELECT * from ExampleCHAR;

CREATE TABLE ExampleDATETIME (
    EventDateTime DATETIME
);

INSERT INTO ExampleDATETIME (EventDateTime) 
VALUES ('2024-07-13 14:30:00'), 
('2023-05-10 09:00:00');

select * from ExampleDATETIME;

DROP TABLE BOOKS;

TRUNCATE TABLE Books;

ALTER TABLE Books
ADD ISBN INT


-- Constraints


CREATE TABLE Books(

ID INT NOT NULL,
ISBN INT UNIQUE
);

CREATE TABLE Books1(

ID INT NOT NULL,
ISBN INT UNIQUE,
CONSTRAINT uni_constraint  UNIQUE(ISBN)
);


INSERT INTO Books(isbn) values(1);
INSERT INTO Books(id,isbn) values(2,1);

Alter Table u2_stadium
Alter Column StadiumName VARCHAR(100);

Alter Table u2_stadium 
ADD test INT;



ALTER Table Books
ADD CONSTRAINT unique_constraint UNIQUE(ISBN);

ALTER TABLE Books
DROP CONSTRAINT unique_constraint;


-- Keys

EXEC sp_help 'dbo.books'

CREATE TABLE u1_players(

PlayersID INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(50),
LastNAme VARCHAR(50)
)

CREATE TABLE u1_stadium(

StadiumID INT PRIMARY KEY IDENTITY(2,2),
StadiumName VARCHAR(50)
)

INSERT INTO u1_players(FirstName,LastNAme)
VALUES('Dijo','Jose'), ('Vipin','Das'),('Shantanu','Kumar')

select PlayersID, FirstName, LastNAme from u1_players



INSERT INTO u1_stadium(StadiumName)
VALUES('JNehru'), ('VPatel');

Select DISTINCT StadiumName from u1_stadium;

Create table u1_stadiumplayers(

PlayerID INT,
StadiumID INT
PRIMARY KEY(PlayerID,StadiumID)
FOREIGN KEY(PlayerID) REFERENCES u1_players(PlayersID),
FOREIGN KEY(StadiumID) REFERENCES u1_stadium(StadiumID)
)

SELECT * FROM u1_stadium;
SELECT * FROM u1_stadiumplayers;
-- COMPOSITE KEY and FOreign key
INSERT INTO u1_stadiumplayers VALUES (1,2);

-- check constraints
create table u1_employeeSalary (
id int,
salary int, 
check (salary>50));

insert into u1_employeeSalary(id,salary) values(2,'51');

-- DEFAULT constraints
create table u1_employeeTrack (id int,
DOJ Date DEFAULT getDate());

INSERT INTO u1_employeeTrack(id) values (1)
select * from u1_employeeTrack;

select * from u1_employeeTrack;
create table u2_employeesalary (
id int,
city VARCHAR(50), 
check (city = 'chennai'));

create table u3_employeesalary (
id int,
city VARCHAR(50), 
CONSTRAINT check_const check (city = 'chennai'));











Select * from Books;


CREATE TABLE ExampleDATETIME1 (
    EventDateTime DATETIME
);

INSERT INTO ExampleDATETIME1 (EventDateTime) 
VALUES ('2024-07-13 14:30:00'), 
('2023-05-10 09:00:00');


-- 101,103,104,105,106,112
-- set dateformat dmy
select FORMAT(EventDateTime, 'yyyy-MM-dd') from ExampleDATETIME;


SELECT CONVERT(VARCHAR(20),EventDateTime,104 )
FROM ExampleDATETIME;

INSERT INTO u1_StadiumPlayers VALUES(1,2)

EXEC sp_rename 'Books.ID', 'ID1', 'COLUMN';

-- Before dropping column, drop constraints first
ALTER TABLE BOOKS
DROP CONSTRAINT pk;

-- DATA Definition Language
-- CREATE, DROP, ALTER
-- Data Manipulation Language
-- insert, select, update, delete
select * from u1_stadium;

-- UPDATE
-- SET
-- WHERE

UPDATE u1_stadium
SET StadiumName = 'VallPatel'
WHERE StadiumID = 2;

select * from u1_stadiumplayers;

-- DELETE FROM
-- WHERE

DELETE FROM u1_stadiumplayers
WHERE StadiumID = 2 and PlayerID =1;





CREATE TABLE u4_Players(
PlayerID INT PRIMARY KEY IDENTITY(1,1),
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
City NVARCHAR(20),
Captain INT, 
Score INT,
FOREIGN KEY (Captain) REFERENCES u4_Players(PlayerID),
);
GO




