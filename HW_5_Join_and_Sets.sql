--Task 0: Full Name and Salary for All Employees
SELECT
	ee.id
	, ee.last_name|| ' ' ||ee.first_name full_name
	, es.amount
FROM 
	employees.employee AS ee
INNER JOIN 
	employees.salary AS es 
ON ee.id = es.employee_id
ORDER BY ee.id ASC;
	
--Task 1: Full Name of All Managers with Salary > 85 000
--Write a query to find the full name (combination of first_name and last_name) 
--for all managers and their salary, where the salary is greater than 85 000. 
--Order the results by employee_id and by first_name.
--Minimum number of tables required to use: 3 (”employee”, “salary”, “department_manager”).
SELECT
	ee.id
	, ee.last_name|| ' ' ||ee.first_name full_name
	, es.amount
FROM 
	employees.employee AS ee
INNER JOIN 
	employees.salary AS es 
ON ee.id = es.employee_id
INNER JOIN 
	employees.department_manager AS edm 
ON ee.id = edm.employee_id
WHERE es.amount > 85000
ORDER BY ee.id, ee.first_name;

--Task 2: Manager ID and Average Salary > Average Company Salary-- Find avg salary --
--Write a query to find the employee_id of managers and their average salary,
--where the salary is greater than the average salary of the entire company.
--Order the results by average salary and employee_id in ascending order.
--Minimum number of tables required to use: 2 (“salary”, “department_manager”).
SELECT
	edm.employee_id
	, ROUND(AVG(es.amount),2) AS avg_salary
FROM 
	employees.department_manager AS edm
INNER JOIN 
	employees.salary AS es 
ON edm.employee_id = es.employee_id
GROUP BY edm.employee_id
HAVING AVG(amount) > (SELECT
						AVG(amount) FROM employees.salary)
ORDER BY avg_salary; 


--Task 3: Max and Avg Salary in All Departments
--Write a query to find the department_id, dept_name, average salary, 
--and maximum salary in all departments. Order the results by average salary in descending order.
--Output: department_id, dept_name.
SELECT
	ed.id
	, ed.dept_name
	, ROUND(AVG(es.amount), 2) AS avg_salary
	, MAX (es.amount) AS max_salary
FROM 
	employees.department AS ed
FULL JOIN 
	employees.department_employee AS ede 
ON ed.id = ede.department_id
INNER JOIN 
	employees.salary AS es 
ON ede.employee_id = es.employee_id
GROUP BY 
	ed.id
ORDER BY avg_salary DESC;

/* Task 4: Current Employee Salary and Details
Find the employee_id, first_name, last_name, title, and salary for all current employees.
Only retrieve records where the salary is valid for the current date. */

SELECT
	ee.id
	, ee.first_name
	, ee.last_name
	, et.title
	, es.amount
FROM 
	employees.employee AS ee
INNER JOIN 
	employees.title AS et
ON ee.id = et.employee_id
INNER JOIN 
	employees.salary AS es 
ON ee.id = es.employee_id
WHERE es.to_date >= CURRENT_DATE;

/* Task 5: Count of Employees in Each Title
Display the title and the count of employees for each title.
Only include employees with valid salaries for the current date.
Use “salary” and “title” tables. */

SELECT
	 et.title
	, COUNT(es.employee_id)
FROM 
	employees.salary AS es 
INNER JOIN 
	employees.title AS et
ON es.employee_id = et.employee_id
WHERE es.to_date >= CURRENT_DATE
GROUP BY et.title;

/* Task 6: Employees with Over 25 Years of Experience
Find the employee_id, first_name, last_name, title, and total years of experience 
(must be created) in the company for all employees, who have worked for more than 25 years.
Only include employees with valid titles and hire dates for the current date.
Output: id, first_name, last_name, title, total years of experience */

SELECT
	ee.id
	, ee.first_name
	, ee.last_name
	, et.title
	,  EXTRACT(YEAR FROM AGE(NOW(), from_date)) AS total_years
FROM 
	employees.employee AS ee 
INNER JOIN 
	employees.title AS et
ON ee.id = et.employee_id
WHERE EXTRACT(YEAR FROM AGE(NOW(), from_date)) >= 25 AND et.to_date >= CURRENT_DATE 


/* Task 7: Senior Staff and Managers 
Write a query that returns data for Senior Staff and Manager positions.
For Senior Staff, return employee_id, title, and the average salary rounded to 2 decimals, 
alias as flag.
For Managers, return employee_id, title, 50 000.*/

SELECT
	et.employee_id
	, et.title
	, ROUND (AVG(es.amount),2) AS flag
FROM 
	employees.title AS et   
INNER JOIN 
	employees.salary AS es 
ON et.employee_id = es.employee_id
WHERE et.title LIKE 'Senior Staff' OR et.title LIKE 'Manager' AND es.amount > 50000
GROUP BY et.employee_id, et.title
ORDER BY title;

/* *Task 8: Employees who are not Managers
Write a query to find all employees who are NOT managers.
Use the set-operation. */

SELECT 
	* 
FROM 
	employees.title as t
EXCEPT
SELECT
	* 
FROM 
	employees.title as t2
WHERE 	
	t2.title LIKE 'Manager'
	ORDER BY title;

/* Task 9: Add New Departments
Write a query that adds two new departments to the “department” table: 
id - d009 with the dept_name 'Test' and id - d010 with the dept_name 'AI – dept'.
Don't modify department table. Use only the set-operation. Order the results by id. */
	
CREATE TABLE IF NOT EXISTS department2 (
	id char(4),
	dept_name VARCHAR(50))
		;
		 
INSERT INTO department2(id, dept_name)
VALUES ('d009', 'Test'), 
	('d010', 'AI_dept');	
	

SELECT *
FROM 
	employees.department
UNION ALL
SELECT *	
FROM 
	department2;

