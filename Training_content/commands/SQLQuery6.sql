select * from u4_Players;

select * from u4_badge;

select * from u4_Players where city='Chennai'

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