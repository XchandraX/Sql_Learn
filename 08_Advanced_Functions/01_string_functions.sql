-- Active: 1793347618764@@127.0.0.1@3306@KopiSenja
-- Buat tabel member_kopi
CREATE TABLE member_kopi (
    id_member INT PRIMARY KEY,
    nama_depan VARCHAR(50),
    nama_belakang VARCHAR(50),
    kode_voucher VARCHAR(50)
);

INSERT INTO member_kopi(id_member, nama_depan, nama_belakang, kode_voucher) VALUES
(1, 'budi', 'santoso', 'PROMO-BUDI-2026'),
(2, 'SITI', 'aminah', 'DISKON-SITI-50'),
(3, 'aNdI', 'wijaya', 'GRATIS-ANDI-99');

-- Standardisasi Huruf (UPPER & lower)
SELECT 
    UPPER(nama_depan) AS depan_kapital,
    LOWER(nama_belakang) AS belakang_kecil
FROM member_kopi;

-- Penggabungan Teks (Concat)
SELECT CONCAT(nama_depan, ' ', nama_belakang) AS nama_lengkap
FROM member_kopi;

-- Pemotongan & Penghitungan (SUBSTRING & LENGTH)
SELECT 
    SUBSTRING(kode_voucher, 1, 6) AS jenis_promo,
    LENGTH(kode_voucher) AS panjang_kode
FROM member_kopi;


-- Buat Tabel pelanggan_kotor
CREATE TABLE pelanggan_kotor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    no_hp VARCHAR(50),
    alamat VARCHAR(100)
);

-- Menambahkan data ke tabel 
INSERT INTO pelanggan_kotor(no_hp, alamat) VALUES
('   0812345678   ', 'Jln. Merdeka No 10'),
(' 0898765432 ', 'Jln. Sudirmman Raya'),
('0855555555', 'Jln. Gatot Subroto');


-- Bersihkan Spasi (TRIM)
SELECT TRIM(no_hp) AS hp_bersih
FROM pelanggan_kotor;

-- Standardisasi Jalan (REPLACE)
SELECT REPLACE(alamat, 'Jln.', 'Jalan') AS alamat_resmi
FROM pelanggan_kotor;

-- Sensor Nomor HP (RIGTH)
SELECT RIGHT(digit_akhir.no_bersih, 4) AS digit_akhir
FROM (
    SELECT TRIM(no_hp) AS no_bersih
    FROM pelanggan_kotor
) AS digit_akhir;

