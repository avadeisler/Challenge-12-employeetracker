-- need to figure out how to address the 3rd element

SELECT department.department_name AS department, role.role
FROM departments
LEFT JOIN department
ON role.department_id = department.id
ORDER BY department.department_name;
