create table Employee( 
id  number UNIQUE,
salary NUMBER);

Truncate table Employee;
insert into Employee (id, salary) values (1, 100);
insert into Employee (id, salary) values (2, 200);
insert into Employee (id, salary) values (3, 300);


create or REPLACE function get_nth_highest_salary(n in NUMBER)
RETURN NUMBER IS
       result NUMBER;
BEGIN
    SELECT max(salary) INTO result
                FROM 
                    (select salary, dense_rank() over (order by salary desc) as ranking 
                     from Employee)
    WHERE ranking = n;
    
RETURN result;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END get_nth_highest_salary;
/

SELECT  get_nth_highest_salary(2) FROM  dual;