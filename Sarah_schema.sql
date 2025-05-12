CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    PRIMARY KEY (title_id)
);
CREATE TABLE employees (
    employee_id INT   NOT NULL,
    title_id VARCHAR NOT NULL,
    date_of_birth DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    date_hired DATE   NOT NULL,
    FOREIGN KEY (title_id) REFERENCES titles (title_id),
    PRIMARY KEY (employee_id)
);


CREATE TABLE departments (
    department_id VARCHAR   NOT NULL,
    department_name VARCHAR   NOT NULL,
    PRIMARY KEY (department_id)
);

CREATE TABLE dept_manager (
    department_id VARCHAR   NOT NULL,
    employee_id INT   NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
    FOREIGN KEY (department_id) REFERENCES departments (department_id),
    PRIMARY KEY (department_id, employee_id)
);

CREATE TABLE dept_emp (
    employee_id INT   NOT NULL,
    department_id VARCHAR   NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
    FOREIGN KEY (department_id) REFERENCES departments (department_id),
    PRIMARY KEY (employee_id, department_id)
);


CREATE TABLE salaries (
    employee_id INT   NOT NULL,
    salary INT   NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
	PRIMARY KEY (employee_id)
);
