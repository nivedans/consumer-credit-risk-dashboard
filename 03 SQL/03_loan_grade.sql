-- ============================================
-- Hypothesis 3: Loan Grades Reflect Borrower Default Risk
-- ============================================

-- Business Question 1:
-- How many loans exist within each loan grade?

SELECT
    loan_grade,
    COUNT(*) AS total_loans
FROM credit_risk
GROUP BY loan_grade
ORDER BY loan_grade;

-- Findings:
-- The lending portfolio is concentrated in lower-risk grades
-- (A and B), while relatively few loans were issued to the
-- highest-risk grades (E, F and G).


-- Business Question 2:
-- What is the default rate for each loan grade?

SELECT
    loan_grade,
    COUNT(*) AS total_loans,
    SUM(loan_status) AS total_defaults,
    ROUND(100.0 * SUM(loan_status) / COUNT(*), 2) AS default_rate
FROM credit_risk
GROUP BY loan_grade
ORDER BY loan_grade;

-- Findings:
-- Default rates increase consistently as loan grades become
-- riskier, rising from approximately 9% for Grade A loans to
-- approximately 98% for Grade G loans.

-- Note:
-- Grade G contains only 64 loans, so this result should be
-- interpreted cautiously due to the relatively small sample size.


-- Business Question 3:
-- Does default risk increase as loan grade becomes riskier?

-- Answer:
-- Yes. The results strongly support the hypothesis, with a
-- consistent upward trend in observed default rates from
-- Grade A through Grade G.

-- Business Insight:
-- Loan grade appears to be one of the strongest indicators of
-- borrower credit risk within this dataset and should remain a
-- key factor in lending decisions, pricing strategies and
-- portfolio risk management.


-- ============================================
-- Additional Analysis: Risk-Based Pricing
-- ============================================

-- Business Question:
-- Do higher-risk loan grades receive higher interest rates?

SELECT
    loan_grade,
    COUNT(*) AS total_loans,
    ROUND(AVG(loan_int_rate), 2) AS avg_interest_rate
FROM credit_risk
GROUP BY loan_grade
ORDER BY loan_grade;

-- Findings:
-- Average interest rates increase consistently from Grade A
-- (7.33%) to Grade G (20.25%).

-- Business Insight:
-- The consistent increase in both default rates and average
-- interest rates suggests the lender's pricing strategy aligns
-- with its observed assessment of borrower risk.