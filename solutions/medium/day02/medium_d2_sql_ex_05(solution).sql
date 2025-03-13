-- medium day 02 ex 05

-- Create the seat table
Create table Seat (id int, student varchar(25));

-- Populate the seat table    
Truncate table Seat;
insert into Seat (id, student) values (1, 'Abbot');
insert into Seat (id, student) values (2, 'Doris');
insert into Seat (id, student) values (3, 'Emerson');
insert into Seat (id, student) values (4, 'Green');
insert into Seat (id, student) values (5, 'Jeames');

select * from Seat;


select (case when mod(id,2)=0 then id-1
             when mod(id, 1)=0 and id = count(id) over() then id 
             else id + 1
             end) as new_id, student from Seat
             order by new_id;
            
-- drop table
drop table Seat;