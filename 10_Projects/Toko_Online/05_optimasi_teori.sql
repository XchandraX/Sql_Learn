--- Optimasi & Teori

-- Perbaiki query berikut agar SARGable:
-- SELECT * FROM pesanan
-- WHERE YEAR(tanggal_pesanan) = 2025;
SELECT *
FROM pesanan
WHERE tanggal_pesanan >= '2025-01-01'
    AND tanggal_pesanan < '2026-01-01'


--- Jelaskna kapan sebaiknya memakai SQL vs NoSQL untuk:

-- transaksi pembayaran,
--- SQL/RDBMS, karena butuh ACID, integritas, dan relasi ketak

-- rekomendasi produk real-time.
--- NoSQL, karena butuh fleksibilitas skema, volume besar, dan skalabilitas horizontal.

--- Pola modern sering memakai Polyglot Persistence: SQL untuk transaksi kritis, NoSQL untuk analitik/cache/rekomendasi.


