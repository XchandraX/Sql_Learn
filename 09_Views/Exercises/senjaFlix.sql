CREATE TABLE pelanggan_senjaflix (
    id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
    nama_akun VARCHAR(50),
    paket_langganan VARCHAR(20),
    tanggal_daftar DATE,
    durasi_nonton_menit INT,
    status_bayar ENUM('Lunas', 'Tunggak') DEFAULT 'Tunggak'
);

INSERT INTO pelanggan_senjaflix (nama_akun, paket_langganan, tanggal_daftar, durasi_nonton_menit, status_bayar) VALUES
('  Reza rahardian  ', 'Premium', '2026-01-10', 4300, 'Lunas'),
('anya geraldine', 'Basic', '2026-10-05', 120, 'Lunas'),
('   jefri NICHOL   ', 'Standard', '2026-08-20', 3200, 'Tunggak'),
('anggun c sasmi', 'Premium', '2026-11-01', 0, 'Lunas');

CREATE VIEW dasbor_marketing AS
SELECT 
    UPPER(TRIM(nama_akun)) AS nama_bersih,
    paket_langganan,
    FLOOR(durasi_nonton_menit / 60) AS jam_nonton,
    CASE 
        WHEN durasi_nonton_menit > 3000 THEN 'Binge Watcher' 
        WHEN durasi_nonton_menit = 0 THEN 'Tidak Aktif' 
        ELSE  'Penonton Kasual'
    END AS kategori_penonton
FROM pelanggan_senjaflix;

SELECT * FROM dasbor_marketing;

SELECT * 
FROM dasbor_marketing
WHERE kategori_penonton = 'Binge Watcher';

CREATE OR REPLACE VIEW dasbor_marketing AS
SELECT
    UPPER(TRIM(nama_akun)) AS nama_bersih,
    paket_langganan,
    FLOOR(durasi_nonton_menit / 60) AS jam_nonton,
    CASE 
        WHEN durasi_nonton_menit > 4000 THEN 'Binge Watcher' 
        WHEN durasi_nonton_menit = 0 THEN 'Tidak Aktif' 
        ELSE 'Penonton Kasual'
    END AS kategori_penonton,
    DATEDIFF(CURRENT_DATE, tanggal_daftar) AS masa_aktif_hari
FROM pelanggan_senjaflix;

SELECT * FROM dasbor_marketing;