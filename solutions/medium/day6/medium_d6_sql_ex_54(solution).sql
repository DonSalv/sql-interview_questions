Create table Customers (customer_id int, customer_name varchar(20), CONSTRAINT Customers_pk PRIMARY KEY (customer_id));

insert into Customers (customer_id, customer_name) values ('1', 'Alice');
insert into Customers (customer_id, customer_name) values ('4', 'Bob');
insert into Customers (customer_id, customer_name) values ('5', 'Charlie');

SELECT level AS ids FROM dual
CONNECT BY level <= (SELECT MAX(customer_id) FROM Customers)
MINUS
(SELECT customer_id FROM Customers);

DROP TABLE Customers PURGE;
