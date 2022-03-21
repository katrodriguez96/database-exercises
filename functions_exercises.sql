USE employees;
SELECT *
FROM employees
WHERE gender = 'M'
  AND (
            first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya')
ORDER BY last_name DESC, first_name DESC;

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%e'
ORDER BY emp_no DESC;

SELECT CONCAT(first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE 'E%e';

SELECT *
FROM employees
WHERE last_name LIKE '%q%'
  AND NOT last_name LIKE '%qu%';

SELECT DATEDIFF(CURDATE(), hire_date)
from employees
WHERE year(hire_date) BETWEEN 1990 AND 1999
  AND month(birth_date) = 12
  AND day(birth_date) = 25
ORDER BY birth_date, hire_date DESC;