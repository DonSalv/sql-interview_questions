-- Create the tables
CREATE TABLE Books (book_id int, name varchar(50), available_from date);
CREATE TABLE Orders (order_id int, book_id int, quantity int, dispatch_date date);

-- Populate the books table    
TRUNCATE TABLE Books;
INSERT INTO Books (book_id, name, available_from) VALUES ('1', 'Kalila And Demna', TO_DATE('2010-01-01','%YYYY-%MM-%DD'));
INSERT INTO Books (book_id, name, available_from) VALUES ('2', '28 Letters', TO_DATE('2012-05-12','%YYYY-%MM-%DD'));
INSERT INTO Books (book_id, name, available_from) VALUES ('3', 'The Hobbit', TO_DATE('2019-06-10','%YYYY-%MM-%DD'));
INSERT INTO Books (book_id, name, available_from) VALUES ('4', '13 Reasons Why', TO_DATE('2019-06-01','%YYYY-%MM-%DD'));
INSERT INTO Books (book_id, name, available_from) VALUES ('5', 'The Hunger Games', TO_DATE('2008-09-21','%YYYY-%MM-%DD'));
    
-- Populate the orders table
TRUNCATE TABLE Orders;
INSERT INTO Orders (order_id, book_id, quantity, dispatch_date) VALUES ('1', '1', '2', TO_DATE('2018-07-26','%YYYY-%MM-%DD'));
INSERT INTO Orders (order_id, book_id, quantity, dispatch_date) VALUES ('2', '1', '1', TO_DATE('2018-11-05','%YYYY-%MM-%DD'));
INSERT INTO Orders (order_id, book_id, quantity, dispatch_date) VALUES ('3', '3', '8', TO_DATE('2019-06-11','%YYYY-%MM-%DD'));
INSERT INTO Orders (order_id, book_id, quantity, dispatch_date) VALUES ('4', '4', '6', TO_DATE('2019-06-05','%YYYY-%MM-%DD'));
INSERT INTO Orders (order_id, book_id, quantity, dispatch_date) VALUES ('5', '4', '5', TO_DATE('2019-06-20','%YYYY-%MM-%DD'));
INSERT INTO Orders (order_id, book_id, quantity, dispatch_date) VALUES ('6', '5', '9', TO_DATE('2009-02-02','%YYYY-%MM-%DD'));
INSERT INTO Orders (order_id, book_id, quantity, dispatch_date) VALUES ('7', '5', '8', TO_DATE('2010-04-13','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT DISTINCT b.book_id, name
FROM Books b LEFT OUTER JOIN Orders o
ON(b.book_id=o.book_id)
WHERE available_from<ADD_MONTHS(TO_DATE('2019-06-23','%YYYY-%MM-%DD'),-1)
MINUS
SELECT DISTINCT b.book_id, name
FROM Books b LEFT OUTER JOIN Orders o
ON(b.book_id=o.book_id)
WHERE (TO_DATE('2019-06-23','%YYYY-%MM-%DD')-dispatch_date)/365<1
GROUP BY b.book_id, name
HAVING SUM(quantity)>=10;


-- Drop unused tables
DROP TABLE Books;
DROP TABLE Orders;