-- Create the customer table
Create table Customer (customer_id int, name varchar(20), visited_on date, amount int);

-- Populate the customer table    
Truncate table Customer;
insert into Customer (customer_id, name, visited_on, amount) values (1, 'Jhon', DATE '2019-01-01', 100);
insert into Customer (customer_id, name, visited_on, amount) values (2, 'Daniel', DATE '2019-01-02', 110);
insert into Customer (customer_id, name, visited_on, amount) values (3, 'Jade', DATE '2019-01-03', 120);
insert into Customer (customer_id, name, visited_on, amount) values (4, 'Khaled', DATE '2019-01-04', 130);
insert into Customer (customer_id, name, visited_on, amount) values (5, 'Winston', DATE '2019-01-05', 110);
insert into Customer (customer_id, name, visited_on, amount) values (6, 'Elvis', DATE '2019-01-06', 140);
insert into Customer (customer_id, name, visited_on, amount) values (7, 'Anna', DATE '2019-01-07', 150);
insert into Customer (customer_id, name, visited_on, amount) values (8, 'Maria', DATE '2019-01-08', 80);
insert into Customer (customer_id, name, visited_on, amount) values (9, 'Jaze', DATE '2019-01-09', 110);
insert into Customer (customer_id, name, visited_on, amount) values (1, 'Jhon', DATE '2019-01-10', 130);
insert into Customer (customer_id, name, visited_on, amount) values (3, 'Jade', DATE '2019-01-10', 150);

-- You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).
-- Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before).
-- average_amount should be rounded to two decimal places.
-- Return the result table ordered by visited_on in ascending order
SELECT
    DISTINCT *
FROM (SELECT
          visited_on,
          ROUND(SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS amount,
          ROUND(SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN 6 PRECEDING AND CURRENT ROW)/7,2) AS average_amount
      FROM
          Customer)
WHERE 
    visited_on >= (SELECT MIN(visited_on) FROM Customer) + 6
ORDER BY
    visited_on;

-- Drop tables
DROP TABLE Customer;
