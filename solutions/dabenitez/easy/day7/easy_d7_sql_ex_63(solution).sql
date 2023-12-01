Create table Product(product_id int, name varchar(15), CONSTRAINT Product_pk PRIMARY KEY (product_id));
Create table Invoice(invoice_id int,product_id int,rest int, paid int, canceled int, refunded int, CONSTRAINT Invoice_pk PRIMARY KEY (invoice_id),
CONSTRAINT fk_Invoice FOREIGN KEY (product_id) REFERENCES Product(product_id));

insert into Product (product_id, name) values ('0', 'ham');
insert into Product (product_id, name) values ('1', 'bacon');

insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values ('23', '0', '2', '0', '5', '0');
insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values ('12', '0', '0', '4', '0', '3');
insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values ('1', '1', '1', '1', '0', '1');
insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values ('2', '1', '1', '0', '1', '1');
insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values ('3', '1', '0', '1', '1', '1');
insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values ('4', '1', '1', '1', '1', '0');

SELECT name, SUM(rest) AS rest, SUM(paid) AS paid, SUM(canceled) AS canceled, SUM(refunded) AS refunded FROM
(SELECT p.name, i.rest, i.paid, i.canceled, i.refunded FROM Invoice i
JOIN Product p ON i.product_id=p.product_id)
GROUP BY name ORDER BY name;

DROP TABLE Invoice PURGE;
DROP TABLE Product PURGE;