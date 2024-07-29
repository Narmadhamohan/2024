
create table u1_employeeSalary (id int,salary int, check (salary>50));

insert into u1_employeeSalary(id,salary) values(2,'5');


CREATE ROLE SchemaAccessRole;
CREATE ROLE DatabaseAccessRole;
GRANT SELECT TO DatabaseAccessRole;
GRANT INSERT TO DatabaseAccessRole;
GRANT UPDATE TO DatabaseAccessRole;
GRANT DELETE TO DatabaseAccessRole;
GRANT EXECUTE TO DatabaseAccessRole;

ALTER ROLE DatabaseAccessRole ADD MEMBER vikram;
ALTER ROLE DatabaseAccessRole DROP MEMBER vikram;


 -- REVOKE SELECT ON DATABASE::SPORTS FROM DatabaseAccessRole;
-- GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA::SPORTS TO SchemaAccessRole;


                   