-- Create Database
CREATE DATABASE CyberFeminism;
-- Use Database
USE Cyberfeminism;

-- Create Author dataset
CREATE TABLE IF NOT EXISTS Author (
author_id VARCHAR (50) PRIMARY KEY,
author_first_name VARCHAR(50),# first name of the author/creator
author_last_name VARCHAR(50), # last name of the author/creator
author_country VARCHAR (3), # symbol of author country 
author_birth YEAR, # when was the author born 
item_id INTEGER,
FOREIGN KEY (item_id) REFERENCES Item(item_id)# item number in the index
);
-- Create Publish dataset
CREATE TABLE IF NOT EXISTS Publish (
pub_year YEAR, # date item was published
pub_format VARCHAR (5), # format of item
pub_id VARCHAR (50), # publisher id 
item_id INTEGER,
FOREIGN KEY (item_id) REFERENCES Item(item_id)# item number in the index
);


-- Create Format dataset 
CREATE TABLE IF NOT EXISTS Format (
media_type VARCHAR(50), # type of media
media_id VARCHAR(5), # what is the id of the media type 
author_id VARCHAR(50), # what is the author id
item_id INTEGER,
FOREIGN KEY (item_id) REFERENCES Item(item_id)# item number in the index
);

-- Create table Book_Numbers
CREATE TABLE IF NOT EXISTS Book_Numbers (
ISBN VARCHAR(13) PRIMARY KEY, # what is the ISBN
total_pages INT, # what is the total amount of pages 
pub_id VARCHAR (50), # what is the publisher's id,
item_id INTEGER,
FOREIGN KEY (item_id) REFERENCES Item(item_id)# item number in the index
);
-- Create Item Dataset 
CREATE TABLE IF NOT EXISTS Item (
item_id INTEGER PRIMARY KEY, # item number in the index
title VARCHAR(150), #title of item
media_id VARCHAR (150),# media identifier
pub_date YEAR, # what date item was published
author_id VARCHAR (50)# author's initials
);
/*==================== POPULATING TABLES ======================*/

INSERT INTO Item
(item_id, title, media_id,pub_date, author_id)
VALUES
(1,'A Cyborg Manifesto','ESS',1985,'DJH'),
(4,'Feminism Confronts Technology','BOOK',1991,'JW'),
(7,'A Cyberfeminist Manifesto for the 21st Century','TEXT',1991,'VNS'),
(8,'Automating Gender','ESS',1991,'JH'),
(9,'Computers As Theatre','BOOK',1991,'BL'),
(10,'Will The Real Body Please Stand Up','ESS',1991,'ARS'),
(12,'All New Gen','GAME',1992,'VNS'),
(14,'Inherent Rights, Vision Rights','VR',1992,'LPY'),
(16,'geekgirl','ZINE',1993,'RC'),
(21,'Contested Zone','POEM',1993,'FR'),
(24,'Cyber Rag','ZINE',1994,'JL'),
(27,'Mothers and Daughters of Invention','BOOK',1994,'AS'),
(34,'Romancing the Anti-body: Lust and Longing in (Cyber)space','ESS',1994,'LHL'),
(36,'Technologies of the Gendered Body','BOOK',1995,'AB'),
(37,'Cyborg: Engineering The Body Electric','TEXT',1995,'DG');

SELECT * FROM Item;

INSERT INTO Author
(author_id, author_first_name,author_last_name,author_country,author_birth,item_id)
VALUES
('DJH','Donna','Harraway','USA',1944,1),
('JW','Judy','Wacjman','AUS',1950,4),
('VNS-1','VNS','Matrix','AUS',1991,7),
('JH','Jack','Halberstam','AUS',1961,8),
('BL','Brenda','Laurel','USA',1950,9),
('ARS','Allucquere','Stone','USA',1936,10),
('VNS-2','VNS','Matrix','AUS',1991,12),
('LPY','Lawrence','Yuxweluptun','CAN',1957,14),
('RC','Rosie','Cross','UK',1958,16),
('FR','Francesca','da Rimini','UK',1956,21),
('JL','Jamie' ,'Levy','USA',1966,24),
('AS','Autumn','Stanley','USA',1933,27),
('LHL','Lynn','Leeson','USA',1941,34),
('AB','Anne','Balsamo','USA',1959,36),
('DG','Diane','Greco','USA',NULL,37);

