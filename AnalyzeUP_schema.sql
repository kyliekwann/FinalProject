--*********************************************
-- Read Tables from database
SELECT * FROM complete_table
limit 10;
SELECT * FROM df_sample_table
limit 10;
SELECT * FROM ein_table
limit 10;

--*********************************************
-- Delete Tables from database
-- Careful!!!
DROP TABLE IF EXISTS df_sample_table;

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


