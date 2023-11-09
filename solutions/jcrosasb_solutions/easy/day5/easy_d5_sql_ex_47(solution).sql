-- Create the sessions table
Create table Sessions (session_id int, duration int);

-- Populate the sessions table    
Truncate table Sessions;
insert into Sessions (session_id, duration) values (1, 30);
insert into Sessions (session_id, duration) values (2, 199);
insert into Sessions (session_id, duration) values (3, 299);
insert into Sessions (session_id, duration) values (4, 580);
insert into Sessions (session_id, duration) values (5, 1000);

-- You want to know how long a user visits your application. You decided to create bins of "[0-5>", "[5-10>", "[10-15>", and "15 minutes or more" and count the number of sessions on it.
-- Write a solution to report the (bin, total)
WITH bins AS (
    SELECT '[0-5]' AS bin FROM DUAL
    UNION ALL
    SELECT '[5-10]' AS bin FROM DUAL
    UNION ALL
    SELECT '[10-15]' AS bin FROM DUAL
    UNION ALL
    SELECT '15 or more' AS bin FROM DUAL
)
SELECT b.bin, NVL(t.total, 0) total FROM (SELECT bin, COUNT(*) total FROM (SELECT  
    CASE 
        WHEN duration/60 < 5 THEN '[0-5]'
        WHEN duration/60 >= 5 and duration/60 < 10 THEN '[5-10]'
        WHEN duration/60 >= 10 and duration/60 < 15 THEN '[10-15]'
        ELSE '15 or more'
    END bin
FROM Sessions) GROUP BY bin) t
FULL OUTER JOIN bins b
ON b.bin = t.bin
ORDER BY 
    CASE
        WHEN bin = '[0-5]' THEN 1
        WHEN bin = '[5-10]' THEN 2
        WHEN bin = '[10-15]' THEN 3
        WHEN bin = '15 or more' THEN 4
    END;

-- Drop tables
DROP TABLE Sessions;
