-- Create the products table
Create table Products (product_id int, store1 int, store2 int, store3 int);
    
-- Populate the products table
Truncate table Products;
insert into Products (product_id, store1, store2, store3) values (0, 95, 100, 105);
insert into Products (product_id, store1, store2, store3) values (1, 70, NULL, 80);

-- Write a solution to rearrange the PRODUCTS table so that each row has (product_id, store, price). 
-- If a product is not available in a store, do not include a row with that product_id and store combination in the result table
/*
SELECT
    product_id,
    store,
    price
FROM
    (SELECT
        product_id,
        store1,
        store2,
        store3
    FROM
        PRODUCTS) t
UNPIVOT
    (price FOR store IN (store1, store2, store3));
*/




create table pivot_test (
  id            number,
  customer_id   number,
  product_code  varchar2(5),
  quantity      number
);

insert into pivot_test values (1, 1, 'A', 10);
insert into pivot_test values (2, 1, 'B', 20);
insert into pivot_test values (3, 1, 'C', 30);
insert into pivot_test values (4, 2, 'A', 40);
insert into pivot_test values (5, 2, 'C', 50);
insert into pivot_test values (6, 3, 'A', 60);
insert into pivot_test values (7, 3, 'B', 70);
insert into pivot_test values (8, 3, 'C', 80);
insert into pivot_test values (9, 3, 'D', 90);
insert into pivot_test values (10, 4, 'A', 100);

SELECT * from pivot_test;


-- Drop tables
DROP TABLE Products;

DROP TABLE pivot_test;
