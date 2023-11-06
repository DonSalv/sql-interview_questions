-- Create the tables
CREATE TABLE SalesPerson (sales_id int, name varchar(255), salary int, commission_rate int, hire_date date);
CREATE TABLE Company (com_id int, name varchar(255), city varchar(255));
CREATE TABLE Orders (order_id int, order_date date, com_id int, sales_id int, amount int);

-- Populate the salesperson table    
TRUNCATE TABLE SalesPerson;
INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date) VALUES ('1', 'John', '100000', '6', TO_DATE('04/01/2006','%MM/%DD/%YYYY'));
INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date) VALUES ('2', 'Amy', '12000', '5', TO_DATE('05/01/2010','%MM/%DD/%YYYY'));
INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date) VALUES ('3', 'Mark', '65000', '12', TO_DATE('12/25/2008','%MM/%DD/%YYYY'));
INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date) VALUES ('4', 'Pam', '25000', '25', TO_DATE('01/01/2005','%MM/%DD/%YYYY'));
INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date) VALUES ('5', 'Alex', '5000', '10', TO_DATE('02/03/2007','%MM/%DD/%YYYY'));

-- Populate the company table
TRUNCATE TABLE Company;
INSERT INTO Company (com_id, name, city) VALUES ('1', 'RED', 'Boston');
INSERT INTO Company (com_id, name, city) VALUES ('2', 'ORANGE', 'New York');
INSERT INTO Company (com_id, name, city) VALUES ('3', 'YELLOW', 'Boston');
INSERT INTO Company (com_id, name, city) VALUES ('4', 'GREEN', 'Austin');

-- Populate the orders table
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, order_date, com_id, sales_id, amount) VALUES ('1', TO_DATE('01/01/2014','%DD/%MM/%YYYY'), '3', '4', '10000');
INSERT INTO Orders (order_id, order_date, com_id, sales_id, amount) VALUES ('2', TO_DATE('02/01/2014','%DD/%MM/%YYYY'), '4', '5', '5000');
INSERT INTO Orders (order_id, order_date, com_id, sales_id, amount) VALUES ('3', TO_DATE('03/01/2014','%DD/%MM/%YYYY'), '1', '1', '50000');
INSERT INTO Orders (order_id, order_date, com_id, sales_id, amount) VALUES ('4', TO_DATE('04/01/2014','%DD/%MM/%YYYY'), '1', '4', '25000');

-- Solve the exercise

--Solve the exercise
SELECT name FROM
SalesPerson
WHERE name NOT IN (
                    SELECT DISTINCT s.name
                    FROM SalesPerson s LEFT OUTER JOIN Orders o
                    ON(s.sales_id=o.sales_id)
                    LEFT OUTER JOIN Company c
                    ON(o.com_id=c.com_id)
                    WHERE c.name='RED');

-- Drop unused tables
DROP TABLE SalesPerson;
DROP TABLE Company;
DROP TABLE Orders;