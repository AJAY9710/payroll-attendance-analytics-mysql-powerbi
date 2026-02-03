CREATE DATABASE payroll_db;
USE payroll_db;

//Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL
);

//Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department_id INT,
    date_of_joining DATE,
    status VARCHAR(20),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
//Attendance Table
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(10),  -- Present / Absent
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
//Leaves Table
CREATE TABLE leaves (
    leave_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    leave_date DATE,
    leave_type VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
//Salary Structure Table
CREATE TABLE salary_structure (
    employee_id INT PRIMARY KEY,
    basic_salary DECIMAL(10,2),
    hra DECIMAL(10,2),
    allowances DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
//Payroll Table
CREATE TABLE payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    month_year VARCHAR(20),
    total_salary DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
