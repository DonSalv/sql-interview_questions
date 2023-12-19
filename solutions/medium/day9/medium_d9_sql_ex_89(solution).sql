Create table Salesperson (salesperson_id int, name varchar(30), CONSTRAINT Salesperson_pk PRIMARY KEY (salesperson_id));
Create table Customer (customer_id int, salesperson_id int, CONSTRAINT Customer_pk PRIMARY KEY (customer_id),
CONSTRAINT fk_Customer FOREIGN KEY (salesperson_id) REFERENCES Salesperson(salesperson_id));
Create table Sales (sale_id int, customer_id int, price int, CONSTRAINT Sales_pk PRIMARY KEY (sale_id),
CONSTRAINT fk_Sales FOREIGN KEY (customer_id) REFERENCES Customer(customer_id));

insert into Salesperson (salesperson_id, name) values ('1', 'Alice');
insert into Salesperson (salesperson_id, name) values ('2', 'Bob');
insert into Salesperson (salesperson_id, name) values ('3', 'Jerry');

insert into Customer (customer_id, salesperson_id) values ('1', '1');
insert into Customer (customer_id, salesperson_id) values ('2', '1');
insert into Customer (customer_id, salesperson_id) values ('3', '2');

insert into Sales (sale_id, customer_id, price) values ('1', '2', '892');
insert into Sales (sale_id, customer_id, price) values ('2', '1', '354');
insert into Sales (sale_id, customer_id, price) values ('3', '3', '988');
insert into Sales (sale_id, customer_id, price) values ('4', '3', '856');

SELECT sp.salesperson_id,sp.name, COALESCE(SUM(price),0) AS total FROM Salesperson sp LEFT JOIN
(SELECT c.salesperson_id, s.price FROM Customer c
LEFT JOIN Sales s ON s.customer_id = c.customer_id) Q1
ON sp.salesperson_id=q1.salesperson_id
GROUP BY sp.salesperson_id,sp.name ORDER BY sp.salesperson_id;

DROP TABLE Sales PURGE;
DROP TABLE Customer PURGE;
DROP TABLE Salesperson PURGE;