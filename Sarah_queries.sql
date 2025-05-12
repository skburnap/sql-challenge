-- Salary by employee
SELECT  employee.employee_id,
        employee.last_name,
        employee.first_name,
        employee.sex,
        salaries.salary
FROM employees as employee
    LEFT JOIN salaries as salaries
    ON (employee.employee_id = salaries.employee_id)
ORDER BY employee.employee_id;

-- Employees hired in 1986
SELECT first_name, last_name, date_hired
FROM employees
WHERE date_hired BETWEEN '1986-01-01' AND '1986-12-31';

-- Manager of each department
SELECT  department_manager.department_id,
        department.department_name,
        department_manager.employee_id,
        employee.last_name,
        employee.first_name
FROM dept_manager AS department_manager
    INNER JOIN departments AS department
        ON (department_manager.department_id = department.department_id)
    INNER JOIN employees AS employee
        ON (department_manager.employee_id = employee.employee_id);


-- Department of each employee
SELECT  employee.employee_id,
        employee.last_name,
        employee.first_name,
        department.department_name
FROM employees AS employee
    INNER JOIN dept_emp AS employee_department
        ON (employee.employee_id = employee_department.employee_id)
    INNER JOIN departments AS department
        ON (employee_department.department_id = department.department_id)
ORDER BY employee.employee_id;

-- Employees whose first name is "Hercules" and last name begins with "B"
SELECT first_name, last_name, date_of_birth, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Employees in the Sales department
SELECT  employee.employee_id,
        employee.last_name,
        employee.first_name,
        department.department_name
FROM employees AS employee
    INNER JOIN dept_emp AS employee_department
        ON (employee.employee_id = employee_department.employee_id)
    INNER JOIN departments AS department
        ON (employee_department.department_id = department.department_id)
WHERE department.department_name = 'Sales'
ORDER BY employee.employee_id;

-- Employees in Sales and Development departments
SELECT  employee.employee_id,
        employee.last_name,
        employee.first_name,
        department.department_name
FROM employees AS employee
    INNER JOIN dept_emp AS employee_department
        ON (employee.employee_id = employee_department.employee_id)
    INNER JOIN departments AS department
        ON (employee_department.department_id = department.department_id)
WHERE department.department_name IN ('Sales', 'Development')
ORDER BY employee.employee_id;

-- The frequency of employee last names
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