SELECT*FROM Author;

INSERT INTO Book_Numbers
(ISBN,total_pages,pub_id,item_id)
VALUES
(9780745607788,196,'Polity Press',4),
(9780201550603,227,'Addison-Wesley',9),
(9780810825864,1166,'Scarecrow Press',27),
(9780941920421,300,'Bay Press',34),
(9780822316985,232,'Duke University Press',36),
(9781884511226,NULL,'Eastgate Systems',37);

SELECT*FROM Book_Numbers;

INSERT INTO Format
(media_type, media_id, author_id, item_id)
VALUES
('essay','ESS','DJH',1),
('book','BOOK','JW',4),
('digital text','TEXT','VNS-1',7),
('essay','ESS','JH',8),
('book','BOOK','BL',9),
('essay','ESS','ARS',10),
('video game','GAME','VNS-2',12),
('virtual reality','VR','LPY',14),
('magazine','ZINE','RC',16),
('poem','POEM','FR',21),
('magazine','ZINE','JL',24),
('book','BOOK','AS',27),
('essay','BOOK','LHL',34),
('book','BOOK','AB',36),
('hypertext','TEXT','DG',37);

 SELECT*FROM Format;

INSERT INTO Publish
(pub_year,pub_format,pub_id,item_id)
VALUES
(1985,'ACA','Socialist Review',1),
(1991,'TEXT','Polity Press',4),
(1991,'DIGI',NULL,7),
(1991,'ACA','Feminist Studies',8),
(1991,'TEXT','Addison-Wesley',9),
(1991,'ACA','MIT Press',10),
(1992,'DIGI',NULL,12),
(1992,'DIGI',NULL,14),
(1993,'DIGI',NULL,16),
(1993,'DIGI',NULL,21),
(1994,'DIGI',NULL,24),
(1994,'TEXT','Scarecrow Press',27),
(1994,'TEXT','Bay Press',34),
(1995,'TEXT','Duke University Press',36),
(1995,'HYPE','Eastgate Systems',37);

SELECT*FROM Publish;

/*==================== JOINING TABLES ======================*/
#What are the author details for authors of books that have been published?
USE Cyberfeminism;

SELECT * From Author;
SELECT * From Book_Numbers;

-- INNER JOIN
SELECT Author.*, Book.*
FROM Author AS Author
RIGHT JOIN
Book_Numbers AS Book
ON 
Author.item_id = Book.item_id;

/*====================STORED FUNCTION======================*/
#Create a stored function to make item insert easier
USE Cyberfeminism; 

SELECT * FROM Cyberfeminism.Item; 

DELIMITER //
CREATE PROCEDURE InsertItem (IN item_id INT, IN title VARCHAR (150), IN media_id VARCHAR (150), IN pub_date YEAR, IN author_id VARCHAR(50))
BEGIN 
	INSERT INTO Item(item_id,title,media_id,pub_date,author_id)
    VALUES (item_id,title,media_id,pub_date,author_id); 
END//
DELIMITER ;

CALL InsertItem(782,'Glitch Feminism: A Manifesto','BOOK',2020,'LR'); 

SELECT * FROM Cyberfeminism.Item;

/*==================== EXAMPLE QUERY WITH A SUBQUERY FOR DATA EXTRACTION ======================*/
-- Find out how many items were published each year (in no particular order)
SELECT pub_date, COUNT(Pub_date)
FROM Item
GROUP BY pub_date;
-- What are the names of authors with published books?
SELECT author_first_name, author_last_name
FROM Author
WHERE item_id IN (
    SELECT item_id
    FROM Book_Numbers
);
-- What are the media types that aren't published books?
SELECT media_type,media_id
FROM Format
WHERE NOT EXISTS (
  SELECT * 
  FROM Book_Numbers
  WHERE Format.item_id = Book_Numbers.item_id
);
/*==================== CREATING A DATABASE DIAGRAM ======================*/
/*==================== ADVANCED OPTIONS ======================
create a stored procedure and demonstrate how it runs
create a trigger and demonstrate how it runs
create an event and demonstrate how it runs
create a view with 3-4 base tables; prepare and demonstrate query that uses the view to produce logically arranged result set
*/

