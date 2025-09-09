---1. Total claims by policy type:
SELECT p.PolicyType, COUNT(c.ClaimID) AS TotalClaims
FROM Claims c
JOIN Policies p ON c.PolicyID = p.PolicyID
GROUP BY p.PolicyType;

--2.Top 5 customers based on total premiums paid:
SELECT c.Name, SUM(p.PremiumAmount) AS TotalPremiumPaid
FROM Policies p
JOIN Customers c ON p.CustomerID = c.CustomerID
GROUP BY c.Name
ORDER BY TotalPremiumPaid DESC
--LIMIT 5 ;

--3. Claims trends over time (monthly):
SELECT FORMAT(ClaimsDate, 'yyyy-MM') AS Month, COUNT(*) AS ClaimCount
FROM Claims
GROUP BY FORMAT(ClaimsDate, 'yyyy-MM')
ORDER BY Month;

---4.top
SELECT TOP 5 c.Name, SUM(p.PremiumAmount) AS TotalPremiumPaid
FROM Policies p
JOIN Customers c ON p.CustomerID = c.CustomerID
GROUP BY c.Name
ORDER BY TotalPremiumPaid DESC;

--5.Total Claim Amount per Customer and their Status Counts
--This query shows the total claim amount per customer and a breakdown of claim statuses.

SELECT
    c.CustomerID,
    c.Name,
    COUNT(cl.ClaimID) AS TotalClaims,
    SUM(cl.ClaimAmount) AS TotalClaimAmount,
    SUM(CASE WHEN cl.Status = 'Approved' THEN 1 ELSE 0 END) AS ApprovedClaims,
    SUM(CASE WHEN cl.Status = 'Pending' THEN 1 ELSE 0 END) AS PendingClaims,
    SUM(CASE WHEN cl.Status = 'Rejected' THEN 1 ELSE 0 END) AS RejectedClaims
FROM Customers c
LEFT JOIN Claims cl ON c.CustomerID = cl.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalClaimAmount DESC;

--7. Claims with Policy and Payment Details (Multi-Table Join)
--Get a comprehensive view that includes claims, related policy details, and total payments made for each policy.

SELECT
    cl.ClaimID,
    cl.CustomerID,
    cl.PolicyID,
    cl.ClaimAmount,
    cl.ClaimsDate,
    cl.Status,
    p.PolicyType,
    p.PremiumAmount,
    SUM(pay.AmountPaid) AS TotalPayments
FROM Claims cl
INNER JOIN Policies p ON cl.PolicyID = p.PolicyID
LEFT JOIN Payments pay ON p.PolicyID = pay.PolicyID
GROUP BY
    cl.ClaimID,
    cl.CustomerID,
    cl.PolicyID,
    cl.ClaimAmount,
    cl.ClaimsDate,
    cl.Status,
    p.PolicyType,
    p.PremiumAmount
ORDER BY cl.ClaimsDate DESC;

--8. Customers with No Claims (Subquery Example)
--Find customers who have never filed a claim.

SELECT
    c.CustomerID,
    c.Name,
    c.Age,
    c.Location
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Claims cl
    WHERE cl.CustomerID = c.CustomerID
);

--- 9. Policies with High Premiums and their Claims (CTE Example)
--List policies with a premium higher than the average, along with their claims.

WITH HighPremiumPolicies AS (
    SELECT *
    FROM Policies
    WHERE PremiumAmount > (SELECT AVG(PremiumAmount) FROM Policies)
)
SELECT
    hpp.PolicyID,
    hpp.PolicyType,
    hpp.PremiumAmount,
    cl.ClaimID,
    cl.ClaimAmount,
    cl.Status
FROM HighPremiumPolicies hpp
LEFT JOIN Claims cl ON hpp.PolicyID = cl.PolicyID
ORDER BY hpp.PremiumAmount DESC;

--10. Running Total of Claims Amount per Customer (Window Function)
--Get a running total of claims for each customer, ordered by claim date.

SELECT
    cl.CustomerID,
    c.Name,
    cl.ClaimID,
    cl.ClaimsDate,
    cl.ClaimAmount,
    SUM(cl.ClaimAmount) OVER (PARTITION BY cl.CustomerID ORDER BY cl.ClaimsDate) AS RunningTotalClaimAmount
FROM Claims cl
INNER JOIN Customers c ON cl.CustomerID = c.CustomerID
ORDER BY cl.CustomerID, cl.ClaimsDate;

--11. Top 5 Customers by Total Claims Amount (Ranking Function)
--Find the top 5 customers who claimed the most.

SELECT TOP 5
    c.CustomerID,
    c.Name,
    SUM(cl.ClaimAmount) AS TotalClaimAmount
FROM Customers c
INNER JOIN Claims cl ON c.CustomerID = cl.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalClaimAmount DESC;

--12. Claims Distribution by Status and Month
--Show the count of claims per month for each status.

SELECT
    FORMAT(cl.ClaimsDate, 'yyyy-MM') AS ClaimMonth,
    cl.Status,
    COUNT(cl.ClaimID) AS NumberOfClaims
FROM Claims cl
GROUP BY FORMAT(cl.ClaimsDate, 'yyyy-MM'), cl.Status
ORDER BY ClaimMonth, cl.Status;

--13. Customers with Multiple Approved Claims Worth Over $5000
SELECT
    c.CustomerID,
    c.Name,
    COUNT(cl.ClaimID) AS ApprovedClaimCount,
    SUM(cl.ClaimAmount) AS TotalApprovedClaims
FROM Customers c
INNER JOIN Claims cl ON c.CustomerID = cl.CustomerID
WHERE cl.Status = 'Approved'
GROUP BY c.CustomerID, c.Name
HAVING COUNT(cl.ClaimID) > 1 AND SUM(cl.ClaimAmount) > 5000
ORDER BY TotalApprovedClaims DESC;

-- 14. Claims and Payment Status per Policy (Conditional Aggregation)

SELECT
    p.PolicyID,
    p.PolicyType,
    COUNT(cl.ClaimID) AS ClaimCount,
    SUM(cl.ClaimAmount) AS TotalClaimAmount,
    SUM(pay.AmountPaid) AS TotalPaymentsMade,
    CASE
        WHEN SUM(pay.AmountPaid) >= p.PremiumAmount THEN 'Fully Paid'
        ELSE 'Payment Pending'
    END AS PaymentStatus
FROM Policies p
LEFT JOIN Claims cl ON p.PolicyID = cl.PolicyID
LEFT JOIN Payments pay ON p.PolicyID = pay.PolicyID
GROUP BY p.PolicyID, p.PolicyType, p.PremiumAmount
ORDER BY p.PolicyID;

---15. Percentage of Approved Claims vs. Total Claims (Using CTE & Aggregates)
WITH ClaimCounts AS (
    SELECT
        COUNT(*) AS TotalClaims,
        SUM(CASE WHEN Status = 'Approved' THEN 1 ELSE 0 END) AS ApprovedClaims
    FROM Claims
)
SELECT
    TotalClaims,
    ApprovedClaims,
    CAST(ApprovedClaims AS FLOAT) / TotalClaims * 100 AS ApprovedClaimPercentage
FROM ClaimCounts;

