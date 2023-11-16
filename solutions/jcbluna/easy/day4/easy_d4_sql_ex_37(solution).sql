-- Create the tables
CREATE TABLE Prices (product_id int, start_date date, end_date date, price int);
CREATE TABLE UnitsSold (product_id int, purchase_date date, units int);
    
-- Populate the prices table
TRUNCATE TABLE Prices;
INSERT INTO Prices (product_id, start_date, end_date, price) VALUES ('1', TO_DATE('2019-02-17','%YYYY-%MM-%DD'), TO_DATE('2019-02-28','%YYYY-%MM-%DD'), '5');
INSERT INTO Prices (product_id, start_date, end_date, price) VALUES ('1', TO_DATE('2019-03-01','%YYYY-%MM-%DD'), TO_DATE('2019-03-22','%YYYY-%MM-%DD'), '20');
INSERT INTO Prices (product_id, start_date, end_date, price) VALUES ('2', TO_DATE('2019-02-01','%YYYY-%MM-%DD'), TO_DATE('2019-02-20','%YYYY-%MM-%DD'), '15');
INSERT INTO Prices (product_id, start_date, end_date, price) VALUES ('2', TO_DATE('2019-02-21','%YYYY-%MM-%DD'), TO_DATE('2019-03-31','%YYYY-%MM-%DD'), '30');
    
-- Populate the unitsold table
TRUNCATE TABLE UnitsSold;
INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES ('1', TO_DATE('2019-02-25','%YYYY-%MM-%DD'), '100');
INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES ('1', TO_DATE('2019-03-01','%YYYY-%MM-%DD'), '15');
INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES ('2', TO_DATE('2019-02-10','%YYYY-%MM-%DD'), '200');
INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES ('2', TO_DATE('2019-03-22','%YYYY-%MM-%DD'), '30');

-- Solve the exercise
-- Make a LEFT OUTER JOIN to include products even if they were not sold
-- and use NVL to sustitute NULL to 0 in the calculation of the average price
SELECT p.product_id, NVL(ROUND(SUM(price*units)/SUM(units),2),0) AS average_price
FROM Prices p LEFT OUTER JOIN UnitsSold u
ON(p.product_id=u.product_id AND
u.purchase_date>=p.start_date AND
p.end_date>=u.purchase_date)
GROUP BY p.product_id;

-- Drop the tables

DROP TABLE Prices;
DROP TABLE UnitsSold;