-- ============================================
-- Hypothesis 5: Higher Interest Rates Are Associated with Higher Default Risk
-- ============================================

-- Business Question 1:
-- How many loans fall into each interest-rate band?

SELECT
    CASE
        WHEN loan_int_rate IS NULL THEN 'Missing'
        WHEN loan_int_rate < 5 THEN '0-5%'
        WHEN loan_int_rate < 10 THEN '5-10%'
        WHEN loan_int_rate < 15 THEN '10-15%'
        WHEN loan_int_rate < 20 THEN '15-20%'
        ELSE '20%+'
    END AS interest_rate_band,

    COUNT(*) AS total_loans

FROM credit_risk

GROUP BY interest_rate_band

ORDER BY
    CASE interest_rate_band
        WHEN 'Missing' THEN 1
        WHEN '0-5%' THEN 2
        WHEN '5-10%' THEN 3
        WHEN '10-15%' THEN 4
        WHEN '15-20%' THEN 5
        ELSE 6
    END;

-- Findings:
-- Most loans had interest rates between 5% and 15%.
-- 3,094 loans contained missing interest-rate values and were
-- retained to preserve the maximum number of observations.


-- Business Question 2:
-- What is the default rate for each interest-rate band?

SELECT
    CASE
        WHEN loan_int_rate IS NULL THEN 'Missing'
        WHEN loan_int_rate < 5 THEN '0-5%'
        WHEN loan_int_rate < 10 THEN '5-10%'
        WHEN loan_int_rate < 15 THEN '10-15%'
        WHEN loan_int_rate < 20 THEN '15-20%'
        ELSE '20%+'
    END AS interest_rate_band,

    COUNT(*) AS total_loans,
    SUM(loan_status) AS defaults,
    ROUND(100.0 * SUM(loan_status) / COUNT(*), 2) AS default_rate

FROM credit_risk

GROUP BY interest_rate_band

ORDER BY
    CASE interest_rate_band
        WHEN 'Missing' THEN 1
        WHEN '0-5%' THEN 2
        WHEN '5-10%' THEN 3
        WHEN '10-15%' THEN 4
        WHEN '15-20%' THEN 5
        ELSE 6
    END;

-- Findings:
-- Among loans with known interest rates, default rates generally
-- increased as interest rates increased.

-- Lowest observed default rate:
-- 5-10% band: 10.79%

-- Highest observed default rate:
-- 20%+ band: 85.14%

-- Note:
-- The 20%+ category contains only 74 loans and should be
-- interpreted cautiously.


-- Business Question 3:
-- Is there a relationship between higher interest rates and default risk?

-- Answer:
-- Yes. The results support the hypothesis that higher interest
-- rates are associated with higher observed default risk.

-- Business Insight:
-- Higher interest rates appear to act as a useful indicator of
-- borrower risk within this dataset. The relationship may reflect
-- risk-based pricing rather than interest rates directly causing
-- defaults, so the findings should be interpreted as an
-- association rather than a causal effect.