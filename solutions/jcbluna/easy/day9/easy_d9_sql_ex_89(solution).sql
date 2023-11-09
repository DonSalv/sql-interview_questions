-- Create the olynpic table
CREATE TABLE Olympic (country varchar(50), gold_medals int, silver_medals int, bronze_medals int);

-- Populate the olympic table    
TRUNCATE TABLE Olympic;
INSERT INTO Olympic (country, gold_medals, silver_medals, bronze_medals) VALUES ('China', '10', '10', '20');
INSERT INTO Olympic (country, gold_medals, silver_medals, bronze_medals) VALUES ('South Sudan', '0', '0', '1');
INSERT INTO Olympic (country, gold_medals, silver_medals, bronze_medals) VALUES ('USA', '10', '10', '20');
INSERT INTO Olympic (country, gold_medals, silver_medals, bronze_medals) VALUES ('Israel', '2', '2', '3');
INSERT INTO Olympic (country, gold_medals, silver_medals, bronze_medals) VALUES ('Egypt', '2', '2', '2');

-- Solve the exercise
SELECT *
FROM Olympic
ORDER BY gold_medals DESC, silver_medals DESC,
bronze_medals DESC, country ASC;

-- Drop unused table
DROP TABLE Olympic;