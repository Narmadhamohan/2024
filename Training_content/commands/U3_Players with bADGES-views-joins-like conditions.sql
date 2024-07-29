use TestData

-- u4 :
-- 
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


-- insert and make data ready

INSERT INTO u4_Players(FirstName, LastName,  Score, City)
Values
('Shantanu', 'Viyas', 500,'Chennai' )
,
('Tejas', 'Kamal',300,'Chennai');
GO
INSERT INTO u4_Players(FirstName, LastName,  Score, City)
Values('Dijo', 'Jose',100,'Chennai'),
('Antony', 'Paul',50,'Mumbai'),
('Sankar','Kumar', 250, 'Mumbai'),
('Kamal', 'Dadlani', 20,'Chennai'),
('Brian', 'Bob',200,'Bangalore'),
('Sourav','Vikas', 150,'Bangalore'),
('Vaibhav','Vikram', 600,'Bangalore')

update u4_Players
set captain = (Select PlayerID From u4_Players where FirstName='Dijo')
where City='Chennai';
update u4_Players
set captain = (Select PlayerID From u4_Players where FirstName='Antony')
where City='Mumbai';
update u4_Players
set captain = (Select PlayerID From u4_Players where FirstName='Vikram')
where City='Bangalore';

CREATE TABLE u4_Badge(
PlayerID INT ,
BadgeID INT PRIMARY KEY IDENTITY(1,1),
Badge NVARCHAR(20),
FOREIGN KEY(PlayerID) references u4_Players(PlayerID)
)
GO

INSERT INTO u4_Badge Values
((Select PlayerID From u4_Players where FirstName='Antony'),
'Yellow'),
((Select PlayerID From u4_Players where FirstName='Vikram'),
'Yellow'),
((Select PlayerID From u4_Players where FirstName='Kamal'),
'Yellow'),
((Select PlayerID From u4_Players where FirstName='Brian'),
'Blue'),
((Select PlayerID From u4_Players where FirstName='Sourav'),
'Blue')


-- Insert with select statement
-- Insertion with select statement
CREATE TABLE u4_PlayersTemporary (
    PlayerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
);
INSERT INTO u4_PlayersTemporary(PlayerID, FirstName)
Select PlayerID, FirstName FROM u4_Players;
Select * from u4_PlayersTemporary;
Select * from u4_Players;



-- conditions



select * from u4_Players where city is not null;
select * from u4_Players where captain is null;


select * from u4_Players where score>100;
select * from u4_Players where city ='Chennai';


select * from u4_Players where score between 200 and 300;
select * from u4_Players where score>=200 and score<=300
select top 2 * from u4_Players where score>=200 and score<=300 order by score asc

-- Subquery and condition
select * from u4_Players where playerid=
(Select PlayerID from u4_Players where firstname='dijo') ;
select * from u4_Players where Captain=
(Select PlayerID from u4_Players where firstname='dijo') ;
select * from u4_Players where score
not in (select max(score) from u4_Players)
select * from u4_Players where score
 in (select max(score) from u4_Players)


-- order by
select * from u4_Players order by score desc
Select * from u4_Players order by score asc

-- CASE

create table case_players(
ID INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(50),
Score INT
)

INSERT INTO case_players(FirstName, Score)
VALUES('DIJO', 125),('Jose', 20),('Vipin',30 ),('Das', null)

SELECT FirstName, 
CASE 
	WHEN score > 100 THEN 'You got a century'
	WHEN score < 100 THEN 'You are growing'
	ELSE 'Get a seat'
END AS ScoreComment
FROM case_players
GO


-- View
CREATE VIEW PLAYER_FETCH AS
SELECT firstname, score
from case_players;
GO
Select * from PLAYER_FETCH;
DROP VIEW PLAYER_FETCH;



-- TCLS group roles
CREATE ROLE SchemaAccessRole;
CREATE ROLE DatabaseAccessRole;
GRANT SELECT TO DatabaseAccessRole;
GRANT INSERT TO DatabaseAccessRole;
GRANT UPDATE TO DatabaseAccessRole;
GRANT DELETE TO DatabaseAccessRole;
GRANT EXECUTE TO DatabaseAccessRole;

ALTER ROLE DatabaseAccessRole ADD MEMBER vikram;
ALTER ROLE DatabaseAccessRole DROP MEMBER vikram;
--
-- TCL View group roles
SELECT name 
FROM sys.database_principals 
WHERE name = 'vaibhav';
CREATE LOGIN vaibhav WITH PASSWORD = 'abc';
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'vaibhav')
BEGIN
    CREATE USER vaibhav FOR LOGIN vaibhav;
END


CREATE ROLE view_role;
DROP ROLE view_role;
GRANT SELECT ON PLAYER_FETCH TO view_role;
ALTER ROLE view_role ADD MEMBER vikram;
ALTER ROLE view_role ADD MEMBER vaibhav;

