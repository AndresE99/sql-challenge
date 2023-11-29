-- 1: List the employee number, last name, first name, sex, and salary of each employee.
SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        emp.sex,
        sal.salary
-- the way the data will be sorted once the data is extraced from employees and salaries table
FROM employees as emp
    LEFT JOIN salaries as sal
    ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

-- 2: List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
-- easier because we looing at employees from one table, for every employee who was hhired in 1986.
FROM employees
-- the between AND creates a range for what date it starts and ends.
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3: List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT  dm.dept_id,
        d.dept_name,
        dm.emp_no,
        e.last_name,
        e.first_name
FROM dept_manager AS dm
--inner joins possible becasue the primary and foreign keys we created.
    INNER JOIN departments AS d
        ON (dm.dept_id = d.dept_id)
    INNER JOIN employees AS e
        ON (dm.emp_no = e.emp_no);

-- 4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
-- Similar to above but we are pulling from diffrent tables this time.
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_id = d.dept_id)
ORDER BY e.emp_no;

-- 5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, birth_date, sex
-- all data is coming from one table which makes the process super easy with first pulling anyone with name Hercules. Second AND last name starts with B.
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6: List each employee in the Sales department, including their employee number, last name, and first name.
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_id = d.dept_id)
-- added this data into one of the collums we created in Select
WHERE d.dept_name = 'Sales'
-- made it so displays only those who work under Sales department.
ORDER BY e.emp_no;

-- 7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_id = d.dept_id)
-- made it so we are looking to pull employye data from two diffrent deparments
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

-- 8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
-- target what we are looking for, last_name and then count how many times that last name shows up.
SELECT last_name, COUNT(last_name)
-- pulling this data from employees table, and grouping them by lastname
FROM employees
-- grouped by last name but not alpabetical 
GROUP BY last_name
-- this makes it so the last name that appears the most shows up at the top of the data output.
ORDER BY COUNT(last_name) DESC;

