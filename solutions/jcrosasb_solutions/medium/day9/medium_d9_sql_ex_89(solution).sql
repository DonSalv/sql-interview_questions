-- Create the tables
Create table Salesperson (salesperson_id int, name varchar(30));
Create table Customer (customer_id int, salesperson_id int);
Create table Sales (sale_id int, customer_id int, price int);

-- Populate the salesperson table    
Truncate table Salesperson;
insert into Salesperson (salesperson_id, name) values ('1', 'Alice');
insert into Salesperson (salesperson_id, name) values ('2', 'Bob');
insert into Salesperson (salesperson_id, name) values ('3', 'Jerry');

-- Populate the customer table    
Truncate table Customer;
insert into Customer (customer_id, salesperson_id) values ('1', '1');
insert into Customer (customer_id, salesperson_id) values ('2', '1');
insert into Customer (customer_id, salesperson_id) values ('3', '2');

-- Populate the sales table    
Truncate table Sales;
insert into Sales (sale_id, customer_id, price) values ('1', '2', '892');
insert into Sales (sale_id, customer_id, price) values ('2', '1', '354');
insert into Sales (sale_id, customer_id, price) values ('3', '3', '988');
insert into Sales (sale_id, customer_id, price) values ('4', '3', '856');

-- Write a solution to report the sum of prices paid by the customers of each salesperson. 
-- If a salesperson does not have any customers, the total value should be 0
SELECT
    salesperson_id,
    name,
    NVL(SUM(price),0) AS total
FROM
    (SELECT
         sale_id,
         customer_id,
         salesperson_id,
         name,
         price
     FROM
         Sales
     INNER JOIN
         Customer
     USING
         (customer_id)
     RIGHT JOIN
         Salesperson
     USING
         (salesperson_id))
GROUP BY
     salesperson_id,
     name
ORDER BY
    salesperson_id;
    
-- Drop tables
DROP TABLE Salesperson;
DROP TABLE Customer;
DROP TABLE Sales;
