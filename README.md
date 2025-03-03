SELECT FirstName, LastName, Salary FROM employees;
SELECT DISTINCT departments.departmentname 
FROM employees
JOIN departments ON employees.departmentid = departments.departmentid;
SELECT * FROM employees
JOIN departments ON employees.departmentid = departments.departmentid
WHERE departments.departmentname = 'IT';
SELECT * FROM employees 
ORDER BY salary DESC;
SELECT CONCAT(FirstName, ' ', LastName) AS FullName, EmployeeID, FirstName, LastName, Age, Salary, JoinDate 
FROM employees;
SELECT 
    CONCAT(e.FirstName, ' ', e.LastName) AS FullName, 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    e.Age, 
    d.DepartmentName,  
    e.Salary, 
    e.JoinDate 
FROM employees e
JOIN departments d ON e.DepartmentID = d.DepartmentID; 
