-- Create the tables
CREATE TABLE Product (product_id int, product_name varchar(10), unit_price int);
CREATE TABLE Sales (seller_id int, product_id int, buyer_id int, sale_date date, quantity int, price int);
    
-- Populate the product table
TRUNCATE TABLE Product;
INSERT INTO Product (product_id, product_name, unit_price) VALUES ('1', 'S8', '1000');
INSERT INTO Product (product_id, product_name, unit_price) VALUES ('2', 'G4', '800');
INSERT INTO Product (product_id, product_name, unit_price) VALUES ('3', 'iPhone', '1400');
    
-- Populate the sales table
TRUNCATE TABLE Sales;
INSERT INTO Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES ('1', '1', '1', TO_DATE('2019-01-21','%YYYY-%MM-%DD'), '2', '2000');
INSERT INTO Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES ('1', '2', '2', TO_DATE('2019-02-17','%YYYY-%MM-%DD'), '1', '800');
INSERT INTO Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES ('2', '2', '3', TO_DATE('2019-06-02','%YYYY-%MM-%DD'), '1', '800');
INSERT INTO Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES ('3', '3', '4', TO_DATE('2019-05-13','%YYYY-%MM-%DD'), '2', '2800');

-- Solve the exercise
SELECT buyer_id
FROM (
        SELECT buyer_id, LISTAGG(product_name,' : ') WITHIN GROUP (ORDER BY buyer_id) AS list_purchases
        FROM SALES JOIN Product
        USING(product_id)
        GROUP BY buyer_id)
WHERE list_purchases LIKE '%S8%'
AND list_purchases NOT LIKE '%iPhone%';

-- Drop unused
DROP TABLE Product;
DROP TABLE Sales;