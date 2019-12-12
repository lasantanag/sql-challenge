CREATE TABLE Employees (
    emp_no VARCHAR NOT NULL PRIMARY KEY,
    birth_date VARCHAR   NOT NULL,
    fist_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    gender VARCHAR,
    hire_date VARCHAR   NOT NULL
    );

SELECT * FROM Employees;


CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL PRIMARY KEY,
    dept_name VARCHAR   NOT NULL
);


SELECT * FROM Departments;


CREATE TABLE DepartmentEmployees (
    emp_no VARCHAR   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	dept_no VARCHAR   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    from_date VARCHAR   NOT NULL,
    to_date VARCHAR   NOT NULL
);

SELECT * FROM DepartmentEmployees;

CREATE TABLE Salaries (
    emp_no VARCHAR   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    salary VARCHAR   NOT NULL,
    from_date VARCHAR   NOT NULL,
    to_date VARCHAR   NOT NULL
);

SELECT * FROM Salaries;

CREATE TABLE Titles (
    emp_no VARCHAR   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    title VARCHAR   NOT NULL,
    from_date VARCHAR   NOT NULL,
    to_date VARCHAR   NOT NULL
);

SELECT * FROM Titles;

CREATE TABLE DepartmentManager (
    dept_no VARCHAR   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    emp_no VARCHAR   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    from_date VARCHAR   NOT NULL,
    to_date VARCHAR   NOT NULL
);

SELECT * FROM DepartmentManager;


--1st list
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees 
INNER JOIN salaries
ON salaries.emp_no = employees.emp_no;

--2nd list
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date LIKE '1986%';


--3rd list
SELECT departmentmanager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name, departmentmanager.from_date, departmentmanager.to_date
FROM departmentmanager
INNER JOIN employees
ON employees.emp_no = departmentmanager.emp_no
INNER JOIN departments
ON departments.dept_no = departmentmanager.dept_no;

--4th list
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN departmentemployees
ON departmentemployees.emp_no = employees.emp_no
INNER JOIN departments
ON departments.dept_no = departmentemployees.dept_no;

--5th list
SELECT employees.first_name, employees.last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6th list
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN departmentemployees
ON departmentemployees.emp_no = employees.emp_no
INNER JOIN departments
ON departments.dept_no = departmentemployees.dept_no
WHERE dept_name = 'Sales';

--7th list
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN departmentemployees
ON departmentemployees.emp_no = employees.emp_no
INNER JOIN departments
ON departments.dept_no = departmentemployees.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8th
SELECT employees.last_name, COUNT(employees.last_name)
FROM employees
GROUP BY last_name
ORDER BY (COUNT) DESC;

--- 


