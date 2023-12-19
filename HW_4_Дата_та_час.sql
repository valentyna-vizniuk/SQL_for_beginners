-- Task 0: Setting Your Local Time in Tokyo
--Write an SQL query to set your local time to the timezone of Tokyo.
SELECT 
	NOW() ::timestamp AT TIME ZONE 'Asia/Tokyo';

--Task 1: Showing Dates in Different Time Zones
--Write an SQL query to display dates over time in 3-5 different time zones.
SELECT 
	NOW() ::timestamp AT TIME ZONE 'Asia/Tokyo'
	, NOW() ::timestamp AT TIME ZONE 'America/Chicago'
	, NOW() ::timestamp AT TIME ZONE 'Europe/Kiev';
	

--Task 2: Checking a String for a Palindrome
--Write an SQL query to check if a given string is a palindrome.
SELECT
id
, first_name
, REVERSE (LOWER(first_name)) AS rev_first_name
FROM employees.employee

--Task 3: Finding Male Employees Born in January
--Find all male employees who were born in January and print their birthdate 
--in the format: year (2-digit format), month (name format), day.
SELECT
id
, birth_date
, first_name
, last_name
FROM employees.employee
WHERE gender = 'M' 
	AND EXTRACT(MONTH FROM (birth_date)) = 1

--Task 4: Importing JSON and CSV Files to the “Employees” Database
--Import your own JSON and CSV files into the “employees” database.
--Write queries to check the imported files. */

-- CSV import
CREATE TABLE IF NOT EXISTS products_name (
	Name VARCHAR(500),
	Current_Price VARCHAR(50),
	Previous_Price VARCHAR(50),
	Price_Per_Each VARCHAR(100),
	Category VARCHAR(50),
	Product_ID VARCHAR(70),
	Product_URL VARCHAR(200),
	Amount VARCHAR(15),
	Units VARCHAR(10)
);
copy products_name FROM 'D:\IT\Big_data\products_data.csv' DELIMITER ',' CSV HEADER;

SELECT *
FROM  products_name;

-- JSON import

CREATE TABLE IF NOT EXISTS iris (
	id SERIAL PRIMARY KEY,
	data JSONB
);

INSERT INTO iris (data)
SELECT * FROM jsonb_array_elements(
  jsonb_strip_nulls(
    cast(pg_read_file('D:\IT\Big_data\iris.json') as jsonb)
  )
);


SELECT *
FROM iris;
