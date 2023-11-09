-- Create the products table
CREATE TABLE Products (product_id int, store char(6) CHECK(store IN ('store1', 'store2', 'store3')), price int);

-- Populate the products table    
TRUNCATE TABLE Products;
INSERT INTO Products (product_id, store, price) VALUES ('0', 'store1', '95');
INSERT INTO Products (product_id, store, price) VALUES ('0', 'store3', '105');
INSERT INTO Products (product_id, store, price) VALUES ('0', 'store2', '100');
INSERT INTO Products (product_id, store, price) VALUES ('1', 'store1', '70');
INSERT INTO Products (product_id, store, price) VALUES ('1', 'store3', '80');

-- Solve the exercise
SELECT * FROM
(
  SELECT product_id, store, price
  FROM Products
)
PIVOT 
(
  SUM(price)
  FOR store
  IN ('store1' AS store1, 'store2' AS store2, 'store3' AS store3)
)
ORDER BY product_id;

-- Drop unused table
DROP TABLE Products;