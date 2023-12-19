/* Task 0: Employees Born in January 1956
Your answer: 1952 employees */
SELECT 
	*
FROM 
	employees.employee
WHERE
	birth_date BETWEEN '1956-01-01'AND'1956-01-31';

/* Task 1: Employees with Same First Name and Last Name
Your answer: 6 the same */
SELECT 
	*
FROM 
	employees.employee
WHERE
	first_name LIKE last_name

/* Task 2: Female Employees Hired in 1999
Your answer: 609 employees */
SELECT 
	*
FROM 
	employees.employee
WHERE
	gender = 'F' AND hire_date BETWEEN '1999-01-01'AND'1999-12-31';

/* Task 3: Employee IDs and Salaries Within a Range
Your answer: 673478 employee IDs */
SELECT 
	*
FROM 
	employees.salary
WHERE
	amount BETWEEN '70000'AND'90000';

/* Task 4: Unique Employee IDs with Salaries Outside a Range
Your answer: 2170569 employee IDs */
SELECT 
	*
FROM 
	employees.salary
WHERE
	amount NOT BETWEEN '70000'AND'90000';

/* Task 5: Employee with the Highest Salary
Your answer: employee_id - 43624, amount - 158220 */
SELECT 
	*
FROM 
	employees.salary
ORDER BY
	amount DESC
LIMIT
	1;

-- Task 6: The 5 Lowest Salaries After the 10 Lowest Salaries
SELECT 
	*
FROM 
	employees.salary
ORDER BY
	amount ASC
OFFSET
	10
LIMIT
	5;

/* Task 7: Employees with First Names Starting with 'U' and Ending with 'e'
Your answer: 467 employees */
SELECT 
	*
FROM 
	employees.employee
WHERE
	first_name LIKE 'U%e';

/* Task 8: Employees with Specific First and Last Names
Your answer: 1793 employees */
SELECT 
	*
FROM 
	employees.employee
WHERE
first_name NOT LIKE 'Parto' AND last_name LIKE '%na';

/* Task 9: Departments with 7-Character Names Starting with 'F'
Your answer: "Finance" */
SELECT 
	*
FROM 
	employees.department
WHERE
dept_name LIKE 'F______';

-- Task 10: 50 Employees with First Names Starting with 'An' or Not Starting with 'Mar'
SELECT 
	*
FROM 
	employees.employee
WHERE
first_name LIKE 'An%' OR first_name NOT LIKE 'Mar'
LIMIT
50;

/*Find the maximum and minimum salary from the “salary” table and calculate the difference between them.
Your answer: 119597 */
SELECT 
	MAX(amount) - MIN (amount)
FROM 
	employees.salary;

/* Task 1: Average Salary by Company
Your answer: 63810.744836143706 */
SELECT 
	AVG (amount) AS avg_by_company
FROM 
	employees.salary;

--Task 2: Average Salary by Employee ID (Rounded to 2 Decimal Places)
-- Your answer: 1001 ; 75388.94 , etc.
SELECT 
	employee_id
	, ROUND (AVG(amount),2)
FROM 
	employees.salary
GROUP BY 
	employee_id;

--Task 3: Maximum Annual Salary in the Company after 1956
--Your answer: 158220
SELECT 
	MAX(amount)
FROM 
	employees.salary
WHERE
	from_date > '1956-12-31';
	
--Task 4: Employee IDs with Salaries Higher than the Company Average
SELECT
	employee_id
	, amount
FROM 
	employees.salary
WHERE
	amount > (SELECT 
			  AVG (amount)
			  FROM employees.salary);
			  
--Task 5: Employee IDs with More Than 10 Unique Salaries
-- Your answer: 
SELECT 
	employee_id
	, COUNT (DISTINCT amount)
FROM 
	employees.salary
GROUP BY  
	employee_id
HAVING 
	COUNT (DISTINCT amount) > 10;

--Task 6: Number of Records for Each Gender
-- Your answer: M - 179973; F = 120051

SELECT 
COUNT (*)
FROM employees.employee
WHERE
gender = 'M';

SELECT 
COUNT (*)
FROM employees.employee
WHERE
gender = 'F';

