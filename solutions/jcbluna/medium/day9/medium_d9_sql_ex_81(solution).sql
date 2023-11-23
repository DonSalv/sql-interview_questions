-- Create the purchases table
CREATE TABLE Purchases (purchase_id int, user_id int, purchase_date date);
    
-- Populate the purchases table
TRUNCATE TABLE Purchases;
INSERT INTO Purchases (purchase_id, user_id, purchase_date) VALUES ('4', '2', TO_DATE('2022-03-13','%YYYY-%MM-%DD'));
INSERT INTO Purchases (purchase_id, user_id, purchase_date) VALUES ('1', '5', TO_DATE('2022-02-11','%YYYY-%MM-%DD'));
INSERT INTO Purchases (purchase_id, user_id, purchase_date) VALUES ('3', '7', TO_DATE('2022-06-19','%YYYY-%MM-%DD'));
INSERT INTO Purchases (purchase_id, user_id, purchase_date) VALUES ('6', '2', TO_DATE('2022-03-20','%YYYY-%MM-%DD'));
INSERT INTO Purchases (purchase_id, user_id, purchase_date) VALUES ('5', '7', TO_DATE('2022-06-19','%YYYY-%MM-%DD'));
INSERT INTO Purchases (purchase_id, user_id, purchase_date) VALUES ('2', '2', TO_DATE('2022-06-08','%YYYY-%MM-%DD'));

-- Solve the exercise
SELECT DISTINCT p1.user_id
FROM Purchases p1 JOIN Purchases p2
ON(p1.user_id=p2.user_id
AND p2.purchase_date BETWEEN p1.purchase_date AND p1.purchase_date+7
AND p1.purchase_id<p2.purchase_id)
ORDER BY p1.user_id;

-- Drop unused table
DROP TABLE Purchases;