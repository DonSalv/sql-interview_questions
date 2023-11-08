-- Create the activities table
CREATE TABLE Activities (sell_date date, product varchar(20));
    
-- Populate the activities table
TRUNCATE TABLE Activities;
INSERT INTO Activities (sell_date, product) VALUES (TO_DATE('2020-05-30','%YYYY-%MM-%DD'), 'Headphone');
INSERT INTO Activities (sell_date, product) VALUES (TO_DATE('2020-06-01','%YYYY-%MM-%DD'), 'Pencil');
INSERT INTO Activities (sell_date, product) VALUES (TO_DATE('2020-06-02','%YYYY-%MM-%DD'), 'Mask');
INSERT INTO Activities (sell_date, product) VALUES (TO_DATE('2020-05-30','%YYYY-%MM-%DD'), 'Basketball');
INSERT INTO Activities (sell_date, product) VALUES (TO_DATE('2020-06-01','%YYYY-%MM-%DD'), 'Bible');
INSERT INTO Activities (sell_date, product) VALUES (TO_DATE('2020-06-02','%YYYY-%MM-%DD'), 'Mask');
INSERT INTO Activities (sell_date, product) VALUES (TO_DATE('2020-05-30','%YYYY-%MM-%DD'), 'T-Shirt');

-- Solve the exercise
SELECT TO_CHAR(sell_date,'YYYY-MM-DD') AS sell_date, COUNT(DISTINCT product) AS num_sold,
LISTAGG(DISTINCT product,',') WITHIN GROUP (ORDER BY sell_date) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

-- Drop unused table
DROP TABLE Activities;