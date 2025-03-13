-- medium day 02 ex 04

-- Create the follow table
Create table Follow (followee varchar(25), follower varchar(25));
    
-- Populate the follow table
Truncate table Follow;
insert into Follow (followee, follower) values ('Alice',  'Bob');
insert into Follow (followee, follower) values ('Bob',    'Cena');
insert into Follow (followee, follower) values ('Bob',    'Donald');
insert into Follow (followee, follower) values ('Donald', 'Edward');
select * from Follow;

with leads as (
            select distinct followee 
            from Follow
            where followee in (select follower from Follow))
select ld.followee as follower, count(f2.followee) as num
from leads ld 
join follow f2 on ld.followee = f2.followee
group by ld.followee
order by ld.followee; 

--Drop table
drop table Follow;