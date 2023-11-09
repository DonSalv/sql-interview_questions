-- Create the products table
CREATE TABLE Products (product_id int, store1 int, store2 int, store3 int);
    
-- Populate the products table
TRUNCATE TABLE Products;
INSERT INTO Products (product_id, store1, store2, store3) VALUES ('0', '95', '100', '105');
INSERT INTO Products (product_id, store1, store2, store3) VALUES ('1', '70', NULL, '80');

-- Solve the exercise
SELECT 
    product_id, store, price
FROM Products
UNPIVOT EXCLUDE NULLS(
    price
    FOR store
    IN (store1 AS 'store1', store2 AS 'store2', store3 AS 'store3') 
);

-- Drop unused table
DROP TABLE Products;