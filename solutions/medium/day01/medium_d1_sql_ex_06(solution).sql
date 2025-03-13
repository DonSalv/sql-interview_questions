
-- medium day 1 ex 06
-- Create the employee table
Create table Employee (id number, name varchar(255), department varchar(255), managerId number);
    
-- Populate the employee table
Truncate table Employee
insert into Employee (id, name, department, managerId) values (101, 'John', 'A', Null);
insert into Employee (id, name, department, managerId) values (102, 'Dan', 'A', 101);
insert into Employee (id, name, department, managerId) values (103, 'James', 'A',101);
insert into Employee (id, name, department, managerId) values (104, 'Amy', 'A', 101);
insert into Employee (id, name, department, managerId) values (105, 'Anne', 'A', 101);
insert into Employee (id, name, department, managerId) values (106, 'Ron', 'B', 101);

select * from Employee;

--solution 1
select e.name from Employee e join 
    (select managerId , count(*)as total from Employee 
        where managerid is not null -- remove 
        group by managerId) agg on e.id = agg.managerId 
where total >= 5;  

-- solution 2

select e1.name as name
from Employee e1 join employee e2 on e1.id = e2.managerid 
group by e1.id, e1.name        
having count(e2.managerId)>= 5;
--  more readable