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

-- Melihat siapa yang bayar angsuran beserta nama petugas yang dulu memproses pinjamannya
SELECT 
    a.tanggal_ba, 
    u_anggota.nama_user AS nama_peminjam, 
    a.jumlah_angsuran, 
    u_petugas.nama_user AS petugas_approval
FROM Angsuran a
JOIN BP b ON a.nomor_bp = b.nomor_bp
JOIN User u_anggota ON b.nomor_user_anggota = u_anggota.nomor_user
JOIN User u_petugas ON b.nomor_user_petugas = u_petugas.nomor_user;