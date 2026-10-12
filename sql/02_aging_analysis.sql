-- =====================================================
-- STEP 2: AGING BUCKET CALCULATION & METRICS
-- Objective: Menghitung keterlambatan (days overdue) & membagi ke aging bucket
-- =====================================================

WITH ar_aging_base AS (
    SELECT 
        invoice_id,
        customer_name,
        invoice_amount,
        outstanding_balance,
        due_date,
        -- Asumsi snapshot date / tanggal cutoff laporan
        CURRENT_DATE AS snapshot_date,
        (CURRENT_DATE - due_date) AS days_overdue
    FROM cleaned_ar_transactions
    WHERE outstanding_balance > 0
)

SELECT 
    customer_name,
    SUM(outstanding_balance) AS total_outstanding,
    
    -- Categorization Aging Bucket
    SUM(CASE WHEN days_overdue <= 0 THEN outstanding_balance ELSE 0 END) AS "Current (Not Due)",
    SUM(CASE WHEN days_overdue BETWEEN 1 AND 30 THEN outstanding_balance ELSE 0 END) AS "1 - 30 Days",
    SUM(CASE WHEN days_overdue BETWEEN 31 AND 60 THEN outstanding_balance ELSE 0 END) AS "31 - 60 Days",
    SUM(CASE WHEN days_overdue BETWEEN 61 AND 90 THEN outstanding_balance ELSE 0 END) AS "61 - 90 Days",
    SUM(CASE WHEN days_overdue > 90 THEN outstanding_balance ELSE 0 END) AS "> 90 Days"

FROM ar_aging_base
GROUP BY customer_name
ORDER BY total_outstanding DESC;
