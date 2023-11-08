-- Create the sessions table
CREATE TABLE Sessions(session_id int, duration int);

-- Populate the sessions table    
TRUNCATE TABLE Sessions;
INSERT INTO Sessions (session_id, duration) VALUES ('1', '30');
INSERT INTO Sessions (session_id, duration) VALUES ('2', '199');
INSERT INTO Sessions (session_id, duration) VALUES ('3', '299');
INSERT INTO Sessions (session_id, duration) VALUES ('4', '580');
INSERT INTO Sessions (session_id, duration) VALUES ('5', '1000');

-- Solve the exercise
SELECT bin, COUNT(session_id) AS total
FROM (SELECT '[0-5>' AS bin FROM dual
UNION SELECT '[5-10>' FROM dual
UNION SELECT '[10-15>' FROM dual
UNION SELECT '15 or more' FROM dual) LEFT OUTER JOIN (SELECT session_id, (CASE
        WHEN (duration>=0*60 AND duration<5*60) THEN '[0-5>'
        WHEN (duration>=5*60 AND duration<10*60) THEN '[5-10>'
        WHEN (duration>=10*60 AND duration<15*60) THEN '[10-15>'
        ELSE '15 or more' END) AS bin FROM Sessions)
USING(bin)
GROUP BY bin;

-- Drop unused table
DROP TABLE Sessions;