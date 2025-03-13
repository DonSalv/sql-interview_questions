--medium day 02 ex 03
-- Create the point2d table
Create Table Point2D (x int not null, y int not null);
    
-- Populate the point2d table
Truncate table Point2D;
insert into Point2D (x, y) values (-1, -1);
insert into Point2D (x, y) values (0, 0);
insert into Point2D (x, y) values (-1, -2);

select * from Point2D;

with distance as (
select t1.*, t2.*,  round(sqrt( power(t1.x - t2.x,2) + power(t1.y - t2.y,2) ),2) as distance 
from Point2D t1
cross join Point2D t2 )
select min(distance) as shortest from distance
where distance <>0;

drop table Point2D;