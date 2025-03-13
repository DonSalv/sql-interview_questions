-- medium day 01 ex 04

-- Create the logs table
Create table Logs (id number primary key, num number);
    
-- Populate the logs table
Truncate table Logs
insert into Logs (id, num) values (1, 1);
insert into Logs (id, num) values (2, 1);
insert into Logs (id, num) values (3, 1);
insert into Logs (id, num) values (4, 2);
insert into Logs (id, num) values (5, 1);
insert into Logs (id, num) values (6, 2);
insert into Logs (id, num) values (7, 2);

select * from Logs;


-- solution 1 : - use join to create table with lags +1 and +2 on id 
--              - select rows that satisfy num1 = num2 = num3
select distinct l1.num as ConsecutiveNums
    from Logs l1
        inner join  Logs l2 on l1.id = l2.id + 1
        inner join  Logs l3 on l1.id = l3.id + 2
        where l1.num = l2.num and l2.num = l3.num;
        -- pros: simple logic if table is indexed on id  and works well if ad are strictly sequential (no gaps)
        -- cons : requires multiple joins O(n^2) complexity and fails if id is not strictly sequential

-- solution 2 : - use window function lag on num col to create shift tables over the id 
--              - for readability, lets keep the windowed table on a table
--              - filter rows id num1 = num2 and num2 = num3
with lagged_tbl as (
select distinct id, num, lag (num , 1) over (order by id) as numlagged1,
                lag (num , 2) over (order by id) as numlagged2
from Logs)
select num as ConsecutiveNums from lagged_tbl 
where num = numlagged1 and numlagged1 = numlagged2;
-- pros : More efficient (O(n)) as it avoids multiple joinsa and Handles missing IDs (e.g., if id values are not sequential, this still works)
-- cons : May be less intuitive for beginners and Requires window functions, which might not be supported in older databases.

drop table Logs;