CREATE TABLE titles(
	title_id varchar not NULL,
	title varchar not NULL,
	PRIMARY KEY (title_id)
);
--Not null, no blank entrys 
CREATE TABLE departments(
	dept_id varchar not NULL,
	dept_name varchar not NULL,
	PRIMARY KEY (dept_id)
);

CREATE TABLE employees (
	-- INT b/c emp_no will be number 
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
	--calls a refrence to previous table we created titles
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
    dept_id VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
	--calls a refrence to previous table we created employees and departments
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_id) REFERENCES departments (dept_id),
    PRIMARY KEY (dept_id, emp_no)
);

CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_id VARCHAR   NOT NULL,
    --calls a refrence to previous table we created employees and departments
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_id) REFERENCES departments (dept_id),
    PRIMARY KEY (emp_no, dept_id)
);

CREATE TABLE salaries (
	--both will be numbers so they are integers
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    --calls a refrence to previous table we created employees
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);
