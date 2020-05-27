-- DATA ANALYSIS

-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no AS "Employee Number",
    e.last_name AS "Last Name",
    e.first_name AS "First Name",
    e.gender AS "Gender",
    s.salary AS "Salary"
FROM employees AS e
LEFT JOIN salaries AS s ON e.emp_no = s.emp_no;
    
-- List employees who were hired in 1986.
SELECT emp_no,
    first_name,
    last_name,
    hire_date
FROM employees
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no,
    d.dept_name,
    dm.emp_no,
    e.last_name,
    e.first_name,
    dm.from_date,
    dm.to_date
FROM dept_manager as dm
JOIN employees as e ON dm.emp_no = e.emp_no
JOIN departments as d ON d.dept_no = dm.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees as e
JOIN dept_emp as de ON e.emp_no = de.emp_no
JOIN departments as d ON d.dept_no = de.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees AS e 
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments as d ON d.dept_no = de.dept_no
WHERE d.dept_name LIKE 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees AS e 
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments as d ON d.dept_no = de.dept_no
WHERE d.dept_name LIKE 'Sales' OR d.dept_name LIKE 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS frequency_count FROM employees
GROUP BY last_name
ORDER BY count(last_name) desc;