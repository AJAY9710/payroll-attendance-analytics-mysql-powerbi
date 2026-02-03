//Employee + Department Details (JOINS)
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name,
    e.date_of_joining,
    e.status
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

//Monthly Payroll Report (JOIN + CALCULATION)
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    p.month_year,
    p.total_salary
FROM payroll p
JOIN employees e
ON p.employee_id = e.employee_id;

//Attendance Count per Employee (AGGREGATION
  SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    COUNT(a.attendance_id) AS total_days_marked,
    SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS present_days,
    SUM(CASE WHEN a.status = 'Absent' THEN 1 ELSE 0 END) AS absent_days
FROM employees e
LEFT JOIN attendance a
ON e.employee_id = a.employee_id
GROUP BY e.employee_id;


//Attendance Percentage (CASE + AGGREGATE)
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    ROUND(
        (SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0) 
        / COUNT(a.attendance_id), 2
    ) AS attendance_percentage
FROM employees e
JOIN attendance a
ON e.employee_id = a.employee_id
GROUP BY e.employee_id;


//Department-wise Salary Cost (GROUP BY)
SELECT 
    d.department_name,
    SUM(p.total_salary) AS total_department_salary
FROM payroll p
JOIN employees e ON p.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;


//Window Function – Salary Ranking
SELECT 
    employee_id,
    total_salary,
    RANK() OVER (ORDER BY total_salary DESC) AS salary_rank
FROM payroll;


//CTE – High Earners
WITH high_earners AS (
    SELECT employee_id, total_salary
    FROM payroll
    WHERE total_salary > 60000
)
SELECT 
    e.first_name,
    e.last_name,
    h.total_salary
FROM high_earners h
JOIN employees e
ON h.employee_id = e.employee_id;

//Subquery – Above Average Salary
SELECT 
    employee_id,
    total_salary
FROM payroll
WHERE total_salary >
    (SELECT AVG(total_salary) FROM payroll);


