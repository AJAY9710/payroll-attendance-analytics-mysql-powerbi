//Create View
CREATE VIEW vw_employee_payroll AS
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name,
    p.month_year,
    p.total_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN payroll p ON e.employee_id = p.employee_id;

SELECT * FROM vw_employee_payroll;

//Create View – Attendance Summary
CREATE VIEW vw_attendance_summary AS
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    COUNT(a.attendance_id) AS total_days,
    SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS present_days,
    SUM(CASE WHEN a.status = 'Absent' THEN 1 ELSE 0 END) AS absent_days
FROM employees e
LEFT JOIN attendance a ON e.employee_id = a.employee_id
GROUP BY e.employee_id;

SELECT * FROM vw_attendance_summary;

//Stored Procedure – Generate Payroll
DELIMITER $$

CREATE PROCEDURE generate_payroll(IN pay_month VARCHAR(20))
BEGIN
    INSERT INTO payroll (employee_id, month_year, total_salary)
    SELECT 
        employee_id,
        pay_month,
        (basic_salary + hra + allowances)
    FROM salary_structure;
END$$

DELIMITER ;

CALL generate_payroll('Feb-2026');

SELECT * FROM payroll;

//Stored Procedure – Get Department Salary Cost
DELIMITER $$

CREATE PROCEDURE dept_salary_cost(IN dept_name VARCHAR(100))
BEGIN
    SELECT 
        d.department_name,
        SUM(p.total_salary) AS total_salary_cost
    FROM payroll p
    JOIN employees e ON p.employee_id = e.employee_id
    JOIN departments d ON e.department_id = d.department_id
    WHERE d.department_name = dept_name
    GROUP BY d.department_name;
END$$

DELIMITER ;

CALL dept_salary_cost('IT');
