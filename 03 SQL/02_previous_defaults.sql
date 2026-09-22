-- ============================================
-- Hypothesis 2: Previous Default History is a Strong Predictor of Future Default
-- ============================================

-- Business Question 1:
-- How many borrowers have a previous default on file?

SELECT
    cb_person_default_on_file,
    COUNT(*) AS total_borrowers
FROM credit_risk
GROUP BY cb_person_default_on_file;

-- Findings:
-- No previous default: 26,680 borrowers
-- Previous default: 5,729 borrowers


-- Business Question 2:
-- What is the current default rate for borrowers
-- with and without a previous default?

SELECT
    cb_person_default_on_file,
    COUNT(*) AS total_borrowers,
    SUM(loan_status) AS defaults,
    ROUND(100.0 * SUM(loan_status) / COUNT(*), 2) AS default_rate
FROM credit_risk
GROUP BY cb_person_default_on_file;

-- Findings:
-- No previous default:
-- 4,919 defaults (18.44%)

-- Previous default:
-- 2,169 defaults (37.86%)


-- Business Question 3:
-- How much higher is the observed default risk for
-- borrowers with a previous default?

-- Answer:
-- Borrowers with a previous default history had a
-- default rate of 37.86% compared with 18.44% for
-- borrowers without previous defaults.

-- Relative Risk:
-- Approximately 2.05× higher observed default risk.

-- Business Insight:
-- Previous default history appears to be one of the
-- strongest indicators of future credit risk within
-- this dataset and could be incorporated into
-- borrower risk assessments.