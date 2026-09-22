-- ============================================
-- Hypothesis 1: Higher Loan-to-Income Ratios Increase Default Risk
-- ============================================

-- Business Question 1:
-- Compare the average loan-to-income ratio between defaulted
-- and non-defaulted borrowers.

SELECT
    loan_status,
    COUNT(*) AS total_borrowers,
    ROUND(AVG(loan_percent_income), 2) AS avg_loan_percent_income
FROM credit_risk
GROUP BY loan_status;

-- Finding:
-- Defaulted borrowers had an average loan-to-income ratio of 25%
-- compared with 15% for non-defaulted borrowers.


-- Business Question 2:
-- Calculate default rates across loan-to-income bands.

SELECT
    CASE
        WHEN loan_percent_inc < 0.10 THEN '<10%'
        WHEN loan_percent_inc < 0.20 THEN '10% to <20%'
        WHEN loan_percent_inc < 0.30 THEN '20% to <30%'
        WHEN loan_percent_inc < 0.40 THEN '30% to <40%'
        ELSE '40%+'
    END AS income_band,

    COUNT(*) AS total_loans,
    SUM(loan_status) AS defaults,
    ROUND(100.0 * SUM(loan_status) / COUNT(*), 2) AS default_rate

FROM credit_risk

GROUP BY income_band

ORDER BY
    CASE income_band
        WHEN '<10%' THEN 1
        WHEN '10% to <20%' THEN 2
        WHEN '20% to <30%' THEN 3
        WHEN '30% to <40%' THEN 4
        ELSE 5
    END;

-- Findings:
-- <10%: 11.59%
-- 10% to <20%: 14.74%
-- 20% to <30%: 20.98%
-- 30% to <40%: 61.93%
-- 40%+: 73.57%

-- Business Question 3:
-- Which income band has the highest default rate?

-- Answer:
-- The 40%+ loan-to-income band recorded the highest observed
-- default rate (73.57%).

-- Business Insight:
-- Default rates increase consistently as loan-to-income ratios rise,
-- suggesting affordability is an important indicator of credit risk.