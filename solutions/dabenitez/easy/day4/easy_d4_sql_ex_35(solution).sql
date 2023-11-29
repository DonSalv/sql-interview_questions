Create table Queries (query_name varchar(30), result varchar(50), position int, rating int);

insert into Queries (query_name, result, position, rating) values ('Dog', 'Golden Retriever', '1', '5');
insert into Queries (query_name, result, position, rating) values ('Dog', 'German Shepherd', '2', '5');
insert into Queries (query_name, result, position, rating) values ('Dog', 'Mule', '200', '1');
insert into Queries (query_name, result, position, rating) values ('Cat', 'Shirazi', '5', '2');
insert into Queries (query_name, result, position, rating) values ('Cat', 'Siamese', '3', '3');
insert into Queries (query_name, result, position, rating) values ('Cat', 'Sphynx', '7', '4');

SELECT query_name, ROUND(AVG(rating / position), 2) AS quality, 
ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS poor_query_percentage
FROM Queries GROUP BY query_name;
  
DROP TABLE Queries PURGE;