-- QUESTION ONE
CREATE TABLE employee (
    employee_name VARCHAR(50) PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE company (
    company_name VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50)
);

CREATE TABLE works (
    employee_name VARCHAR(50),
    company_name VARCHAR(50),
    salary DECIMAL(10, 2),
    PRIMARY KEY (employee_name, company_name),
    FOREIGN KEY (employee_name) REFERENCES employee(employee_name),
    FOREIGN KEY (company_name) REFERENCES company(company_name)
);

CREATE TABLE manages (
    employee_name VARCHAR(50),
    manager_name VARCHAR(50),
    PRIMARY KEY (employee_name, manager_name),
    FOREIGN KEY (employee_name) REFERENCES employee(employee_name),
    FOREIGN KEY (manager_name) REFERENCES employee(employee_name)
);


-- QUESTION TWO
-- Insert into employee table
INSERT INTO employee (employee_name, street, city) VALUES
('Martin', 'Zion Road', 'Washington DC'),
('Dehan', 'Maple Road', 'Chicago'),
('Steve Job', 'Alpine 704', 'Florida'),
('Zeceal', 'Westside', 'Juan Park');

-- Insert into company table
INSERT INTO company (company_name, city) VALUES
('Microsoft', 'Chicago'),
('Think Twice', 'Florida'),
('TechNinja', 'Washington DC');

-- Insert into works table
INSERT INTO works (employee_name, company_name, salary) VALUES
('Dehan', 'Microsoft', 1000000),
('Steve Job', 'Think Twice', 750000),
('Martin', 'TechNinja', 150000);

-- Insert into manages table
INSERT INTO manages (employee_name, manager_name) VALUES
('Dehan', 'Bill Gates'),
('Steve Job', 'Bezos'),
('Martin', 'Mosh Hamedani');



-- QUESTION THREE
SELECT employee.employee_name, works.company_name, works.salary
FROM employee
INNER JOIN works ON employee.employee_name = works.employee_name;


-- QUESTION FOUR
DELETE FROM company WHERE company_name = 'TechCorp';

DELETE FROM works WHERE company_name = 'TechCorp';



-- QUESTION FIVE
SELECT employee.employee_name
FROM employee
RIGHT OUTER JOIN works ON employee.employee_name = works.employee_name
WHERE works.employee_name IS NULL;


-- QUESTION SIX
ALTER TABLE employee
ADD phone_number VARCHAR(20);


-- QUESTION SEVEN
ALTER TABLE works
RENAME TO employment;

ALTER TABLE employment
ADD start_date DATE;



-- QUESTION EIGHT
SELECT employee.city, COUNT(employee.employee_name) AS employee_count
FROM employee
GROUP BY employee.city;

