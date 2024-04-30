-- need to figure out how to address the 3rd element of salary

SELECT employee.employee_name AS employee, departments. departments
FROM departments
LEFT JOIN employee
ON departments.employee_id = employee.id
ORDER BY employee.employee_name;
