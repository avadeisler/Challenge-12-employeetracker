DROP DATABASE IF EXISTS employeetracker_db;
CREATE DATABASE employeetracker_db;

USE employeetracker_db;

-- creates the departments names table

CREATE TABLE department (
  id PRIMARY KEY,
 department_name VARCHAR(30)
);

-- creates the roles table

CREATE TABLE role (
    id PRIMARY KEY,
    title VARCHAR(30),
    salary DECIMAL,
    department_id INT 
);

-- creates the salary table

CREATE TABLE employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    role_id INT,
    manager_id INT
);