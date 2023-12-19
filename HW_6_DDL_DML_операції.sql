--Task 0: Create Table “Books” 
--Create a table named “Books” with the following columns: 
--id, title, year_of_release, pages, genre.
--Choose appropriate data types for each column.

CREATE TABLE IF NOT EXISTS boooks (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100),
	year_of_release DATE,
	pages INT,
	genre VARCHAR(100)
	);

SELECT
*
FROM boooks;

--Task 1: Add New Column to “Books”
-- Add a new column named seller_id to the existing “Books” table.
ALTER TABLE boooks
ADD COLUMN seller_id INT NOT NULL;

SELECT
*
FROM boooks;

--Task 2: Insert Data
--Insert data into the “Books” table, starting from id 1 up to 15 rows. 
--Provide sample data for the columns.
ALTER TABLE boooks 
ALTER COLUMN year_of_release TYPE VARCHAR(4);

INSERT INTO boooks(title, year_of_release, pages, genre, seller_id)
VALUES 	
	('Українська література','2018',600,'хрестоматія','004'),
	('Психологія','2005',312,'навч. посібник','007'),
	('Я бачу, вас цікавить пітьма','2020',664,'художня література','009'),
	('Тіні забутих предків','2017',204,'художня література','009'),
	('1212','1967',262,'художня література','012'),
	('Fata morgana','2056',115,'художня література','0004'),
	('Vive le subjonctif!','2010',64,'навч. посібник','012'),
	('Вікова психологія','2000',624,'навч. посібник','025'),
	('Світ тварин','2092',382,'енциклопедія','007'),
	('Валеологія','1997',208,'навч. посібник','009'),
	('Театральна педагогіка','1996',224,'навч. посібник','018'),
	('Риторика','2001',240,'навч. посібник','008'),
	('Теорія естеетики','2002',518,'посібник','004'),
	('Агні-йога','1991',78,'посібник','025'),
	('Жіночий простір: Феміністичний дискурс українського модернізму','2003',320,'монографія','015');
	
--Task 3: Delete Last Two Rows
--Delete the last two rows from the table based on the id column.
BEGIN;

DELETE FROM boooks 
WHERE  id = 14 OR id = 15

--Task 4: Clear Data and Delete Table
--Clear all data from the table using TRUNCATE, and then delete the table “Books”.

TRUNCATE TABLE boooks;

DROP table boooks

ROLLBACK;

SELECT
*
FROM boooks;


--Task 0: Create Tables from Homework 4 
--Select appropriate data types for each column.
CREATE TABLE IF NOT EXISTS StaffUniversity (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	birth_date DATE,
	experience_years CHAR(2),
	hire_date DATE
	);
--Task 1: Insert Data into Tables
-- Insert data into the tables created in Task 0, providing data for up to 15 rows.
CREATE TABLE IF NOT EXISTS department (
	id_department SERIAL PRIMARY KEY,
	dept_name VARCHAR(50),
	faculty_name VARCHAR(50)
	);
	
CREATE TABLE IF NOT EXISTS position (
	id_employee INT NOT NULL, 
	CONSTRAINT fk_id_employee 
	FOREIGN KEY (id_employee) 
	REFERENCES StaffUniversity (id),
	position VARCHAR(50),
	qualification VARCHAR(100),
	id_department INT NOT NULL,
	CONSTRAINT fk_id_department
	FOREIGN KEY (id_department)
	REFERENCES department (id_department),
	from_date DATE,
	to_date DATE
	);	

CREATE TABLE IF NOT EXISTS total_salary (
	id_employee INT NOT NULL, 
	CONSTRAINT fk_id_employee 
	FOREIGN KEY (id_employee) 
	REFERENCES StaffUniversity (id),
	rank_pay CHAR(3),
	salary BIGINT,
	compensation BIGINT,
	amount BIGINT
	);

INSERT INTO StaffUniversity(name, birth_date, experience_years, hire_date)
VALUES 	
	('Ivanova Olena', '1980-07-07', 20, '2000-01-09'),
	('Pavlov Sergiy', '1967-12-27', 35, '1984-01-09'),
	('Klenkova Sofia', '1974-03-12', 15, '2006-01-09'),
	('Shuvalov Denis', '1985-05-23', 7, '2012-01-09');
	
INSERT INTO department(dept_name, faculty_name)
VALUES 	
	('Department of Physical Modelling', 'Faculty of Physics'),
	('Department of Algebra and Geometry', 'Faculty of Mathematics'),
	('Department of Ukrainian Philology', 'Faculty of Philology'),
	('Department of Algebra and Geometry', 'Faculty of Mathematics');
	
