-- Create the employee table
CREATE TABLE Employee (id int, name varchar(255), department varchar(255), managerId int);
    
-- Populate the employee table
TRUNCATE TABLE Employee;
INSERT INTO Employee (id, name, department, managerId) VALUES ('101', 'John', 'A', NULL);
INSERT INTO Employee (id, name, department, managerId) VALUES ('102', 'Dan', 'A', '101');
INSERT INTO Employee (id, name, department, managerId) VALUES ('103', 'James', 'A', '101');
INSERT INTO Employee (id, name, department, managerId) VALUES ('104', 'Amy', 'A', '101');
INSERT INTO Employee (id, name, department, managerId) VALUES ('105', 'Anne', 'A', '101');
INSERT INTO Employee (id, name, department, managerId) VALUES ('106', 'Ron', 'B', '101');

-- Solve the exercise
SELECT name
FROM Employee e
WHERE 5<=(SELECT COUNT(id) FROM Employee
            WHERE managerId=e.id);

-- Drop unused table
DROP TABLE Employee;