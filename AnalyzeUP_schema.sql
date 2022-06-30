--*********************************************
-- Read Tables from database
SELECT * FROM complete_table
limit 10;
SELECT * FROM cleaned_table
limit 10;
SELECT * FROM name_comp
limit 10;
SELECT * FROM expenses_comp
limit 10;
SELECT * FROM assets_comp
limit 10;
SELECT * FROM working_table
limit 10;
SELECT Count(*) From expenses_comp;


--********************************************

SELECT
	n.id,
	n.charity_name,
	n.cause,
	e.total_expenses,
	ass.total_net_assets
INTO working_table
FROM name_comp AS n
INNER JOIN expenses_comp AS e
ON (n.id = e.id)
INNER JOIN assets_comp AS ass
ON (n.id=ass.id);
	
--*********************************************
-- Delete Tables from database
-- Careful!!!
DROP TABLE IF EXISTS working_table;

--*********************************************
-- Create Tables in database

CREATE TABLE ein_table (
  	orgID INTEGER PRIMARY KEY,
  	ein INTEGER
);

CREATE TABLE name_table (
  	orgID INTEGER PRIMARY KEY,
  	organization_charityName TEXT
);

CREATE TABLE publish_date (
  	orgID INTEGER PRIMARY KEY,
  	currentRating__publicationDate DATE -- this should be in the formate yyyy-mm-dd
);

CREATE TABLE rating_table (
  	orgID INTEGER PRIMARY KEY,
  	currentRating__score float
);

CREATE TABLE state_table (
  	orgID INTEGER PRIMARY KEY,
 	mailingAddress__stateOrProvince TEXT
);

CREATE TABLE income_table (
  	orgID INTEGER PRIMARY KEY,
 	irsClassification__incomeAmount float
);


