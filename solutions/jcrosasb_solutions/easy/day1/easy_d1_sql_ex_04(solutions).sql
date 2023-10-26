-- Create the tables
Create table Customers (id int, name varchar(255));
Create table Orders (id int, customerId int);

-- Populate the customers table
Truncate table Customers;
insert into Customers (id, name) values ('1', 'Joe');
insert into Customers (id, name) values ('2', 'Henry');
insert into Customers (id, name) values ('3', 'Sam');
insert into Customers (id, name) values ('4', 'Max');

-- Populate the orders table
Truncate table Orders;
insert into Orders (id, customerId) values ('1', '3');
insert into Orders (id, customerId) values ('2', '1');

-- Write a solution to find all customers who never order anything.
SELECT c.name 
    FROM customers c 
    WHERE c.id 
    NOT IN (
            SELECT o.customerId 
            FROM Orders o
           );
