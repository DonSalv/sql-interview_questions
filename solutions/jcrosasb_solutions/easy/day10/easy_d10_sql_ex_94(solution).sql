-- Create the bikes table
Create table Bikes (ride_id int,bike_number varchar(100), start_time timestamp,end_time timestamp);
    
-- Populate the bikes table
Truncate table Bikes;
insert into Bikes (ride_id, bike_number, start_time, end_time) values (1, 'W00576', TO_TIMESTAMP('2012-03-25 11:30:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2012-03-25 12:40:00','YYYY-MM-DD HH24:MI:SS'));
insert into Bikes (ride_id, bike_number, start_time, end_time) values (2, 'W00300', TO_TIMESTAMP('2012-03-25 10:30:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2012-03-25 10:50:00','YYYY-MM-DD HH24:MI:SS'));
insert into Bikes (ride_id, bike_number, start_time, end_time) values (3, 'W00455', TO_TIMESTAMP('2012-03-26 14:30:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2012-03-26 17:40:00','YYYY-MM-DD HH24:MI:SS'));
insert into Bikes (ride_id, bike_number, start_time, end_time) values (4, 'W00455', TO_TIMESTAMP('2012-03-25 12:30:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2012-03-25 13:40:00','YYYY-MM-DD HH24:MI:SS'));
insert into Bikes (ride_id, bike_number, start_time, end_time) values (5, 'W00576', TO_TIMESTAMP('2012-03-25 08:10:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2012-03-25 09:10:00','YYYY-MM-DD HH24:MI:SS'));
insert into Bikes (ride_id, bike_number, start_time, end_time) values (6, 'W00576', TO_TIMESTAMP('2012-03-28 02:30:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2012-03-28 02:50:00','YYYY-MM-DD HH24:MI:SS'));

-- Write a solution to find the last time when each bike was used.
-- Return the result table ordered by the bikes that were most recently used
SELECT 
    bike_number, 
    TO_CHAR(TO_TIMESTAMP(MAX(end_time), 'DD-MON-RR HH.MI.SS.FF AM'), 'YYYY-MM-DD HH24:MI:SS') end_time 
FROM 
    Bikes 
GROUP BY 
    bike_number 
ORDER BY 
    end_time DESC ;

-- Drop tables
DROP TABLE Bikes;
