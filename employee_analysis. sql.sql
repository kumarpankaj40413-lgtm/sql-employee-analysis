-- ========================================================
-- PROJECT: Employee Turnover & Workforce Analytics
-- DATABASE: employee_db
-- ========================================================

USE employee_db;

-- 1. Total Employee Count
SELECT COUNT(*) AS total_employees FROM Employee_data;


-- 2. City-Wise Employee Distribution
SELECT City, COUNT(*) AS employee_count 
FROM Employee_data 
GROUP BY City 
ORDER BY employee_count DESC;


-- 3. Education Breakdown & Turnover Rate
SELECT Education, 
       COUNT(*) AS total_staff,
       SUM(LeaveOrNot) AS total_left,
       ROUND((SUM(LeaveOrNot) / COUNT(*)) * 100, 2) AS attrition_rate_pct
FROM Employee_data
GROUP BY Education;


-- 4. Gender Diversity Across Payment Tiers
SELECT PaymentTier, Gender, COUNT(*) AS total_employees
FROM Employee_data
GROUP BY PaymentTier, Gender
ORDER BY PaymentTier, Gender;


-- 5. Average Age & Experience of Employees Who Left vs Stayed
SELECT LeaveOrNot, 
       ROUND(AVG(Age), 1) AS avg_age, 
       ROUND(AVG(ExperienceInCurrentDomain), 1) AS avg_experience_years
FROM Employee_data
GROUP BY LeaveOrNot;


-- 6. Turnover Analysis by Ever Benched Status
SELECT EverBenched, 
       COUNT(*) AS total_employees,
       SUM(LeaveOrNot) AS employees_left
FROM Employee_data
GROUP BY EverBenched;


-- 7. High-Risk Experience Segment (Domain Experience vs Leave Rate)
SELECT ExperienceInCurrentDomain, 
       COUNT(*) AS total_employees,
       SUM(LeaveOrNot) AS employees_left,
       ROUND((SUM(LeaveOrNot) / COUNT(*)) * 100, 2) AS leave_percentage
FROM Employee_data
GROUP BY ExperienceInCurrentDomain
ORDER BY ExperienceInCurrentDomain;


-- 8. Top Hiring Years (Joining Year Trend)
SELECT JoiningYear, COUNT(*) AS hires_count
FROM Employee_data
GROUP BY JoiningYear
ORDER BY JoiningYear ASC;