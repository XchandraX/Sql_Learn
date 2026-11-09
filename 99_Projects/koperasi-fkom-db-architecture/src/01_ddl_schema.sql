-- CREATE TABLE User
CREATE TABLE User(
    nomor_user INT PRIMARY KEY AUTO_INCREMENT,
    nama_user VARCHAR(50),
    role ENUM('Anggota', 'Petugas') DEFAULT 'Anggota',
    tanngal_gabung TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CREATE TABLE FPP
CREATE TABLE FPP(
    nomor_fpp INT PRIMARY KEY AUTO_INCREMENT,
    nomor_user_anggota INT,
    nomor_user_petugas INT,
    jumlah_permohonan DECIMAL(12, 2),
    tanggal_permohonan DATE,
    keperluan TEXT,
    status ENUM('Disetujui', 'Menunggu', 'Ditolak') DEFAULT 'Menunggu',
    Foreign Key (nomor_user_anggota) REFERENCES User(nomor_user) ON DELETE RESTRICT,
    Foreign Key (nomor_user_petugas) REFERENCES User(nomor_user) ON DELETE RESTRICT
);

-- CREATE TABLE BP
CREATE TABLE BP(
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
    Foreign Key (nomor_user_anggota) REFERENCES User(nomor_user) ON DELETE RESTRICT,
    Foreign Key (nomor_user_petugas) REFERENCES User(nomor_user) ON DELETE RESTRICT,
    Foreign Key (nomor_fpp) REFERENCES FPP(nomor_fpp) ON DELETE RESTRICT
);

-- CREATE TABLE Angsuran
CREATE TABLE Angsuran(
    nomor_ba INT PRIMARY KEY AUTO_INCREMENT,
    nomor_bp INT,
    jumlah_angsuran DECIMAL(12, 2),
    bunga DECIMAL(12, 2),
    tanggal_ba DATE,
    Foreign Key (nomor_bp) REFERENCES BP(nomor_bp) ON DELETE RESTRICT
)