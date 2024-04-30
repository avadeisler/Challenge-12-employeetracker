DROP DATABASE IF EXISTS employeetracker_db;
CREATE DATABASE employeetracker_db;

USE employeetracker_db;

-- creates the employee names table

CREATE TABLE employee (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 employee_name VARCHAR(100) NOT NULL
);

-- creates the departments table

CREATE TABLE departments (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    departments TEXT NOT NULL,
    FOREIGN KEY (employee_id)
    REFERENCES employee(id)
    ON DELETE SET NULL
);

-- creates the salary table

CREATE TABLE salary (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    salary TEXT NOT NULL,
    FOREIGN KEY (employee_id)
    REFERENCES employee(id)
    ON DELETE SET NULL
);