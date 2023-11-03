-- Create the actordirector table
Create table ActorDirector (actor_id int, director_id int, timestamp int);
    
-- Populate the actordirector table
Truncate table ActorDirector;
insert into ActorDirector (actor_id, director_id, timestamp) values (1, 1, 0);
insert into ActorDirector (actor_id, director_id, timestamp) values (1, 1, 1);
insert into ActorDirector (actor_id, director_id, timestamp) values (1, 1, 2);
insert into ActorDirector (actor_id, director_id, timestamp) values (1, 2, 3);
insert into ActorDirector (actor_id, director_id, timestamp) values (1, 2, 4);
insert into ActorDirector (actor_id, director_id, timestamp) values (2, 1, 5);
insert into ActorDirector (actor_id, director_id, timestamp) values (2, 1, 6);

-- Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times
SELECT 
    t.actor_id, 
    t.director_id
FROM (SELECT 
          actor_id, 
          director_id, 
          count(*) colab_count
      FROM ActorDirector
      GROUP BY actor_id, director_id) t
WHERE t.colab_count >= 3;

-- Drop tables
DROP TABLE ActorDirector;
