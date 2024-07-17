-- Views, columns
-- important query like count, *, LIKE, BETWEEN, SUBSTRINg, Date
-- UNION, IN, > ANY, > ALL

-- need badge table with null values, cpatain for joins
-- need score with null values city for group by
-- explain data diagram, after they understand basic queries
-- explain data type and show with tool s- options - designers tools.

use SPORTS
CREATE TABLE u3_PlayersJoins(
PlayerID INT PRIMARY KEY IDENTITY(1,1),
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Captain INT, 
Score INT,
FOREIGN KEY (Captain) REFERENCES u3_PlayersJoins(PlayerID),
);
GO

ALTER TABLE u3_PlayersJoins
ADD City NVARCHAR(20);

CREATE TABLE u3_BadgeJoins(
PlayerID INT ,
BadgeID INT PRIMARY KEY IDENTITY(1,1),
Badge NVARCHAR(20),
FOREIGN KEY(PlayerID) references u3_PlayersJoins(PlayerID)
)
select * from u3_PlayersJoins;
delete from u3_PlayersJoins;

INSERT INTO u3_PlayersJoins(FirstName, LastName,  Score)
Values('Shantanu', 'Viyas', 500 )
INSERT INTO u3_PlayersJoins(FirstName, LastName,  Score)
Values('Tejas', 'Kamal',300)
INSERT INTO u3_PlayersJoins(FirstName, LastName,  Score)
Values('Dijo', 'Jose',100)
INSERT INTO u3_PlayersJoins(FirstName, LastName,  Score)
Values('Antony', 'Paul',50)
INSERT INTO u3_PlayersJoins(FirstName, LastName,  Score)
Values('Sankar','Kumar', 51)

INSERT INTO u3_PlayersJoins(FirstName, LastName,  Score)
Values('Kamal', 'Dadlani', 20)

INSERT INTO u3_PlayersJoins(FirstName, LastName,  Score)
Values('Brian', 'Bob',200)

INSERT INTO u3_PlayersJoins(FirstName, LastName,  Score)
Values('Sourav','Vikas', 150)

INSERT INTO u3_PlayersJoins(FirstName, LastName,  Score)
Values('Vaibhav','Vikram', 600)

-- Shantanu, Tejas, Antony, Dijo, Sankar, Kamal, Brian, Sourav, Vibhav
-- write update statement, do a lookup and verify

update u3_PlayersJoins
set City='Chennai'
where FirstName = 'Shantanu'
select * from u3_PlayersJoins

update u3_PlayersJoins
set City='Chennai'
where FirstName = 'Tejas'
select * from u3_PlayersJoins

update u3_PlayersJoins
set City='Chennai'
where FirstName = 'Antony'
select * from u3_PlayersJoins
update u3_PlayersJoins
set City='Chennai'
where FirstName = 'Dijo'
update u3_PlayersJoins
set City='Bangalore'
where FirstName = 'Sankar'
update u3_PlayersJoins
set City='Bangalore'
where FirstName = 'Kamal'
select * from u3_PlayersJoins

-- Insertion with select statement
CREATE TABLE u3_Playe3rsJoins_newload (
    PlayerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Captain BIT,
    City NVARCHAR(20) -- Add the new column in the desired position
);

INSERT INTO u3_Playe3rsJoins_newload(PlayerID, FirstName, LastName, City)
Select PlayerID, FirstName, LastName, City FROM u3_PlayersJoins;

select * from u3_Playe3rsJoins_newload;

select * from u3_PlayersJoins;
use SPORTS
-- update example with not in, in and =, !=
update u3_PlayersJoins
set captain = 27
where PlayerID not in (  26,25,24,23);

update u3_PlayersJoins
set captain = 26
where PlayerID  in ( 24,23,25);
update u3_PlayersJoins
set captain = null
where PlayerID  in ( 27,26);



