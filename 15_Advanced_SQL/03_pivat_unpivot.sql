CREATE TABLE rekap_penjualan (
    bulan VARCHAR(10),
    kategori VARCHAR(20),
    total_jual INT
);

INSERT INTO rekap_penjualan VALUES 
('Januari', 'Kopi', 50000),
('Januari', 'Pastry', 20000),
('Februari', 'Kopi', 65000),
('Februari', 'Pastry', 30000);

SELECT
    bulan,
    SUM(CASE WHEN kategori = 'Kopi' THEN total_jual ELSE 0 END) AS jual_kopi,
    SUM(CASE WHEN kategori = 'Pastry' THEN total_jual ELSE 0 END) AS jual_pastry
FROM rekap_penjualan
GROUP BY bulan;

TRUNCATE Table rekap_penjualan;