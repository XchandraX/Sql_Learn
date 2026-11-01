-- SELF JOIN

CREATE TABLE hierarki_karyawan (
    id_karyawan INT PRIMARY KEY,
    nama_karyawan VARCHAR(50),
    id_atasan INT
);

INSERT INTO hierarki_karyawan (id_karyawan,nama_karyawan, id_atasan) VALUES
(1, 'Mr. CEO', NULL),
(2, 'Alice (Manajer)', 1),
(3, 'Bob (Staf)', 2),
(4, 'Charlie (Staf)', 2);


-- Tugas 1: INNER SELF JOIN
SELECT
    a.nama_karyawan, b.id_karyawan
FROM hierarki_karyawan a
INNER JOIN hierarki_karyawan b ON a.id_atasan = b.id_karyawan;

SELECT
    a.nama_karyawan, b.id_karyawan
FROM hierarki_karyawan a
LEFT JOIN hierarki_karyawan b ON a.id_atasan = b.id_karyawan;

