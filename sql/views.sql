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



