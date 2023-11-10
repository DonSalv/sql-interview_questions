-- Create the tables
Create table Customers (customer_id int, name varchar(30), country varchar(30));
Create table Product (product_id int, description varchar(30), price int);
Create table Orders (order_id int, customer_id int, product_id int, order_date date, quantity int);

-- Populate the customers table
Truncate table Customers;
insert into Customers (customer_id, name, country) values (1, 'Winston', 'USA');
insert into Customers (customer_id, name, country) values (2, 'Jonathan', 'Peru');
insert into Customers (customer_id, name, country) values (3, 'Moustafa', 'Egypt');
    
-- Populate the product table
Truncate table Product;
insert into Product (product_id, description, price) values (10, 'LC Phone', 300);
insert into Product (product_id, description, price) values (20, 'LC T-Shirt', 10);
insert into Product (product_id, description, price) values (30, 'LC Book', 45);
insert into Product (product_id, description, price) values (40, 'LC Keychain', 2);

-- Populate the orders table    
Truncate table Orders;
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (1, 1, 10, DATE '2020-06-10', 1);
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (2, 1, 20, DATE '2020-07-01', 1);
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (3, 1, 30, DATE '2020-07-08', 2);
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (4, 2, 10, DATE '2020-06-15', 2);
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (5, 2, 40, DATE '2020-07-01', 10);
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (6, 3, 20, DATE '2020-06-24', 2);
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (7, 3, 30, DATE '2020-06-25', 2);
insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (9, 3, 30, DATE '2020-05-08', 3);

-- Write a solution to report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020
SELECT 
    customer_id, 
    name
FROM (SELECT 
          customer_id, 
          name, 
          month, 
          SUM(price * quantity) total_spent 
      FROM (SELECT 
                customer_id, 
                name, 
                TO_CHAR(order_date, 'YYYY-MM') month , 
                price, quantity 
            FROM Orders 
            INNER JOIN Customers 
            USING (customer_id) 
            INNER JOIN Product 
            USING (product_id)) 
     GROUP BY customer_id, name, month) 
WHERE total_spent >= 100 
AND (month = '2020-06' OR month = '2020-07')
GROUP BY customer_id, name
HAVING count(name) > 1;

-- Drop tables
DROP TABLE Customers;
DROP TABLE Product;
DROP TABLE Orders;
