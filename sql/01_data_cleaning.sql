---

### 2. File SQL 1: `sql/01_data_cleaning.sql`

Buat folder `sql/` dan tambahkan file **`01_data_cleaning.sql`**:

```sql
-- =====================================================
-- STEP 1: DATA CLEANING & VALIDATION
-- Objective: Filter data valid, tangani NULL, dan standarisasi tanggal
-- =====================================================

CREATE TABLE cleaned_ar_transactions AS
SELECT 
    invoice_id,
    customer_id,
    customer_name,
    CAST(invoice_date AS DATE) AS invoice_date,
    CAST(due_date AS DATE) AS due_date,
    COALESCE(payment_date, NULL) AS payment_date,
    invoice_amount,
    COALESCE(paid_amount, 0) AS paid_amount,
    (invoice_amount - COALESCE(paid_amount, 0)) AS outstanding_balance,
    CASE 
        WHEN payment_status IS NULL OR payment_status = '' THEN 'Unpaid'
        ELSE payment_status
    END AS status
FROM raw_ar_data
WHERE invoice_amount > 0 
  AND invoice_date IS NOT NULL;
