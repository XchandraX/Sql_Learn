-- Query Agregasi

-- Count & avg
SELECt COUNT(judul_film) AS total_film,
AVG(rating) AS rata_rata_rating
FROM riwayat_tontonan;

-- Min & Max
SELECT MIN(durasi_menit) AS durasi_pendek,
MAX(durasi_menit) AS durasi_panjang
FROM riwayat_tontonan
WHERE tipe_langganan = 'Premium';

-- COUNT Distinct
SELECT COUNT(DISTINCT genre)
FROM riwayat_tontonan;
