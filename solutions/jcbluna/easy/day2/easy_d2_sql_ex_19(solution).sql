-- Create the actordirector table
CREATE TABLE ActorDirector (actor_id int, director_id int, timestamp int);
    
-- Populate the actordirector table
TRUNCATE TABLE ActorDirector;
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES ('1', '1', '0');
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES ('1', '1', '1');
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES ('1', '1', '2');
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES ('1', '2', '3');
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES ('1', '2', '4');
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES ('2', '1', '5');
INSERT INTO ActorDirector (actor_id, director_id, timestamp) VALUES ('2', '1', '6');

-- Solve the exercise

SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(timestamp)>=3;

-- Drop unused tables

DROP TABLE ActorDirector;