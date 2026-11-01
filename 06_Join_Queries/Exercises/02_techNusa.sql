-- RIGHT & FULL OUTER JOIN

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

INSERT INTO proyek(id_proyek, nama_proyek, id_karyawan) VALUES
(104, 'Proyek Rahasia', NULL);

-- Tugas 1: RIGHT JOIN cari data nama.karyawan dan nama.proyek tapi tampilkan semua nama.proyek
SELECT k.nama_karyawan, p.nama_proyek
FROM karyawan k
RIGHT JOIN proyek p ON k.id_karyawan = p.id_karyawan;

-- Tugas 2: FULL OUTER JOIN
SELECT k.nama_karyawan, p.nama_proyek
FROM karyawan k
LEFT JOIN proyek p ON k.id_karyawan = p.id_karyawan
UNION 
SELECT k.nama_karyawan, p.nama_proyek
FROM karyawan k
RIGHT JOIN proyek p ON k.id_karyawan = p.id_karyawan;
