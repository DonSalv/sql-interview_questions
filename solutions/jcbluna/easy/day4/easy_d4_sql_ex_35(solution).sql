-- Create the queries table
CREATE TABLE Queries (query_name varchar(30), result varchar(50), position int, rating int);
    
-- Populate the queries table
TRUNCATE TABLE Queries;
INSERT INTO Queries (query_name, result, position, rating) VALUES ('Dog', 'Golden Retriever', '1', '5');
INSERT INTO Queries (query_name, result, position, rating) VALUES ('Dog', 'German Shepherd', '2', '5');
INSERT INTO Queries (query_name, result, position, rating) VALUES ('Dog', 'Mule', '200', '1');
INSERT INTO Queries (query_name, result, position, rating) VALUES ('Cat', 'Shirazi', '5', '2');
INSERT INTO Queries (query_name, result, position, rating) VALUES ('Cat', 'Siamese', '3', '3');
INSERT INTO Queries (query_name, result, position, rating) VALUES ('Cat', 'Sphynx', '7', '4');

-- Solve the exercise

SELECT query_name, TO_CHAR(ROUND(AVG(rating/position),2),'0.00') AS quality,
ROUND(COUNT(CASE WHEN rating<3 THEN 1 ELSE NULL END)/COUNT(rating)*100,2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

-- Drop unused table

DROP TABLE Queries;