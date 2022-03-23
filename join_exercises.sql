# example from lecture
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
  AND e.emp_no = 10001;
# Current manager of each department
SELECT dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM departments AS d
         JOIN dept_manager AS dm
              ON d.dept_no = dm.dept_no
         JOIN employees AS e
              ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01'
ORDER BY dept_name;
# All departments currently managed by women
SELECT dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM departments AS d
         JOIN dept_manager AS dm
              ON d.dept_no = dm.dept_no
         JOIN employees AS e
              ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01'
  AND e.gender = 'F'
ORDER BY dept_name;
# current titles of employees currently working in customer service and current number
SELECT title, COUNT(titles.emp_no) AS total
FROM titles
         JOIN dept_emp AS de
              ON titles.emp_no = de.emp_no
WHERE de.dept_no = 'd009'
  AND titles.to_date = '9999-01-01'
  AND de.to_date = '9999-01-01'
GROUP BY title;
# find current salary of all current managers
SELECT dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager, salary
FROM departments AS d
         JOIN dept_manager AS dm
              ON d.dept_no = dm.dept_no
         JOIN employees AS e
              ON dm.emp_no = e.emp_no
         JOIN salaries AS s
              ON e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
ORDER BY dept_name;
# BONUS: Find the names of all current employees, their department name, and their current manager's name
SELECT CONCAT(e.first_name, ' ', e.last_name) AS Employee, d.dept_name AS Department
FROM dept_emp AS de
         JOIN employees AS e
              ON e.emp_no = de.emp_no
         JOIN departments AS d
              ON de.dept_no = d.dept_no
         JOIN dept_manager AS dm
              ON de.dept_no = dm.dept_no
WHERE de.to_date = '9999-01-01'
  AND dm.to_date = '9999-01-01'
ORDER BY dept_name;