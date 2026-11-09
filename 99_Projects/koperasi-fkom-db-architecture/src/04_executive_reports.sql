-- ====================================================================
-- VIEW: v_laporan_pinjaman
-- Description: Membuat laporan pinjaman untuk setiap orang dan 
-- Logic: Mengecek jumlah realisasi, total dibayar dan sisa hutang
-- ====================================================================

CREATE VIEW v_laporan_pinjaman AS
SELECT
    b.nomor_bp,
    u.nama_user AS nama_anggota,
    b.jumlah_realisasi,
    COALESCE(SUM(a.jumlah_angsuran), 0) AS total_dibayar,
    b.jumlah_realisasi - COALESCE(SUM(a.jumlah_angsuran), 0) AS sisa_hutang
FROM BP b 
INNER JOIN User u ON b.nomor_user_anggota = u.nomor_user
LEFT JOIN Angsuran a ON b.nomor_bp = a.nomor_bp
GROUP BY
    b.nomor_bp,
    u.nama_user,
    b.jumlah_realisasi;

SELECT * FROM v_laporan_pinjaman;


-- ==========================================CREATE==========================
-- VIEW: Laporan Setiap Bulan
-- Description: Membuat laporan pinjaman untuk setiap bulan nya
-- Logic: Mengecek Total Pokok Masuk, Total Bunga Masuk, Total Pemasukan Kas
-- ====================================================================
CREATE OR REPLACE VIEW v_laporan_bulanan AS
SELECT
    DATE_FORMAT(tanggal_ba, '%M %Y') AS bulan_tahun,
    COALESCE(SUM(jumlah_angsuran), 10) as total_pokok_masuk,
    COALESCE(SUM(bunga), 0) AS total_bunga_masuk,
    COALESCE(SUM(jumlah_angsuran + bunga), 0) AS total_pemasukan_kas
FROM Angsuran
WHERE tanggal_ba BETWEEN '2026-10-01' AND '2026-10-30'
GROUP BY bulan_tahun;

SELECT * FROM v_laporan_bulanan;