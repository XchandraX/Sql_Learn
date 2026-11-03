CREATE TABLE driver_senjaride (
    id_driver INT PRIMARY KEY,
    nama_kotor VARCHAR(50),
    plat_nomor VARCHAR(20),
    tgl_daftar DATE,
    rating DECIMAL(3,2),
    total_trip INT,
    jam_kerja INT,
    pendapatan INT
);

INSERT INTO driver_senjaride VALUES
(1, '   bUdi   ', 'B-1234-XYZ', '2026-10-01', 4.85, 45, 8, 400000),
(2, 'siti ', 'D-5678-ABC', '2026-10-15', 4.21, 12, 0, 50000), 
(3, '  aNDI', 'L-9999-QWE', '2026-11-01', NULL, 0, 0, 0), -- Driver baru, rating masih kosong, belum narik
(4, 'eko', 'B-1111-YYY', '2025-01-01', 4.95, 123, 10, 600000);

-- Profil (String Functions)
SELECT 
    UPPER(TRIM(nama_kotor)) AS nama_bersih,
    LEFT(plat_nomor, 1) AS kode_wilayah
FROM driver_senjaride;

-- Masa Bakti (Date Functions)
SELECT 
    ABS(DATEDIFF(tgl_daftar, CURRENT_TIME())) hari_bergabung -- coba-coba aja ini mah
FROM driver_senjaride;

-- Performa (Numeric & Pengaman NULL)
SELECT
    ROUND(COALESCE(rating, 0)) AS rating_final,
    MOD(total_trip, 10) AS sisa_trip
FROM driver_senjaride;

-- Evaluasi (Conditional & Math)
SELECT
    pendapatan / NULLIF(jam_kerja, 0) AS perdapatan_per_jam,
    CASE 
        WHEN total_trip >= 100 AND rating >= 4.5 THEN 'Elite'
        WHEN total_trip = 0 THEN 'Newbie' 
        ELSE 'Regular' 
    END AS status_kinerja
FROM driver_senjaride

-- All in One
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