-- medium day 02 ex 12

-- Create the tree table

-- Create the tree table
Create table Tree (id int, p_id int);

-- Populate the tree table    
Truncate table Tree;
insert into Tree (id, p_id) values (1, NULL);
insert into Tree (id, p_id) values (2, 1);
insert into Tree (id, p_id) values (3, 1);
insert into Tree (id, p_id) values (4, 2);
insert into Tree (id, p_id) values (5, 2);

select id, case when p_id is null then 'Root'
               when id in (select distinct p_id as id from Tree where p_id is not null ) then 'Inner'
               else 'Leaf'
               end as node_type
from Tree ;

-- drop table
drop table Tree;