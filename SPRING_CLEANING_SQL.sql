-- First Step
-- Create a new database
CREATE DATABASE shirts_db;

-- Second Step
-- Create a new table
CREATE TABLE IF NOT EXISTS shirts(
shirt_id INT PRIMARY KEY NOT NULL UNIQUE,
article VARCHAR(30) NOT NULL,
color VARCHAR(30) NOT NULL,
shirt_size VARCHAR(10) NOT NULL,
last_worn INT NOT NULL);

-- Third Step
-- Populate the table with the following data
INSERT INTO shirts (shirt_id, article, color, shirt_size, last_worn)
VALUES ('1', 't-shirt', 'white', 'S', '10');

INSERT INTO shirts (shirt_id, article, color, shirt_size, last_worn)
VALUES ('2', 't-shirt', 'green', 'S', '200');

INSERT INTO shirts (shirt_id, article, color, shirt_size, last_worn)
VALUES ('3', 'polo shirt', 'black', 'M', '10');

INSERT INTO shirts (shirt_id, article, color, shirt_size, last_worn)
VALUES ('4', 'tank top', 'blue', 'S', '50');

INSERT INTO shirts (shirt_id, article, color, shirt_size, last_worn)
VALUES ('5', 't-shirt', 'pink', 'S', '0');

INSERT INTO shirts (shirt_id, article, color, shirt_size, last_worn)
VALUES ('6', 'polo shirt', 'red', 'M', '5');

INSERT INTO shirts (shirt_id, article, color, shirt_size, last_worn)
VALUES ('7', 'tank top', 'white', 'S', '200');

INSERT INTO shirts (shirt_id, article, color, shirt_size, last_worn)
VALUES ('8', 'tank top', 'blue', 'M', '15');

-- Fourth Step
-- Add a new shirt, purple polo shirt, size M last worn 50 days ago.
INSERT INTO shirts (shirt_id, article, color, shirt_size, last_worn)
VALUES ('9', 'polo shirt', 'purple', 'M', '50');

-- Fifth Step
-- SELECT all shirts but only print out article and color
SELECT shirts.article, shirts.color FROM shirts;

-- Sixth Step
-- SELECT all medium shirts and print out everything but shirt_id;
CREATE TEMPORARY TABLE TempShirts AS SELECT * FROM shirts;
ALTER TABLE TempShirts DROP COLUMN shirt_id;
SELECT * FROM TempShirts;

-- Seventh Step
-- Update all polo shirts (change their size to L)
UPDATE shirts
SET shirt_size = 'L'
WHERE article = 'polo shirt';

-- Eighth Step
-- Update the shirt last worn 15 days ago; Change last_worn to ('0')
UPDATE shirts
SET last_worn = '0'
WHERE last_worn = '15';

-- Ninth Step
-- Update all white shirts and change size to 'XS' and color to 'off white'
UPDATE shirts
SET shirt_size = 'XS', color = 'off white'
WHERE color = 'white';

-- Tenth Step
-- Delete all old shirts that were last worn 200 days ago
DELETE FROM shirts WHERE last_worn = '200';

-- Eleventh Step
-- Delete all tank tops
DELETE FROM shirts WHERE article = 'tank top';

-- Twelveth Step
-- Delete all shirts
DELETE FROM shirts;

-- Thirteenth Step
-- Drop the entire shirts table
DROP TABLE shirts;