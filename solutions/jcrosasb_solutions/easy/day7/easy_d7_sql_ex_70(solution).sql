-- Create the products table
Create table Products (product_id int, store varchar(6) CONSTRAINT check_enum_values CHECK (store IN ('store1', 'store2', 'store3')), price int);

-- Populate the products table    
Truncate table Products;
insert into Products (product_id, store, price) values (0, 'store1', 95);
insert into Products (product_id, store, price) values (0, 'store3', 105);
insert into Products (product_id, store, price) values (0, 'store2', 100);
insert into Products (product_id, store, price) values (1, 'store1', 70);
insert into Products (product_id, store, price) values (1, 'store3', 80);

-- Find the price of each product in each store.
SELECT
    product_id,
    MAX(CASE WHEN store = 'store1' THEN price ELSE NULL END) store1,
    MAX(CASE WHEN store = 'store2' THEN price ELSE NULL END) store2,
    MAX(CASE WHEN store = 'store3' THEN price ELSE NULL END) store3
FROM Products
GROUP BY product_id
ORDER BY product_id;

-- Drop tables
DROP TABLE Products;
