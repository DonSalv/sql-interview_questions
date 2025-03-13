--medium day 02 ex 01

-- Create the requestaccepted table
Create table RequestAccepted (requester_id int not null, accepter_id int null, accept_date date null);
    
-- Populate the requestaccepted table
Truncate table RequestAccepted;
insert into RequestAccepted (requester_id, accepter_id, accept_date) values (1, 2, DATE '2016-06-03');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values (1, 3, DATE '2016-06-08');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values (2, 3, DATE '2016-06-08');
insert into RequestAccepted (requester_id, accepter_id, accept_date) values (3, 4, DATE '2016-06-09');

select * from RequestAccepted;


with users as 
(select requester_id as id  from
RequestAccepted
UNION all
select accepter_id as id  from
RequestAccepted) 
select id, count(id) as counter from
users
group by id order by counter desc
fetch first 1 row only;

-- drop table
drop table RequestAccepted;