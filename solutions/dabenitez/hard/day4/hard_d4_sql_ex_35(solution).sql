Create table Products (product_id int, price int, CONSTRAINT Products_pk PRIMARY KEY (product_id));
Create table Purchases (invoice_id int, product_id int, quantity int,
CONSTRAINT fk_Purchases FOREIGN KEY (product_id) REFERENCES Products(product_id));

ALTER TABLE Purchases ADD PRIMARY KEY (invoice_id, product_id) DISABLE;

insert into Products (product_id, price) values ('1', '100');
insert into Products (product_id, price) values ('2', '200');

insert into Purchases (invoice_id, product_id, quantity) values ('1', '1', '2');
insert into Purchases (invoice_id, product_id, quantity) values ('3', '2', '1');
insert into Purchases (invoice_id, product_id, quantity) values ('2', '2', '3');
insert into Purchases (invoice_id, product_id, quantity) values ('2', '1', '4');
insert into Purchases (invoice_id, product_id, quantity) values ('4', '1', '10');

SELECT p1.product_id, p1.quantity, p1.quantity*p2.price AS price FROM Purchases p1 
JOIN Products p2 ON p2.product_id = p1.product_id
WHERE p1.invoice_id IN
(SELECT invoice_id FROM
(SELECT p1.invoice_id, SUM(p1.quantity*p2.price) AS total,
RANK() OVER (ORDER BY SUM(p1.quantity*p2.price) DESC, p1.invoice_id) AS ranking
FROM Purchases p1
JOIN Products p2 ON p2.product_id = p1.product_id
GROUP BY p1.invoice_id)
WHERE ranking=1);

DROP TABLE Purchases PURGE;
DROP TABLE Products PURGE;