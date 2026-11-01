-- INNER & LEFT JOIN

--- Buat Table karyawan
CREATE TABLE karyawan(
    id_karyawan INT PRIMARY KEY AUTO_INCREMENT,
    nama_karyawan VARCHAR(50) NOT NULL
);

-- Buat Tabke proyek
CREATE TABLE proyek(
    id_proyek INT PRIMARY KEY AUTO_INCREMENT,
    nama_proyek VARCHAR(50) NOT NULL,
    id_karyawan INT,
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

-- tambah data karyawan
INSERT INTO karyawan(nama_karyawan) VALUES
('Alice'), ('Bob'), ('Charlie'), ('Diana');

-- tambah data proyek
INSERT INTO proyek(id_proyek, nama_proyek, id_karyawan) VALUES
(101, 'Aplikasi Mobile', 1),
(102, 'Website Portal', 1),
(103, 'Integrasi API', 2);

-- Tugas 1: INNER JOIN cari data nama.karyawan dan nama proyek
SELECT 
    k.nama_karyawan,
    p.nama_proyek
FROM karyawan k
INNER JOIN proyek p 
    ON k.id_karyawan = p.id_karyawan;

-- Tugas 2: LEFT JOIN cari data nama.karyawan dan nama.proyek tapi tampilkan semua nama.karyawan
SELECT
    k.nama_karyawan,
    p.nama_proyek
FROM karyawan k 
LEFT JOIN proyek p
    ON k.id_karyawan = p.id_karyawan;

-- Tugas 3: LEFT JOIN + WHERE IS NULL: cari data nama.karyawan dan nama.proyek yang isinya NULL
SELECT
    k.nama_karyawan,
    p.nama_proyek
FROM karyawan k 
LEFT JOIN proyek p
    ON k.id_karyawan = p.id_karyawan
WHERE p.nama_proyek IS NULL;
