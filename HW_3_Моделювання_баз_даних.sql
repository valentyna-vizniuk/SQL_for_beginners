CREATE TABLE IF NOT EXISTS StaffUniversity (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	birth_date DATE,
	experience_years CHAR(2),
	hire_date DATE
	);

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
	
	
SELECT *
FROM total_salary;