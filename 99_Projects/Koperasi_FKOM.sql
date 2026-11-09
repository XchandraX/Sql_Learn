-- Active: 1793677744104@@127.0.0.1@3306@koperasi_fkom
-- Buat Table User
CREATE TABLE User (
    nomor_user INT PRIMARY KEY AUTO_INCREMENT,
    nama_user VARCHAR(100) NOT NULL,
    role ENUM('Petugas', 'Anggota') NOT NULL,
    tanggal_gabung TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Buat Table FPP (Formulir Permohonan Pinjaman)
CREATE TABLE FPP (
    nomor_fpp INT PRIMARY KEY AUTO_INCREMENT,
    nomor_user_anggota INT,
    nomor_user_petugas INT,
    jumlah_permohonan DECIMAL(12, 2),
    tanggal_permohonan DATE,
    keperluan TEXT,
    status ENUM('Disetujui', 'Menunggu', 'Ditolak') DEFAULT 'Menunggu',
    FOREIGN KEY (nomor_user_anggota) REFERENCES User(nomor_user) ON DELETE RESTRICT,
    FOREIGN KEY (nomor_user_petugas) REFERENCES User(nomor_user) ON DELETE RESTRICT
);

-- Buat Table BP (Bukti Peminjaman)
CREATE TABLE BP (
    nomor_bp INT PRIMARY KEY AUTO_INCREMENT,
    nomor_user_anggota INT,
    nomor_user_petugas INT,
    nomor_fpp INT,
    tanggal_bp DATE,
    jumlah_realisasi DECIMAL(12, 2),
    lama_angsuran INT,
    jumlah_angsuran DECIMAL(12, 2),
    bunga DECIMAL(12, 2),
    status_pinjaman ENUM('Belum Lunas', 'Lunas') DEFAULT 'Belum Lunas',
    FOREIGN KEY (nomor_user_anggota) REFERENCES User(nomor_user) ON DELETE RESTRICT,
    FOREIGN KEY (nomor_user_petugas) REFERENCES User(nomor_user) ON DELETE RESTRICT,
    FOREIGN KEY (nomor_fpp) REFERENCES FPP(nomor_fpp) ON DELETE RESTRICT
);

-- Buat Table Angsuran (BA - Bukti Angsuran)
CREATE TABLE Angsuran (
    nomor_ba INT PRIMARY KEY AUTO_INCREMENT,
    nomor_bp INT,
    jumlah_angsuran DECIMAL(12, 2),
    bunga DECIMAL(12, 2),
    tanggal_ba DATE,
    FOREIGN KEY (nomor_bp) REFERENCES BP(nomor_bp) ON DELETE RESTRICT
);

-- Tambah Data Petugas dan anggota
INSERT INTO User (nama_user, role, tanggal_gabung) VALUES
('Chandra Maulana', 'Petugas', '2023-01-10 08:00:00'),
('Muamar Khadafi', 'Petugas', '2023-02-15 09:30:00'),
('De Egi', 'Anggota', '2023-05-20 10:00:00'),
('Salsabila', 'Anggota', '2023-06-11 11:15:00'),
('Tanjiro', 'Anggota', '2023-08-05 14:20:00');

-- Tambah data FPP (Formulir Permohonan)
INSERT INTO FPP (nomor_user_anggota, nomor_user_petugas, jumlah_permohonan, tanggal_permohonan, keperluan, status) VALUES
(3, 1, 10000000.00, '2023-09-01', 'Renovasi Rumah', 'Disetujui'), 
(4, 2, 5000000.00, '2023-09-15', 'Biaya Sekolah Anak', 'Menunggu'), 
(5, 1, 25000000.00, '2023-09-20', 'Modal Usaha Warung', 'Ditolak');

-- Data BP (Bukti Peminjaman)
INSERT INTO BP (nomor_user_anggota, nomor_user_petugas, nomor_fpp, tanggal_bp, jumlah_realisasi, lama_angsuran, jumlah_angsuran, bunga) VALUES
(3, 1, 1, '2023-09-03', 10000000.00, 10, 1000000.00, 150000.00);

-- Tambah Data Angsuran (Bukti Angsuran)
INSERT INTO Angsuran (nomor_bp, jumlah_angsuran, bunga, tanggal_ba) VALUES
(1, 1000000.00, 150000.00, '2023-10-03'), -- Angsuran Bulan ke-1
(1, 1000000.00, 150000.00, '2023-11-03'), -- Angsuran Bulan ke-2
(1, 1000000.00, 150000.00, '2023-12-05'); -- Angsuran Bulan ke-3 (Agak telat 2 hari)

-- BuatBuktiPinjaman
DELIMITER $$

CREATE PROCEDURE BuatBuktiPinjaman(
    p_nomor_fpp INT, 
    p_nomor_user_anggota INT, 
    p_nomor_user_petugas INT, 
    p_jumlah_realisasi DECIMAL(12, 2), 
    p_lama_angsuran INT, 
    p_jumlah_angsuran DECIMAL(12, 2), 
    p_bunga DECIMAL(12, 2)
)
BEGIN
    -- 1. Deklarasi Variabel
    DECLARE v_cek_hutang INT DEFAULT 0;

    -- 2. Buka Gerbang Transaksi
    START TRANSACTION;

    -- 3. Cek Hutang
    SELECT COUNT(*) INTO v_cek_hutang 
    FROM BP 
    WHERE nomor_user_anggota = p_nomor_user_anggota AND status_pinjaman = 'Belum Lunas';

    -- 4. Percabangan Logika
    IF v_cek_hutang > 0 THEN
        ROLLBACK;
        SELECT 'Penolakan: Anggota masih memiliki pinjaman yang belum lunas.' AS status;
    ELSE
        -- Masukkan data (menggunakan CURDATE() untuk tanggal hari ini)
        INSERT INTO BP (nomor_fpp, nomor_user_anggota, nomor_user_petugas, tanggal_bp, jumlah_realisasi, lama_angsuran, jumlah_angsuran, bunga, status_pinjaman)
        VALUES (p_nomor_fpp, p_nomor_user_anggota, p_nomor_user_petugas, CURDATE(), p_jumlah_realisasi, p_lama_angsuran, p_jumlah_angsuran, p_bunga, 'Belum Lunas');
        
        -- Update status FPP HANYA untuk nomor FPP yang sedang diproses
        UPDATE FPP SET status = 'Disetujui' WHERE nomor_fpp = p_nomor_fpp;
        
        COMMIT;
        SELECT 'Pinjaman Berhasil Direalisasikan.' AS status;
    END IF;

END $$

DELIMITER ;

CALL BuatBuktiPinjaman(2, 4, 1, 10000000.00, 10, 1000000.00, 150000.00);


-- Laporan Peminjaman
CREATE VIEW v_laporan_pinjaman AS
SELECT 
    b.nomor_bp,
    u.nama_user AS nama_anggota,
    b.jumlah_realisasi,
    COALESCE(SUM(a.jumlah_angsuran), 0) AS total_dibayar,
    b.jumlah_realisasi - COALESCE(SUM(a.jumlah_angsuran), 0) AS sisa_hutang
FROM BP b
INNER JOIN User u ON b.nomor_user_anggota = u.nomor_user
LEFT JOIN `Angsuran` a ON b.nomor_bp = a.nomor_bp
GROUP BY 
    b.nomor_bp,
    u.nama_user,
    b.jumlah_realisasi;

SELECT * FROM v_laporan_pinjaman;


-- Laporan Pemasukan Angsuran
SELECT
    DATE_FORMAT(tanggal_ba, '%M %Y') AS Bulan_Tahun,
    COALESCE(SUM(jumlah_angsuran), 10) AS Total_Pokok_Masuk,
    COALESCE(SUM(bunga), 0) AS Total_Bunga_Masuk,
    COALESCE(SUM(jumlah_angsuran + bunga), 0) AS Total_Pemasukan_Kas
FROM `Angsuran`
WHERE tanggal_ba BETWEEN '2023-10-01' AND '2023-12-30'
GROUP BY Bulan_Tahun;