-- Create the tables
Create table Product(product_id int, name varchar(15));
Create table Invoice(invoice_id int,product_id int,rest int, paid int, canceled int, refunded int);

-- Populate the product table    
Truncate table Product;
insert into Product (product_id, name) values (0, 'ham');
insert into Product (product_id, name) values (1, 'bacon');

-- Populate the invoice table
Truncate table Invoice;
insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values (23, 0, 2, 0, 5, 0);
insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values (12, 0, 0, 4, 0, 3);
insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values (1, 1, 1, 1, 0, 1);
insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values (2, 1, 1, 0, 1, 1);
insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values (3, 1, 0, 1, 1, 1);
insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values (4, 1, 1, 1, 1, 0);

-- Write a solution that will, for all products, return each product name with the total amount due, paid, canceled, and refunded across all invoices.
-- Return the result table ordered by product_name
SELECT 
    p.name, 
    SUM(i.rest) rest, 
    SUM(i.paid) paid, 
    SUM(i.canceled) canceled, 
    SUM(i.refunded) refunded 
FROM Invoice i 
INNER JOIN Product p 
USING (product_id) 
GROUP BY p.name 
ORDER BY p.name;

-- Drop tables
DROP TABLE Product;
DROP TABLE Invoice;
