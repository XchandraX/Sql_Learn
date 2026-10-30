--- Membuat tabel baru bernama 'karyawan'
CREATE TABLE karyawan (
    id_karyawan INT PRIMARY KEY AUTO_INCREMENT, -- Di PostgreSQL gunakan SERIAL
    nama_lengkap VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    status_aktif BOOLEAN DEFAULT TRUE,
    gaji_pokok DECIMAL(10, 2),
    tanggal_gabung DATE
);