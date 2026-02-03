//Insert Departments
INSERT INTO departments (department_name) VALUES
('HR'),
('Finance'),
('IT'),
('Operations'),
('Sales');

//Insert Employees
INSERT INTO employees 
(first_name, last_name, email, department_id, date_of_joining, status) VALUES
('Ajay', 'Kumar', 'ajay.kumar@company.com', 3, '2022-01-10', 'Active'),
('Ravi', 'Sharma', 'ravi.sharma@company.com', 2, '2021-03-15', 'Active'),
('Sneha', 'Iyer', 'sneha.iyer@company.com', 1, '2020-06-20', 'Active'),
('Amit', 'Verma', 'amit.verma@company.com', 4, '2019-11-05', 'Active'),
('Neha', 'Singh', 'neha.singh@company.com', 5, '2023-02-01', 'Active');

//Insert Salary Structure
INSERT INTO salary_structure 
(employee_id, basic_salary, hra, allowances) VALUES
(1, 40000, 15000, 5000),
(2, 50000, 20000, 7000),
(3, 35000, 12000, 4000),
(4, 45000, 18000, 6000),
(5, 30000, 10000, 3000);


//Insert Attendance Data
INSERT INTO attendance (employee_id, attendance_date, status) VALUES
(1, '2026-01-02', 'Present'),
(1, '2026-01-03', 'Present'),
(1, '2026-01-04', 'Absent'),
(2, '2026-01-02', 'Present'),
(2, '2026-01-03', 'Present'),
(3, '2026-01-02', 'Absent'),
(4, '2026-01-02', 'Present'),
(5, '2026-01-02', 'Present');

//Insert Leave Data
INSERT INTO leaves (employee_id, leave_date, leave_type) VALUES
(1, '2026-01-04', 'Sick Leave'),
(3, '2026-01-02', 'Casual Leave');

//Generate Payroll Data
INSERT INTO payroll (employee_id, month_year, total_salary)
SELECT 
    employee_id,
    'Jan-2026',
    (basic_salary + hra + allowances)
FROM salary_structure;


