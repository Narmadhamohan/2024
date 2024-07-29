-- DDL and DML to set and make Data ready with tables

create table xx_player_states(player_id int,
player_name VARCHAR(1000), 
score int, 
city VARCHAR(100),
dob DATE);

insert into xx_player_states(player_id,player_name,score,city,dob)
values (1,'Dijo',30,'Chennai','1993-10-01');
insert into xx_player_states(player_id,player_name,score,city,dob)
values (1,'Dijo',40,'Chennai','1993-10-01');
insert into xx_player_states(player_id,player_name,score,city,dob)
values (1,'Dijo',50,'Bangalore','1993-10-01');
insert into xx_player_states(player_id,player_name,score,city,dob)
values (1,'Dijo',100,'Mumbai','1993-10-01');


insert into xx_player_states(player_id,player_name,score,city,dob)
values (2,'Jose',1,'Chennai','1991-10-01');
insert into xx_player_states(player_id,player_name,score,city,dob)
values (2,'Jose',17,'Chennai','1991-10-01');
insert into xx_player_states(player_id,player_name,score,city,dob)
values (2,'Jose',16,'Bangalore','1991-10-01');
insert into xx_player_states(player_id,player_name,score,city,dob)
values (2,'Jose',10,'Mumbai','1991-10-01');



insert into xx_player_states(player_id,player_name,score,city,dob)
values (3,'Brian',100,'Chennai','1999-10-01');
insert into xx_player_states(player_id,player_name,score,city,dob)
values (3,'Brian',50,'Chennai','1999-10-01');
insert into xx_player_states(player_id,player_name,score,city,dob)
values (3,'Brian',60,'Bangalore','1999-10-01');
insert into xx_player_states(player_id,player_name,score,city,dob)
values (3,'Brian',1,'Mumbai','1999-10-01');






-- **Instead of Triggers. Instead of logging in another table, Just Display Warning Message**
GO
CREATE TRIGGER xx_player_stat_delete_trigger ON xx_player_states
INSTEAD OF DELETE
AS
BEGIN
  Select 'You are not allowed delete' as [Message]
END
GO

delete from xx_player_states where player_id=3

-- ************Enable and Disable triggers************
GO
DISABLE TRIGGER xx_player_stat_delete_trigger on xx_player_states
GO

GO
ENABLE TRIGGER xx_player_stat_delete_trigger on xx_player_states
GO
-- Enable and Disable triggers


-- ***********Group by vs Partition by*****************

select player_name,city,score
from xx_player_states
group by player_name,city,score Order BY city ;


select player_name,score,city,rank() over (order by score desc) as Rank_of_players
from xx_player_states;


select a1.* from 
(select player_name,city,score,rank() over (PARTITION BY player_name order by score desc) rank_player 
from xx_player_states)
a1 
where a1.rank_player=4;


select * from xx_player_states;




