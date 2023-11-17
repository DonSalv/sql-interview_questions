-- Create the spotify table
CREATE TABLE Spotify (id int,track_name varchar(100),artist varchar(100));

-- Turn off the substitution of the & character
SET DEFINE OFF;

-- Populate the spotify table
TRUNCATE TABLE Spotify;
INSERT INTO Spotify (id, track_name, artist) VALUES ('303651', 'Heart Wont Forget', 'Ed Sheeran');
INSERT INTO Spotify (id, track_name, artist) VALUES ('1046089', 'Shape of you', 'Sia');
INSERT INTO Spotify (id, track_name, artist) VALUES ('33445', 'Im the one', 'DJ Khalid');
INSERT INTO Spotify (id, track_name, artist) VALUES ('811266', 'Young Dumb & Broke', 'DJ Khalid');
INSERT INTO Spotify (id, track_name, artist) VALUES ('505727', 'Happier', 'Ed Sheeran');

-- Solve the exercise
-- Fix the typo in the name of the second column
SELECT artist, COUNT(id) AS occurrences
FROM Spotify
GROUP BY artist
ORDER BY occurrences DESC, artist ASC;

-- Drop unused table and turn off the substitution of the & character
SET DEFINE ON;
DROP TABLE Spotify;