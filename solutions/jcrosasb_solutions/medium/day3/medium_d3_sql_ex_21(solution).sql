-- To alter date format
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- Create the tables
Create table Books (book_id int, name varchar(50), available_from date);
Create table Orders (order_id int, book_id int, quantity int, dispatch_date date);

-- Populate the books table    
Truncate table Books;
insert into Books (book_id, name, available_from) values (1, 'Kalila And Demna', DATE '2010-01-01');
insert into Books (book_id, name, available_from) values (2, '28 Letters', DATE '2012-05-12');
insert into Books (book_id, name, available_from) values (3, 'The Hobbit', DATE '2019-06-10');
insert into Books (book_id, name, available_from) values (4, '13 Reasons Why', DATE '2019-06-01');
insert into Books (book_id, name, available_from) values (5, 'The Hunger Games', DATE '2008-09-21');
    
-- Populate the orders table
Truncate table Orders;
insert into Orders (order_id, book_id, quantity, dispatch_date) values (1, 1, 2, DATE '2018-07-26');
insert into Orders (order_id, book_id, quantity, dispatch_date) values (2, 1, 1, DATE '2018-11-05');
insert into Orders (order_id, book_id, quantity, dispatch_date) values (3, 3, 8, DATE '2019-06-11');
insert into Orders (order_id, book_id, quantity, dispatch_date) values (4, 4, 6, DATE '2019-06-05');
insert into Orders (order_id, book_id, quantity, dispatch_date) values (5, 4, 5, DATE '2019-06-20');
insert into Orders (order_id, book_id, quantity, dispatch_date) values (6, 5, 9, DATE '2009-02-02');
insert into Orders (order_id, book_id, quantity, dispatch_date) values (7, 5, 8, DATE '2010-04-13');

-- Write a solution to report the books that have sold less than 10 copies in the last year, 
-- excluding books that have been available for less than one month from today. Assume today is 2019-06-23
SELECT
    b.book_id,
    b.name
FROM
    Books b
INNER JOIN
    Orders o
ON
    b.book_id = o.book_id
WHERE
    b.available_from < TO_DATE('2019-06-23') - INTERVAL '1' MONTH AND
    o.dispatch_date >= TO_DATE('2019-06-23') - INTERVAL '1' YEAR
GROUP BY
    b.book_id,
    b.name
HAVING
    SUM(o.quantity) < 10
UNION
SELECT
    b.book_id,
    b.name
FROM
    Books b
WHERE
    b.available_from < TO_DATE('2019-06-23') - INTERVAL '1' MONTH AND
    b.book_id NOT IN (SELECT
                        DISTINCT o.book_id
                    FROM
                        Orders o
                    WHERE
                        o.dispatch_date >= TO_DATE('2019-06-23') - INTERVAL '1' YEAR);

-- Drop tables
DROP TABLE Books;
DROP TABLE Orders;
