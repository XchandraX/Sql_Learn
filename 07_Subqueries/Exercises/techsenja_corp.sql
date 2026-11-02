-- Buat tabel karyawan
CREATE TABLE karyawan(
    id_karyawan INT PRIMARY KEY AUTO_INCREMENT,
    nama_karyawan VARCHAR(100),
    divisi VARCHAR(50) NOT NULL,
    CHECK (divisi IN ('Sales', 'IT', 'HRD')),
    gaji INT NOT NULL
);

-- Buat tael karyawan
CREATE TABLE bonus(
    id_bonus INT PRIMARY KEY,
    id_karyawan INT,
    Foreign Key (id_karyawan) REFERENCES karyawan(id_karyawan) ON DELETE RESTRICT,
    jumlah_bonus INT NOT NULL
);

-- Tambah data karyawan
INSERT INTO karyawan(nama_karyawan, divisi, gaji) VALUES
('Agus', 'Sales', 5000000),
('Budi', 'Sales', 4500000),
('Cinta', 'IT', 8000000),
('Dodi', 'IT', 7500000),
('Eka', 'HRD', 6000000);

-- Tambah data bonus
INSERT INTO bonus(id_bonus, id_karyawan, jumlah_bonus) VALUES
(101, 1, 1000000),
(102, 3, 2000000);

-- Cari rata_rata gaji dari semua karyawan
SELECT nama_karyawan, gaji
FROM karyawan
WHERE gaji > (
    SELECT AVG(gaji) 
    FROM karyawan
);

-- Cari karyawan yg tidak mendapatkan bonus
SELECT nama_karyawan
FROM karyawan
WHERE id_karyawan NOT IN (
    SELECT id_karyawan
    FROM bonus
);

-- Cari rata-rata gaji per divisi
SELECT divisi, AVG(gaji) AS rata_rata_divisi
FROM karyawan
GROUP BY divisi;

-- Lanjutan yang tadi. Cari data yang paling tinggi dari divisi tersebut 
SELECT MAX(tertinggi.rata_rata_divisi) AS divisi_tertinggi
FROM (
    SELECT divisi, AVG(gaji) AS rata_rata_divisi
    FROM karyawan
    GROUP BY divisi
) AS tertinggi;

-- Cari rata-rata gaji per divisi, tampilkan nama karyawan dari divisi itu yang di atas rata-rata
SELECT 
    karyawan_luar.nama_karyawan,
    karyawan_luar.divisi,
    karyawan_luar.gaji
FROM karyawan karyawan_luar
WHERE karyawan_luar.gaji > (
    SELECT AVG(karyawan_dalam.gaji)
    FROM karyawan karyawan_dalam

    WHERE karyawan_dalam.divisi = karyawan_luar.divisi
);