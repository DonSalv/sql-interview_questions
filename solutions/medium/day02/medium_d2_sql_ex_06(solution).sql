-- medium day 2 ex 16            
            
-- Create the tables
Create table Customer (customer_id int, product_key int);
Create table Product (product_key int);

-- Populate the customer table
Truncate table Customer;
insert into Customer (customer_id, product_key) values (1, 5);
insert into Customer (customer_id, product_key) values (2, 6);
insert into Customer (customer_id, product_key) values (3, 5);
insert into Customer (customer_id, product_key) values (3, 6);
insert into Customer (customer_id, product_key) values (1, 6);

-- Populate the product table
Truncate table Product;
insert into Product (product_key) values (5);
insert into Product (product_key) values (6);

-- query 1    
select  customer_id from Customer 
group by customer_id
having count(distinct product_key) = (select count(*) from Product);

-- query 2
SELECT customer_id
FROM (
SELECT customer_id, COUNT(DISTINCT product_key) AS num_diff_prods
FROM Customer
GROUP BY customer_id)
WHERE num_diff_prods=(SELECT COUNT(DISTINCT product_key) FROM Product);        


drop table Product;
drop table Customer;
-- From chatgpt
--            
--    Query 1 (Using HAVING) is more concise and easier to read. It directly expresses the logic of counting distinct products per customer and filtering based on the total number of products.
--    Query 2 (Subquery Approach) introduces an extra subquery, which may improve clarity in some cases but makes the query more complex without a clear benefit.
--
--Verdict on Readability: ✅ Query 1 is better due to its simplicity.           
--            
--     Efficiency Analysis
--Breakdown of Performance Factors
--
--    Query 1 Execution Plan (Using HAVING)
--        Scans the Customer table.
--        Groups by customer_id and computes COUNT(DISTINCT product_key).
--        Runs the subquery (SELECT COUNT(*) FROM Product) once (constant value).
--        Uses HAVING to filter results.
--
--    Efficiency: 🚀 More direct, avoids unnecessary subqueries.
--
--    Query 2 Execution Plan (Using Subquery)
--        The inner subquery scans the Customer table, groups by customer_id, and calculates COUNT(DISTINCT product_key).
--        The outer query then filters based on the count of unique products from Product.
--        The subquery (SELECT COUNT(DISTINCT product_key) FROM Product) is executed separately.
--
--    Efficiency: 🚨 Potentially less efficient, as it creates an extra derived table before applying filtering.
--
--Big-O Complexity Estimate
--
--    Query 1: O(N)O(N) for grouping Customer, plus O(1)O(1) for Product count.
--    Query 2: O(N)O(N) for inner grouping, plus O(N)O(N) for filtering in the outer query.       
            

-- Performance Considerations
--
--    Query 1 performs better because:
--        It avoids materializing an extra table.
--        The filter condition in HAVING operates at the aggregation level.
--    Query 2 may be slower if the dataset is large, as it creates an intermediate derived table.