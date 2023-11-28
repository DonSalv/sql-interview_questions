-- Create the tables
CREATE TABLE Tasks (task_id int, subtasks_count int);
CREATE TABLE Executed (task_id int, subtask_id int);

-- Populate the tasks table    
TRUNCATE TABLE Tasks;
INSERT INTO Tasks (task_id, subtasks_count) VALUES ('1', '3');
INSERT INTO Tasks (task_id, subtasks_count) VALUES ('2', '2');
INSERT INTO Tasks (task_id, subtasks_count) VALUES ('3', '4');
    
-- Populate the executed table
TRUNCATE TABLE Executed;
INSERT INTO Executed (task_id, subtask_id) VALUES ('1', '2');
INSERT INTO Executed (task_id, subtask_id) VALUES ('3', '1');
INSERT INTO Executed (task_id, subtask_id) VALUES ('3', '2');
INSERT INTO Executed (task_id, subtask_id) VALUES ('3', '3');
INSERT INTO Executed (task_id, subtask_id) VALUES ('3', '4');

-- Solve the exercise
SELECT task_id, LEVEL as subtask_id
FROM Tasks
CONNECT BY LEVEL <= subtasks_count
AND PRIOR task_id = task_id
AND PRIOR SYS_GUID() IS NOT NULL
MINUS
SELECT * FROM Executed;

-- Drop unused tables
DROP TABLE Tasks;
DROP TABLE Executed;