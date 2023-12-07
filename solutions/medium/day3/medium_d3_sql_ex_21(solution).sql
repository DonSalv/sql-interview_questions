Create table Books (book_id int, name varchar(50), available_from date, CONSTRAINT Books_pk PRIMARY KEY (book_id));
Create table Orders (order_id int, book_id int, quantity int, dispatch_date date, CONSTRAINT Orders_pk PRIMARY KEY (order_id),
CONSTRAINT fk_Orders FOREIGN KEY (book_id) REFERENCES Books(book_id));

insert into Books (book_id, name, available_from) values ('1', 'Kalila And Demna', TO_DATE('2010-01-01','YYYY-MM-DD'));
insert into Books (book_id, name, available_from) values ('2', '28 Letters', TO_DATE('2012-05-12','YYYY-MM-DD'));
insert into Books (book_id, name, available_from) values ('3', 'The Hobbit', TO_DATE('2019-06-10','YYYY-MM-DD'));
insert into Books (book_id, name, available_from) values ('4', '13 Reasons Why', TO_DATE('2019-06-01','YYYY-MM-DD'));
insert into Books (book_id, name, available_from) values ('5', 'The Hunger Games', TO_DATE('2008-09-21','YYYY-MM-DD'));

insert into Orders (order_id, book_id, quantity, dispatch_date) values ('1', '1', '2', TO_DATE('2018-07-26','YYYY-MM-DD'));
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('2', '1', '1', TO_DATE('2018-11-05','YYYY-MM-DD'));
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('3', '3', '8', TO_DATE('2019-06-11','YYYY-MM-DD'));
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('4', '4', '6', TO_DATE('2019-06-05','YYYY-MM-DD'));
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('5', '4', '5', TO_DATE('2019-06-20','YYYY-MM-DD'));
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('6', '5', '9', TO_DATE('2009-02-02','YYYY-MM-DD'));
insert into Orders (order_id, book_id, quantity, dispatch_date) values ('7', '5', '8', TO_DATE('2010-04-13','YYYY-MM-DD'));

SELECT b.book_id, b.name FROM Books b
LEFT JOIN (
SELECT book_id, SUM(quantity) AS total FROM Orders
WHERE dispatch_date >= ADD_MONTHS(TO_DATE('2019-06-23', 'YYYY-MM-DD'), -12)
AND dispatch_date < TO_DATE('2019-06-23', 'YYYY-MM-DD')
GROUP BY book_id) Q1
ON b.book_id=Q1.book_id
WHERE b.available_from < ADD_MONTHS(TO_DATE('2019-06-23', 'YYYY-MM-DD'), -1)
AND Q1.total < 10 OR Q1.total IS NULL;

DROP TABLE Orders PURGE;
DROP TABLE Books PURGE;