INSERT INTO position(id_employee, position,qualification,id_department,from_date,to_date)
VALUES 	
	(1,'Senior lecturer','Phd',1,'2014-01-09','2024-06-30'),
	(2,'Professor','Doctor of Mathematic',2,'1997-01-09','2023-06-30'),
	(3,'Associate Professor','Phd',3,'2018-01-09','2022-06-30'),
	(4,'Lecturer','Phd',4,'2016-01-09','2025-06-30');
	
INSERT INTO total_salary(id_employee, rank_pay, salary, compensation,amount)
VALUES 	
	(1, 18,21000,10500,31500),
	(2,19,22000,11000,33000),
	(3,17,20000,10000,30000),
	(4,16,19000,8000,17000);
	
INSERT INTO StaffUniversity(name, birth_date, experience_years, hire_date)
VALUES 	
	('Neverkovec Sergiy', '2001-03-07', 2, '2021-09-01'),
	('Spasskova Olena', '1985-07-21', 10, '2009-02-01'),
	('Koval Valeriy', '1992-01-13', 5, '2014-09-01'),
	('Shevchenko Iruna', '1985-12-13', 7, '2012-02-01'),
	('Todorov  Vasiliy', '1989-10-06', 12, '2011-02-01'),
	('Babak Yakov', '1974-01-01', 30, '1999-09-01'),
	('Kondrativ Fedir', '1976-03-12', 28, '2000-02-01'),
	('Gagich Iruna', '1985-05-23', 12, '2008-09-01'),
	('Hopryak Olena', '1968-12-27', 35, '1988-02-01'),
	('Fedorova Galyna', '1960-03-25', 38, '2080-09-01'),
	('Ruchkina Natalya', '1978-06-12', 15, '2004-02-01');
	
UPDATE 
	StaffUniversity 
SET
	hire_date = '2008-09-01'
WHERE 
	hire_date = '2080-09-01'; 

	

INSERT INTO department(dept_name, faculty_name)
VALUES 	
	('Department of General Psychology', 'Faculty of Psychology'),
	('Department of General Psychology', 'Faculty of Psychology'),
	('Department of Age-related Psychology', 'Faculty of Psychology'),
	('Department of Age-related Psychology', 'Faculty of Psychology'),
	('Department of Management Psychology', 'Faculty of Psychology'),
	('Department of Management Psychology', 'Faculty of Psychology'),
	('Department of Management Psychology', 'Faculty of Psychology'),
	('Department of Algebra and Geometry', 'Faculty of Mathematics'),
	('Department of Physical Modelling', 'Faculty of Physics'),
	('Department of Algebra and Geometry', 'Faculty of Mathematics'),
	('Department of General Psychology', 'Faculty of Psychology');

INSERT INTO position(id_employee, position,qualification,id_department,from_date,to_date)
VALUES 	
	(5,'Lecturer','Phd',5,'2023-09-01','2024-06-30'),
	(6,'Professor','Doctor of Mathematic',6,'2021-01-09','2025-06-30'),
	(7,'Associate Professor','Phd',7,'2018-01-09','2022-06-30'),
	(8,'Lecturer','Phd',8,'2016-01-09','2025-06-30'),
	(9,'Senior lecturer','Phd',9,'2014-01-09','2024-06-30'),
	(10,'Professor','Doctor of Psychology',10,'2003-01-09','2025-06-30'),
	(11,'Professor','Doctor of Psychology',11,'2019-01-09','2024-06-30'),
	(12,'Lecturer','Phd',12,'2010-01-09','2025-06-30'),
	(13,'Professor','Doctor of Physics',13,'2001-09-01','2024-06-30'),
	(14,'Professor','Doctor of Mathematics',14,'2012-10-01','2025-06-30'),
	(15,'Professor','Doctor of Psychology',15,'2008-09-01','2025-06-30');
	
INSERT INTO total_salary(id_employee, rank_pay, salary, compensation,amount)
VALUES 	
	(5, 16,19000,8000,17000),
	(6,19,22000,11000,33000),
	(7,17,20000,10000,30000),
	(8,17,20000,9000,29000),
	(9,18,21000,10500,31500),
	(10,19,22000,11000,33000),
	(11,19,22000,11000,33000),
	(12,17,20000,10000,30000),
	(13,19,22000,11000,33000),
	(14,19,22000,11000,33000),
	(15,19,22000,11000,33000)
	;

--Task 2: Verify Inserted Data Using Select
--Perform SELECT queries on the tables to verify the data has been inserted.
	
SELECT *
FROM StaffUniversity;

SELECT *
FROM department;

SELECT *
FROM position;

SELECT *
FROM total_salary;

SELECT
su.id
, su.name
, p.position
, d.dept_name
, ts.amount
FROM 
	StaffUniversity AS su
INNER JOIN 
	position AS p
ON su.id = p.id_employee
INNER JOIN 
	total_salary AS ts 
ON su.id = ts.id_employee
INNER JOIN 
	department AS d
ON d.id_department = p.id_department;




