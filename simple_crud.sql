--exercise 1: CREATE
CREATE DATABASE shirts_dtb;
USE shirts_dtb;

CREATE TABLE shirts(
shirt_id INT NOT NULL AUTO_INCREMENT,
article VARCHAR(20) NOT NULL,
colour VARCHAR(20) NOT NULL,
shirt_size VARCHAR(3) NOT NULL,
last_worn INT DEFAULT 0 NOT NULL,
PRIMARY KEY(shirt_id));

DESC shirts;

INSERT INTO shirts(article,colour,shirt_size,last_worn)
VALUES	('t-shirt','white','S',10),
	('t-shirt','green','S',200),
	('polo shirt','black','M',10),
	('tank top','blue','S',50),
	('t-shirt','pink','S',0),
	('polo shirt','red','M',5),
	('tank top','white','S',200),
	('tank top','blue','M',15);

INSERT INTO shirts(article,colour,shirt_size,last_worn)
VALUES	('polo shirt','purple','M',50);

-- exercise 2: READ
SELECT article,colour FROM shirts;

SELECT article,colour,shirt_size,last_worn FROM shirts WHERE shirt_size ='M';

-- exercise 3: UPDATE
UPDATE shirts 
SET 
	shirt_size='L' 
WHERE 
	article='polo shirt';

UPDATE shirts 
SET 
	last_worn=0 
WHERE 
	last_worn=15;

UPDATE shirts 
SET 
	colour='off white',
	shirt_size='XS' 
WHERE 
	colour='white';

-- exercise 4: DELETE

DELETE FROM shirts WHERE last_worn=200;

DELETE FROM shirts WHERE article='tank top';

DELETE FROM shirts;

DROP TABLE shirts;

DROP DATABASE shirts_dtb;