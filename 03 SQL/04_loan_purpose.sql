-- ============================================
-- Hypothesis 4: Some Loan Purposes Carry Higher Default Risk
-- ============================================

-- Business Question 1:
-- How many loans were issued for each loan purpose?

SELECT
    loan_intent,
    COUNT(*) AS total_loans
FROM credit_risk
GROUP BY loan_intent
ORDER BY loan_intent;

-- Findings:
-- Loan applications were reasonably well distributed across the
-- six loan purposes. Education accounted for the largest number
-- of loans (6,409), while Home Improvement had the fewest (3,594),
-- allowing meaningful comparisons across categories.


-- Business Question 2:
-- How many defaults occurred within each loan purpose?

SELECT
    loan_intent,
    COUNT(*) AS total_loans,
    SUM(loan_status) AS total_defaults
FROM credit_risk
GROUP BY loan_intent
ORDER BY loan_intent;

-- Findings:
-- Medical loans recorded the highest number of defaults (1,617),
-- followed by Debt Consolidation (1,488). Venture loans recorded
-- the fewest defaults (844).


-- Business Question 3:
-- What is the default rate for each loan purpose?

SELECT
    loan_intent,
    COUNT(*) AS total_loans,
    SUM(loan_status) AS total_defaults,
    ROUND(100.0 * SUM(loan_status) / COUNT(*), 2) AS default_rate
FROM credit_risk
GROUP BY loan_intent
ORDER BY default_rate DESC;

-- Findings:
-- Debt Consolidation recorded the highest observed default rate
-- (28%), followed by Medical and Home Improvement loans (26%).
-- Venture loans recorded the lowest observed default rate (14%).


-- Business Question 4:
-- Which loan purpose has the highest and lowest default rate?

-- Answer:
-- Highest: Debt Consolidation (28%)
-- Lowest: Venture (14%)

-- Business Insight:
-- Loan purpose appears to provide additional context when
-- assessing borrower risk. While the relationship is less
-- pronounced than factors such as loan grade or previous
-- default history, higher-risk purposes could be used as a
-- secondary indicator during affordability assessments and
-- lending decisions.