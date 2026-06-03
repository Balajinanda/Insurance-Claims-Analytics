-- Calculate total claims paid by the insurance company
-- Purpose: Understand overall financial exposure
SELECT
    SUM(claim) AS TotalClaims
FROM dbo.insurance_data;


-- Calculate average claim amount
-- Purpose: Determine average insurance payout per customer

SELECT
    AVG(claim) AS AverageClaim
FROM dbo.insurance_data;


-- Analyze claims across regions
-- Purpose: Identify high-cost geographical areas

SELECT
    region,
    COUNT(*) AS CustomerCount,
    SUM(claim) AS TotalClaims,
    AVG(claim) AS AverageClaim
FROM dbo.insurance_data
GROUP BY region
ORDER BY TotalClaims DESC;


-- Compare claim amounts between smokers and non-smokers
-- Purpose: Evaluate impact of smoking on insurance risk

SELECT
    smoker,
    COUNT(*) AS CustomerCount,
    SUM(claim) AS TotalClaims,
    AVG(claim) AS AverageClaim
FROM dbo.insurance_data
GROUP BY smoker
ORDER BY AverageClaim DESC;


-- Compare claims for diabetic and non-diabetic customers
-- Purpose: Assess health-related risk factors

SELECT
    diabetic,
    COUNT(*) AS CustomerCount,
    SUM(claim) AS TotalClaims,
    AVG(claim) AS AverageClaim
FROM dbo.insurance_data
GROUP BY diabetic
ORDER BY AverageClaim DESC;


-- Analyze claims by gender
-- Purpose: Identify demographic claim patterns

SELECT
    gender,
    COUNT(*) AS CustomerCount,
    SUM(claim) AS TotalClaims,
    AVG(claim) AS AverageClaim
FROM dbo.insurance_data
GROUP BY gender;


-- Segment customers into age groups
-- Purpose: Understand claim behaviour across different age categories

SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 49 THEN '30-49'
        ELSE '50+'
    END AS AgeGroup,
    COUNT(*) AS CustomerCount,
    SUM(claim) AS TotalClaims,
    AVG(claim) AS AverageClaim
FROM dbo.insurance_data
GROUP BY
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 49 THEN '30-49'
        ELSE '50+'
    END
ORDER BY AverageClaim DESC;


-- Analyze combined impact of smoking and diabetes
-- Purpose: Identify highest-risk customer segment

SELECT
    smoker,
    diabetic,
    COUNT(*) AS CustomerCount,
    SUM(claim) AS TotalClaims,
    AVG(claim) AS AverageClaim
FROM dbo.insurance_data
GROUP BY smoker,diabetic
ORDER BY AverageClaim DESC;


-- Retrieve customers with highest claims
-- Purpose: Identify extreme claim cases for investigation

SELECT TOP 10
    PatientID,
    age,
    gender,
    bmi,
    bloodpressure,
    diabetic,
    smoker,
    region,
    claim
FROM dbo.insurance_data
ORDER BY claim DESC;