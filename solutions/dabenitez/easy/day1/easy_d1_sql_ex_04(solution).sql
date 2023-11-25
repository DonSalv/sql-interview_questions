Create table Customers (id int, name varchar(255), CONSTRAINT Customers_pk PRIMARY KEY (id));
Create table Orders (id int, customerId int, CONSTRAINT Orders_pk PRIMARY KEY (id), 
    CONSTRAINT fk_Orders FOREIGN KEY (customerId) REFERENCES Customers(id));

insert into Customers (id, name) values ('1', 'Joe');
insert into Customers (id, name) values ('2', 'Henry');
insert into Customers (id, name) values ('3', 'Sam');
insert into Customers (id, name) values ('4', 'Max');

insert into Orders (id, customerId) values ('1', '3');
insert into Orders (id, customerId) values ('2', '1');

(SELECT name FROM Customers)
MINUS
(SELECT c.name FROM Customers c
INNER JOIN Orders o
ON c.id = o.customerid);

DROP TABLE Orders PURGE;
DROP TABLE Customers PURGE;