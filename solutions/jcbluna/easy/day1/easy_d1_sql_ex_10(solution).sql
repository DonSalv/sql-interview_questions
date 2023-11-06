-- Create table World
CREATE TABLE World (name varchar(255), continent varchar(255), area int, population int, gdp long);

-- Populate the table World
TRUNCATE TABLE World;
INSERT INTO World (name, continent, area, population, gdp) VALUES ('Afghanistan', 'Asia', '652230', '25500100', '20343000000');
INSERT INTO World (name, continent, area, population, gdp) VALUES ('Albania', 'Europe', '28748', '2831741', '12960000000');
INSERT INTO World (name, continent, area, population, gdp) VALUES ('Algeria', 'Africa', '2381741', '37100000', '188681000000');
INSERT INTO World (name, continent, area, population, gdp) VALUES ('Andorra', 'Europe', '468', '78115', '3712000000');
INSERT INTO World (name, continent, area, population, gdp) VALUES ('Angola', 'Africa', '1246700', '20609294', '100990000000');

-- Solve the exercise
SELECT name, population, area
FROM World
WHERE area>=3000000
OR population>=25000000;

-- Drop unused table
DROP TABLE World;