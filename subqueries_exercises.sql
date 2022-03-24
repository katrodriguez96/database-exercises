# find all employees with the same hire date as employee 101010 using a subquery
SELECT *
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = '101010'
);

# find all the titles held by employees with the first name 'Aamod'
SELECT title, COUNT(emp_no) AS '\employees named aamod'
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
)
GROUP BY title;

# find all current department managers that are female
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date = '9999-01-01'
)
  AND gender = 'F';

# BONUS
# find all the department names that currently have female managers
SELECT dept_name
FROM departments
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE to_date = '9999-01-01'
      AND emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE gender = 'F'
    )
);

# find the first and last name of the employee with the highest salary
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT * FROM (
        SELECT emp_no
        FROM salaries
        ORDER BY salary DESC
        LIMIT 1
    ) AS sq
);