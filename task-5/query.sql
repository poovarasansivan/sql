
-- Query to select all employees who belong to departments listed in the departments table
SELECT * FROM employees WHERE dept_id IN (SELECT dept_id FROM departments)


-- Query to select all employees who have the maximum salary in the employees table
SELECT * FROM employees WHERE salary IN (SELECT MAX(salary) FROM employees)


-- Query to select all employees who have the maximum salary in the employees table
SELECT *,(SELECT MAX(salary) FROM employees) AS maximum_salary FROM employees


-- Query to select all employees who have the minimum salary in the employees table
SELECT * FROM (SELECT emp_id,emp_name, MIN(salary) AS minimum_salary FROM employees) AS minimum_salary 