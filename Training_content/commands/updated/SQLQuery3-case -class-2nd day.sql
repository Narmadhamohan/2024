use SPORTS1


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
-- DROP VIEW PLAYER_FETCH;


SELECT name 
FROM sys.database_principals 
WHERE name = 'vaibhav';
CREATE LOGIN vaibhav WITH PASSWORD = 'abc';
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'vaibhav')
BEGIN
    CREATE USER vaibhav FOR LOGIN vaibhav;
END


CREATE ROLE view_role;
-- DROP ROLE view_role;
GRANT SELECT ON PLAYER_FETCH TO view_role;
ALTER ROLE view_role ADD MEMBER vikram;
ALTER ROLE view_role ADD MEMBER vaibhav;

-- REVOKE SELECT ON PLAYER_FETCH from view_role;
ALTER ROLE view_role DROP MEMBER vikram;





