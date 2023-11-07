-- Create the tables
Create table Products (product_id int, product_name varchar(40), product_category varchar(40));
Create table Orders (product_id int, order_date date, unit int);
    
-- Populate the products table
Truncate table Products;
insert into Products (product_id, product_name, product_category) values (1, 'Leetcode Solutions', 'Book');
insert into Products (product_id, product_name, product_category) values (2, 'Jewels of Stringology', 'Book');
insert into Products (product_id, product_name, product_category) values (3, 'HP', 'Laptop');
insert into Products (product_id, product_name, product_category) values (4, 'Lenovo', 'Laptop');
insert into Products (product_id, product_name, product_category) values (5, 'Leetcode Kit', 'T-shirt');
    
-- Populate the orders table
Truncate table Orders;
insert into Orders (product_id, order_date, unit) values (1, DATE '2020-02-05', 60);
insert into Orders (product_id, order_date, unit) values (1, DATE '2020-02-10', 70);
insert into Orders (product_id, order_date, unit) values (2, DATE '2020-01-18', 30);
insert into Orders (product_id, order_date, unit) values (2, DATE '2020-02-11', 80);
insert into Orders (product_id, order_date, unit) values (3, DATE '2020-02-17', 2);
insert into Orders (product_id, order_date, unit) values (3, DATE '2020-02-24', 3);
insert into Orders (product_id, order_date, unit) values (4, DATE '2020-03-01', 20);
insert into Orders (product_id, order_date, unit) values (4, DATE '2020-03-04', 30);
insert into Orders (product_id, order_date, unit) values (4, DATE '2020-03-04', 60);
insert into Orders (product_id, order_date, unit) values (5, DATE '2020-02-25', 50);
insert into Orders (product_id, order_date, unit) values (5, DATE '2020-02-27', 50);
insert into Orders (product_id, order_date, unit) values (5, DATE '2020-03-01', 50);

-- Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.
SELECT 
    product_name, 
    SUM(unit) unit 
FROM (SELECT 
          p.product_name, 
          o.unit 
      FROM Products p 
      INNER JOIN Orders o 
      ON p.product_id = o.product_id 
      WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29') 
GROUP BY product_name
HAVING SUM(unit) >= 100;

-- Drop tables
DROP TABLE Products;
DROP TABLE Orders;
