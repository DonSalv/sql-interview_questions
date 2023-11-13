-- Create the follow table
CREATE TABLE Follow (followee varchar(255), follower varchar(255));
    
-- Populate the follow table
TRUNCATE TABLE Follow;
INSERT INTO Follow (followee, follower) VALUES ('Alice', 'Bob');
INSERT INTO Follow (followee, follower) VALUES ('Bob', 'Cena');
INSERT INTO Follow (followee, follower) VALUES ('Bob', 'Donald');
INSERT INTO Follow (followee, follower) VALUES ('Donald', 'Edward');

-- Solve the exercise
SELECT followee AS follower, COUNT(follower) AS num
FROM Follow f
WHERE EXISTS (SELECT follower FROM Follow WHERE follower=f.followee)
GROUP BY followee
HAVING COUNT(follower)>0
ORDER BY follower;

-- Drop unused table
DROP TABLE Follow;