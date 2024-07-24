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


