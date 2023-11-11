-- Create the tables
Create table SchoolA (student_id int, student_name varchar(20));
Create table SchoolB (student_id int, student_name varchar(20));
Create table SchoolC (student_id int, student_name varchar(20));

-- Populate the schoola table
Truncate table SchoolA;
insert into SchoolA (student_id, student_name) values (1, 'Alice');
insert into SchoolA (student_id, student_name) values (2, 'Bob');

-- Populate the schoolb table
Truncate table SchoolB;
insert into SchoolB (student_id, student_name) values (3, 'Tom');

-- Populate the schoolc table
Truncate table SchoolC;
insert into SchoolC (student_id, student_name) values (3, 'Tom');
insert into SchoolC (student_id, student_name) values (2, 'Jerry');
insert into SchoolC (student_id, student_name) values (10, 'Alice');

-- There is a country with three schools, where each student is enrolled in exactly one school. The country is joining a competition 
-- and wants to select one student from each school to represent the country such that:
--      * member_A is selected from SCHOOLA,
--      * member_B is selected from SCHOOLB,
--      * member_C is selected from SCHOOLC, and
-- The selected students' names and IDs are pairwise distinct (i.e. no two students share the same name, and no two students share the same ID).
-- Write a solution to find all the possible triplets representing the country under the given constraints
SELECT member_A, member_B, member_C FROM (
SELECT
    a.student_name member_A,
    a.student_id id_A,
    b.student_name member_B,
    b.student_id id_B,
    c.student_name member_C,
    c.student_id id_C
FROM
    SchoolA a
CROSS JOIN
    SchoolB b
CROSS JOIN
    SchoolC c)
WHERE (member_A <> member_B AND member_B <> member_C AND member_A <> member_C)
    AND (id_A <> id_B AND id_B <> id_C AND id_A <> id_C);
    
-- Drop tables
DROP TABLE SchoolA;
DROP TABLE SchoolB;
DROP TABLE SchoolC;