-- REVOKE SELECT ON PLAYER_FETCH from view_role;
ALTER ROLE view_role DROP MEMBER vikram;


--


-- Index
CREATE INDEX idx_firstname
ON case_players (firstname);

DROP INDEX case_players.idx_firstname;

-- Exists
SELECT FirstName
from case_players casePlayer
where exists (select firstname from case_players where score <
100 and id =casePlayer.id )



-- wildcard

 select * from u4_Players where lastname like 'V%'
  select * from u4_Players where FirstName like '_a%'
  
  
 select * from u4_Players where FirstName like '[SK]%'
 select * from u4_Players where FirstName like '_[ho]%'

select * from u4_Players where PlayerID
 = any                    (select PlayerID from u4_Players
 WHERE Score>=100)
 
 select * from u4_Players where PlayerID
 <all                    (select PlayerID from u4_Players
 WHERE Score<=20)
 -- Ans: 6,15. playerid < both 6,15
 
 
select * from u4_Players where PlayerID
 >all                    (select PlayerID from u4_Players
 WHERE Score=500)

 -- =all not valid, sub listssss > all, <all

 -- Group by Queries
 select city from u4_Players
group by city;

select city,count(1) from u4_Players 
group by city;

-- select city,count(1) from u4_Players where city is not null
group by city;

-- select city,count(1) from u4_Players where city is not null
-- and score>=100
-- group by city;


-- select city,count(1) from u4_Players where city is not null
 -- and score>=100
-- group by city having count(1)=1;

select city,count(1),sum(score) from u4_Players where city is not null
group by city
having sum(score)>500

select city,count(1),sum(score) from u4_Players where city is not null
group by city
having sum(score)>100

-- Joins
use TestData
Select players.FirstName, badge.Badge 
from u4_Players players LEFT JOIN u4_Badge  badge
ON  players.PlayerID = badge.PlayerID;

Select players.FirstName, badge.Badge 
from u4_Players players RIGHT JOIN u4_Badge  badge
ON  players.PlayerID = badge.PlayerID;



-- INNER JOIN
Select players.firstname as Players, captain.firstname as Captain
FROM
u4_Players players,
u4_Players captain
where players.captain = captain.PlayerID;

-- caretsian sub product
Select players.FirstName, badge.Badge 
from u4_Players players  , u4_Badge  badge

-- Correlated subquery
Select * from u4_Players players
where score < (select Avg(score) from u4_players 
where city=players.City );

-- correlated sub query
-- chennai max-  chennai players
-- particular city's max for the players
select * from u4_Players up where score = 
(select max(score) from u4_Players up1
where up.city=up1.city group by city)
-- and city in ('Chennai','Bangalore')

-- group by and select are tied
select city, Avg(score) from u4_Players up1
where city='Chennai' group by city;

 -- all max - any players
 select * from u4_Players up where score in     
(select max(score) from u4_Players 
group by city)


-- Addition
SELECT 5 + 3 AS AdditionResult;

-- Subtraction
SELECT 5 - 3 AS SubtractionResult;

-- Multiplication
SELECT 5 * 3 AS MultiplicationResult;

-- Division
SELECT 10 / 2 AS DivisionResult;

-- Modulus
SELECT 10 % 3 AS ModulusResult;



-- AND operator
SELECT CASE WHEN 1 = 1 AND 2 = 2 THEN 'True' ELSE 'False' END AS AndResult;

-- OR operator
SELECT CASE WHEN 1 = 1 OR 2 = 3 THEN 'True' ELSE 'False' END AS OrResult;

-- NOT operator
SELECT CASE WHEN NOT (1 = 1) THEN 'True' ELSE 'False' END AS NotResult;


-- 3. Relational Algebra
-- selction, projection, union, join



create table xx_team_a(playerid int,playername varchar(100),matchplayed int)

create table xx_team_b(playerid int,playername varchar(100),matchplayed int)

insert into xx_team_a(playerid,playername,matchplayed)
values(1,'Dijo',6)

insert into xx_team_a(playerid,playername,matchplayed)
values(2,'Jose',4)

insert into xx_team_a(playerid,playername,matchplayed)
values(3,'Brian',70)



insert into xx_team_b(playerid,playername,matchplayed)
values(1,'Dijo',10)

insert into xx_team_b(playerid,playername,matchplayed)
values(2,'Jose',19)

insert into xx_team_b(playerid,playername,matchplayed)
values(4,'David',80)


-- union
select * from xx_team_a
union
select * from xx_team_b

select playerid,playername from xx_team_a
union
select  playerid,playername from xx_team_b


select playerid,playername from xx_team_a
union all
select  playerid,playername from xx_team_b


-- intersect
select playerid,playername from xx_team_a
INTERSECT
select  playerid,playername from xx_team_b;

-- differnce
select playerid from xx_team_a
EXCEPT
select  playerid from xx_team_b


-- cartesian
select * from xx_team_a a
, xx_team_b b


