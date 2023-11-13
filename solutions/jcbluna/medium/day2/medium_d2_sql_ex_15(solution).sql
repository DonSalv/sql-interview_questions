-- Create the seat table
CREATE TABLE Seat (id int, student varchar(255));

-- Populate the seat table    
TRUNCATE TABLE Seat;
INSERT INTO Seat (id, student) VALUES ('1', 'Abbot');
INSERT INTO Seat (id, student) VALUES ('2', 'Doris');
INSERT INTO Seat (id, student) VALUES ('3', 'Emerson');
INSERT INTO Seat (id, student) VALUES ('4', 'Green');
INSERT INTO Seat (id, student) VALUES ('5', 'Jeames');

-- Solve the exercise
SELECT (CASE WHEN MOD(id,2)=0 THEN id-1
        WHEN MOD(id,2)=1 AND id=COUNT(id) OVER() THEN id
        ELSE id+1 END) AS id, student
FROM Seat
ORDER BY id;

-- Drop unused table
DROP TABLE Seat;