--List the employee number, last name, first name, sex, and salary of each employee
SELECT sal.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
INNER JOIN salaries AS sal
ON sal.emp_no = emp.emp_no;

--List the first name, last name, and hire date for each employee who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT DISTINCT ON (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name,
					employees.first_name
FROM dept_manager
INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--List the department number for each employee along with that employee's employee number, last name, first name and department name
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, emp.last_name, emp.first_name, d.dept_name
FROM employees AS emp
LEFT JOIN dept_emp AS dpts
ON emp.emp_no = dpts.emp_no
INNER JOIN departments AS d
ON dpts.dept_no = d.dept_no

--List first name, last name, sex of each employee whose first name is Hercules and whose last name starts with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE (first_name = 'Hercules') AND (LOWER(last_name) LIKE 'b%');

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS deptemp
ON emp.emp_no = deptemp.emp_no
INNER JOIN departments AS dept
ON deptemp.dept_no = dept.dept_no
WHERE LOWER(dept.dept_name) = 'sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS deptemp
ON emp.emp_no = deptemp.emp_no
INNER JOIN departments AS dept
ON deptemp.dept_no = dept.dept_no
WHERE (LOWER(dept.dept_name) = 'sales') OR (LOWER(dept.dept_name) = 'development');

--List the frequency counts, in descending order, of all the employee last names(that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;


