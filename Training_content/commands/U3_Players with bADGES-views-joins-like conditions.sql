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

-- Subquery and condition
select * from u4_Players where playerid=
(Select PlayerID from u4_Players where firstname='dijo') ;
select * from u4_Players where Captain=
(Select PlayerID from u4_Players where firstname='dijo') ;
select * from u4_Players where score
not in (select max(score) from u4_Players)
select * from u4_Players where score
 in (select max(score) from u4_Players)

select * from u4_Players where city is not null;
select * from u4_Players where captain is null;


select * from u4_Players where score>100;
select * from u4_Players where city ='Chennai';


select * from u4_Players where score between 200 and 300;
select * from u4_Players where score>=200 and score<=300
select top 2 * from u4_Players where score>=200 and score<=300

-- order by
select * from u4_Players order by score desc
Select * from u4_Players order by score asc




-- wildcard

 select * from u4_Players where lastname like 'V%'
  select * from u4_Players where FirstName like '_a%'
  
  
 select * from u4_Players where FirstName like '[SK]%'
 select * from u4_Players where FirstName like '_[ho]%'

select * from u4_Players where PlayerID
 =any                    (select PlayerID from u4_Players
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

select city,count(1) from u4_Players where city is not null
group by city;

select city,count(1) from u4_Players where city is not null
and score>=100
group by city;


select city,count(1) from u4_Players where city is not null
and score>=100
group by city having count(1)=1;

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

Select players.FirstName, badge.Badge 
from u4_Players players  , u4_Badge  badge

Select players.firstname as Players, captain.firstname as Captain
FROM
u4_Players players,
u4_Players captain
where players.captain = captain.PlayerID;

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


