-- seeds for the employee table

INSERT INTO employee (employee_name)
VALUES ("Felix"),
       ("Pietro"),
       ("Holly"),
       ("Killian"),
       ("Coraline");

-- seeds for the departments table

INSERT INTO departments (employee_id, departments)
VALUES (1, "Shoes"),
       (2, "Juniors"),
       (3, "Suits"),
       (4, "Fine Jewelry"),
       (5, "Home"),

-- seeds for the salary table
       
INSERT INTO salary (employee_id, salary)
VALUES (1, "25,000"),
       (2, "25,000"),
       (3, "30,000"),
       (4, "40,000"),
       (5, "30,000"),