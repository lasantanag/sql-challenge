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



