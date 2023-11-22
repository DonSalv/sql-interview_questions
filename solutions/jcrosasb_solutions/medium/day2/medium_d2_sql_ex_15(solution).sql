-- Create the seat table
Create table Seat (id int, student varchar(25));

-- Populate the seat table    
Truncate table Seat;
insert into Seat (id, student) values (1, 'Abbot');
insert into Seat (id, student) values (2, 'Doris');
insert into Seat (id, student) values (3, 'Emerson');
insert into Seat (id, student) values (4, 'Green');
--insert into Seat (id, student) values (5, 'Jeames');

-- Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
-- Return the result table ordered by id in ascending order
WITH prev_next_students AS (
SELECT 
    id, 
    student,
    LAG(student) OVER (ORDER BY id) prev,
    LEAD(student) OVER (ORDER BY id) next 
FROM
    Seat)
SELECT 
    id,
    CASE WHEN MOD(id,2) != 0 THEN 
            CASE WHEN id < (SELECT MAX(id) id FROM prev_next_students) THEN next
                 ELSE student 
            END
         WHEN MOD(id,2) = 0 THEN prev 
    END student
FROM
    prev_next_students
ORDER BY
    id;

-- Drop tables
DROP TABLE Seat;
