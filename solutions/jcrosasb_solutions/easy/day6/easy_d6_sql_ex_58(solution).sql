-- Create the tables;
Create table Customer (customer_id int, customer_name varchar(20));
Create table Orders (order_id int, sale_date date, order_cost int, customer_id int, seller_id int);
Create table Seller (seller_id int, seller_name varchar(20));

-- Populate the customer table
Truncate table Customer;
insert into Customer (customer_id, customer_name) values (101, 'Alice');
insert into Customer (customer_id, customer_name) values (102, 'Bob');
insert into Customer (customer_id, customer_name) values (103, 'Charlie');

-- Populate the orders table
Truncate table Orders;
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values (1, DATE '2020-03-01', 1500, 101, 1);
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values (2, DATE '2020-05-25', 2400, 102, 2);
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values (3, DATE '2019-05-25', 800, 101, 3);
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values (4, DATE '2020-09-13', 1000, 103, 2);
insert into Orders (order_id, sale_date, order_cost, customer_id, seller_id) values (5, DATE '2019-02-11', 700, 101, 2);

-- Populate the seller table
Truncate table Seller;
insert into Seller (seller_id, seller_name) values (1, 'Daniel');
insert into Seller (seller_id, seller_name) values (2, 'Elizabeth');
insert into Seller (seller_id, seller_name) values (3, 'Frank');

-- Write a solution to report the names of all sellers who did not make any sales in 2020
SELECT 
    seller_name
FROM (SELECT 
          s.seller_name, 
          LISTAGG(TO_CHAR(sale_date, 'YYYY'), ',') 
            WITHIN GROUP (ORDER BY TO_CHAR(sale_date, 'YYYY')) years 
      FROM Seller s 
      INNER JOIN Orders o 
      USING(seller_id) 
      GROUP BY s.seller_name)
WHERE INSTR(years, '2020') = 0; 

-- Drop tables
DROP TABLE Customer;
DROP TABLE Orders;
DROP TABLE Seller;
