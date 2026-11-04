CREATE VIEW laporan_kinerja_driver AS 
SELECT 
    UPPER(TRIM(nama_kotor)) AS nama_bersih,
    LEFT(plat_nomor, 1) AS kode_wilayah,
    DATEDIFF(CURRENT_TIME(), tgl_daftar) AS hari_bergabung,
    ROUND(COALESCE(rating, 0)) AS rating_final,
    MOD(total_trip, 10) AS sisa_trip,
    pendapatan / NULLIF(jam_kerja, 0) AS perdapatan_per_jam,
    CASE 
        WHEN total_trip >= 100 AND rating >= 4.5 THEN 'Elite'
        WHEN total_trip = 0 THEN 'Newbie' 
        ELSE 'Regular' 
    END AS status_kinerja
FROM driver_senjaride;

SELECT * FROM laporan_kinerja_driver;

SELECT nama_bersih, hari_bergabung, perdapatan_per_jam
FROM laporan_kinerja_driver
WHERE status_kinerja = 'Elite';