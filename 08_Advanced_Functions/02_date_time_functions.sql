-- Tambah Tabel pengiriman
CREATE TABLE pengiriman (
    id_resi INT PRIMARY KEY,
    tanggal_pesan DATE,
    tanggal_kirim DATE
);

-- Masukka data ke tabel
INSERT INTO pengiriman(id_resi, tanggal_pesan, tanggal_kirim) VALUES
(101, '2026-11-01', '2026-11-03'),
(102, '2026-11-01', '2026-11-05'),
(103, '2026-11-02', '2026-11-02');

-- Ekkstraksi tahun & bulan (YEAR & MONTH):
SELECT
    YEAR(tanggal_pesan) AS tahun_pesanan,
    MONTH(tanggal_pesan) AS bulan_pesanan
FROM pengiriman;

-- Selisih Hari (DATEDIFF):
SELECT DATEDIFF(tanggal_kirim, tanggal_pesan) AS selisih_kirim
FROM pengiriman;

-- All In One
SELECT
    id_resi,
    YEAR(tanggal_pesan) AS tahun_pesanan,
    MONTH(tanggal_pesan) AS bulan_pesanan,
    DATEDIFF(tanggal_kirim, tanggal_pesan) AS selisih_kirim
FROM pengiriman;

-- DATEADD
SELECT 
    DATE_ADD(tanggal_pesan, INTERVAL 9 MONTH) AS pesanan_bulan_fix,
    DATE_ADD(tanggal_kirim, INTERVAL 9 MONTH) AS pesanan_bulan_fix
FROM pengiriman;

SELECT 
    DATE_ADD(tanggal_kirim, INTERVAL 9 DAY) AS pesanan_bulan_fix,
    tanggal_pesan
FROM pengiriman;

SELECT DATEDIFF(selisih_kirim.pesanan_bulan_fix, selisih_kirim.tanggal_pesan) AS selisih_kirim
FROM (
    SELECT 
        DATE_ADD(tanggal_kirim, INTERVAL 9 DAY) AS pesanan_bulan_fix,
        tanggal_pesan
    FROM pengiriman
) AS selisih_kirim