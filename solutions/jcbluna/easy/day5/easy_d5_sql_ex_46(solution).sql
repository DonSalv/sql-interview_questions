-- Create the tables
CREATE TABLE NPV (id int, year int, npv int);
CREATE TABLE Queries (id int, year int);
    
-- Populate the npv table
TRUNCATE TABLE NPV;
INSERT INTO NPV (id, year, npv) VALUES ('1', '2018', '100');
INSERT INTO NPV (id, year, npv) VALUES ('7', '2020', '30');
INSERT INTO NPV (id, year, npv) VALUES ('13', '2019', '40');
INSERT INTO NPV (id, year, npv) VALUES ('1', '2019', '113');
INSERT INTO NPV (id, year, npv) VALUES ('2', '2008', '121');
INSERT INTO NPV (id, year, npv) VALUES ('3', '2009', '12');
INSERT INTO NPV (id, year, npv) VALUES ('11', '2020', '99');
INSERT INTO NPV (id, year, npv) VALUES ('7', '2019', '0');
    
-- Populate the queries table
TRUNCATE TABLE Queries;
INSERT INTO Queries (id, year) VALUES ('1', '2019');
INSERT INTO Queries (id, year) VALUES ('2', '2008');
INSERT INTO Queries (id, year) VALUES ('3', '2009');
INSERT INTO Queries (id, year) VALUES ('7', '2018');
INSERT INTO Queries (id, year) VALUES ('7', '2019');
INSERT INTO Queries (id, year) VALUES ('7', '2020');
INSERT INTO Queries (id, year) VALUES ('13', '2019');

-- Solve the exercise
SELECT q.id, q.year, NVL(npv,0)
FROM Queries q LEFT OUTER JOIN NPV n
ON(q.id=n.id AND q.year=n.year)
ORDER BY q.id, q.year;

-- Drop unused tables
DROP TABLE NPV;
DROP TABLE Queries;