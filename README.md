# 📊 Accounts Receivable (AR) & Financial Aging Analytics

![Dashboard Preview](https://via.placeholder.com/800x400.png?text=Financial+Aging+Dashboard+Preview)

## 📌 Executive Summary
Proyek ini bertujuan untuk mengoptimalkan analisis piutang usaha (*Accounts Receivable*) dan siklus arus kas perusahaan melalui pengolahan data transaksi, *data cleaning*, serta visualisasi *aging buckets*. 

Dengan menganalisis tren keterlambatan pembayaran dan pola risiko kredit pelanggan, proyek ini memberikan dasar pengambilan keputusan untuk mempercepat siklus penagihan dan menekan risiko piutang tertagih (*bad debt*).

---

## 🎯 Business Problem
Perusahaan membutuhkan visibilitas yang lebih jelas terhadap outstanding piutang guna menjaga kestabilan *cash flow*. Pertanyaan bisnis utama yang ingin dijawab:
1. Berapa total nilai piutang yang jatuh tempo berdasarkan kategori umur (*Aging Buckets*)?
2. Siapa saja pelanggan (*top accounts*) dengan tingkat risiko keterlambatan tertinggi?
3. Berapa rata-rata durasi penagihan piutang (*Days Sales Outstanding / DSO*) saat ini?

---

## 🛠️ Tools & Technologies
- **SQL (PostgreSQL / MySQL):** Untuk ekstraksi, *data cleaning*, manipulasi data tanggal, dan logika pengelompokan *aging*.
- **Excel / Power BI / Tableau:** Untuk pembuatan *interactive executive dashboard*.
- **Git & GitHub:** Versi kontrol dan dokumentasi proyek.

---

## 📁 Repository Structure
```text
.
├── README.md               <-- Dokumentasi Proyek
├── data/
│   ├── raw_ar_data.csv     <-- Sample dataset mentah (Dummy data)
│   └── cleaned_ar_data.csv <-- Dataset hasil validasi & pembersihan
├── sql/
│   ├── 01_data_cleaning.sql
│   └── 02_aging_analysis.sql
├── dashboards/
│   └── ar_aging_dashboard.pdf
└── assets/
    └── dashboard_preview.png
