-- Create the flights table
Create table Flights (departure_airport int, arrival_airport int, flights_count int);

-- Populate the flights tabale    
Truncate table Flights;

/*
-- Example 1
insert into Flights (departure_airport, arrival_airport, flights_count) values (1, 2, 4);
insert into Flights (departure_airport, arrival_airport, flights_count) values (2, 1, 5);
insert into Flights (departure_airport, arrival_airport, flights_count) values (2, 4, 5);
*/

-- Example 2
insert into Flights (departure_airport, arrival_airport, flights_count) values (1, 2, 4);
insert into Flights (departure_airport, arrival_airport, flights_count) values (2, 1, 5);
insert into Flights (departure_airport, arrival_airport, flights_count) values (3, 4, 5);
insert into Flights (departure_airport, arrival_airport, flights_count) values (4, 3, 4);
insert into Flights (departure_airport, arrival_airport, flights_count) values (5, 6, 7);

-- Write a solution to report the ID of the airport with the most traffic. The airport with the most 
-- traffic is the airport that has the largest total number of flights that either departed from or 
-- arrived at the airport. If there is more than one airport with the most traffic, report them all
SELECT
    airport_id
FROM
    (SELECT
         airport_id,
         SUM(flights_count) AS flights,
         DENSE_RANK() OVER (ORDER BY SUM(flights_count) DESC) AS rank
     FROM 
         (SELECT departure_airport AS airport_id, flights_count FROM Flights
          UNION ALL
          SELECT arrival_airport AS airport_id, flights_count FROM Flights)
     GROUP BY
         airport_id)
WHERE
    rank = 1;

-- Drop tables
DROP TABLE Flights;
