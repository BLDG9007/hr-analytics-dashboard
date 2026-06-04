USE HR_Analytics;
GO

SELECT DB_NAME() AS CurrentDatabase;

SELECT TOP 10 * FROM dbo.hr_data;

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'hr_data';

SELECT COUNT(*) AS Total_Employees
FROM dbo.hr_data;

SELECT 
    Attrition,
    COUNT(*) AS Employees
FROM dbo.hr_data
GROUP BY Attrition;

SELECT 
    Department,
    COUNT(*) AS Employees_Left
FROM dbo.hr_data
WHERE Attrition = 1
GROUP BY Department
ORDER BY Employees_Left DESC;

SELECT 
    OverTime,
    Attrition,
    COUNT(*) AS Employees
FROM dbo.hr_data
GROUP BY OverTime, Attrition
ORDER BY OverTime;

SELECT 
    Department,
    AVG(MonthlyIncome) AS Avg_Salary
FROM dbo.hr_data
GROUP BY Department
ORDER BY Avg_Salary DESC;

SELECT 
    JobSatisfaction,
    COUNT(*) AS Employees
FROM dbo.hr_data
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

SELECT 
    Age,
    COUNT(*) AS Employees
FROM dbo.hr_data
GROUP BY Age
ORDER BY Age;

SELECT 
    ROUND(
        (SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0)
        / COUNT(*),
    2) AS Attrition_Rate
FROM dbo.hr_data;



