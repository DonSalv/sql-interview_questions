-- Create the dailysales table
CREATE TABLE DailySales(date_id date, make_name varchar(20), lead_id int, partner_id int);

-- Populate the dailysales table    
TRUNCATE TABLE DailySales;
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES (TO_DATE('2020-12-08','%YYYY-%MM-%DD'), 'toyota', '0', '1');
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES (TO_DATE('2020-12-08','%YYYY-%MM-%DD'), 'toyota', '1', '0');
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES (TO_DATE('2020-12-08','%YYYY-%MM-%DD'), 'toyota', '1', '2');
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES (TO_DATE('2020-12-07','%YYYY-%MM-%DD'), 'toyota', '0', '2');
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES (TO_DATE('2020-12-07','%YYYY-%MM-%DD'), 'toyota', '0', '1');
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES (TO_DATE('2020-12-08','%YYYY-%MM-%DD'), 'honda', '1', '2');
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES (TO_DATE('2020-12-08','%YYYY-%MM-%DD'), 'honda', '2', '1');
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES (TO_DATE('2020-12-07','%YYYY-%MM-%DD'), 'honda', '0', '1');
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES (TO_DATE('2020-12-07','%YYYY-%MM-%DD'), 'honda', '1', '2');
INSERT INTO DailySales (date_id, make_name, lead_id, partner_id) VALUES (TO_DATE('2020-12-07','%YYYY-%MM-%DD'), 'honda', '2', '1');

-- Solve the exercise
SELECT TO_CHAR(date_id,'YYYY-MM-DD') AS date_id, make_name, COUNT(DISTINCT lead_id) AS unique_leads,
COUNT(DISTINCT partner_id) AS unique_partners
FROM DailySales
GROUP BY TO_CHAR(date_id,'YYYY-MM-DD'), make_name
ORDER BY make_name DESC, date_id DESC;

-- Drop unused table
DROP TABLE DailySales;