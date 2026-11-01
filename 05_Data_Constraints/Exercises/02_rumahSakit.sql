CREATE TABLE pasien (
    id_pasien INT PRIMARY KEY AUTO_INCREMENT,
    nomor_ktp VARCHAR(16) NOT NULL UNIQUE,
    nama_pasien VARCHAR(100) NOT NULL,
    golongan_darah VARCHAR(2),
    CHECK (golongan_darah IN ('A', 'B', 'AB','O')),
    berat_badan DECIMAL(5, 2),
    CHECK (berat_badan > 0)
)