CREATE OR REPLACE VIEW laporan_kinerja_driver AS
SELECT 
    UPPER(TRIM(nama_kotor)) AS nama_bersih,
    LEFT(plat_nomor, 1) AS kode_wilayah,
    DATEDIFF(CURRENT_TIME(), tgl_daftar) AS hari_bergabung,
    ROUND(COALESCE(rating, 0)) AS rating_final,
    MOD(total_trip, 10) AS sisa_trip,
    pendapatan / NULLIF(jam_kerja, 0) AS perdapatan_per_jam,
    CASE 
        WHEN total_trip >= 120 AND rating >= 4.8 THEN 'Elite'
        WHEN total_trip = 0 THEN 'Newbie' 
        ELSE 'Regular' 
    END AS status_kinerja
FROM driver_senjaride;