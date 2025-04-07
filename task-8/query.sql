-- This SQL query selects all employees with a salary greater than 50,000 from the employees table.
-- It uses a Common Table Expression (CTE) to create a temporary result set named high_salary, which contains the emp_id, emp_name, and salary of employees whose salary exceeds 50,000. The final SELECT statement retrieves all columns from the high_salary CTE.
WITH high_salary AS (SELECT emp_id, emp_name, salary FROM employees WHERE salary > 50000) SELECT * FROM high_salary;


-- This SQL query selects all employees from the employees table and their corresponding manager's name from the managers table. It uses a Common Table Expression (CTE) to create a temporary result set named emp_manager, which contains the emp_id, emp_name, and manager_name of employees. The final SELECT statement retrieves all columns from the emp_manager CTE.
WITH RECURSIVE emp_tree AS (
SELECT emp_id,emp_name,manager_id, 1 AS LEVEL FROM employees WHERE manager_id IS NULL
UNION ALL
SELECT e.emp_id,e.emp_name,e.manager_id,er.level + 1 FROM employees e JOIN emp_tree er ON e.manager_id=er.emp_id)
SELECT * FROM emp_tree
