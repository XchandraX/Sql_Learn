SELECT id_pelanggan, SUM(total_belanja) AS tabel_per_user
FROM pesanan
GROUP BY id_pelanggan;

SELECT AVG(rekap_belanja.total_per_user) AS rata_rata_peneluaran
FROM (
    SELECT id_pelanggan, SUM(total_belanja) AS total_per_user
    FROM pesanan
    GROUP BY id_pelanggan
) AS rekap_belanja;

CREATE TABLE nilai_ujian(
    nama_siswa VARCHAR(50),
    mata_pelajaran VARCHAR(100),
    skor INT
);

INSERT INTO nilai_ujian(nama_siswa, mata_pelajaran, skor) VALUES
('Budi', 'Matematika', 80),
('Budi', 'Bahasa', 90),
('Siti', 'Matematika', 100),
('Siti', 'Bahasa', 100);

SELECT nama_siswa, SUM(skor) AS total_skor
FROM nilai_ujian
GROUP BY nama_siswa;

SELECT MAX(rekap_nilai.total_skor) AS nilai_tertinggi
FROM (
    SELECT nama_siswa, SUM(skor) AS total_skor
    FROM nilai_ujian
    GROUP BY nama_siswa
) AS rekap_nilai;