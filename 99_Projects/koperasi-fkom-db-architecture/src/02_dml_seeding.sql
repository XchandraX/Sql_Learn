
-- Tambah Data Anggota dan Petugas
INSERT INTO User (nama_user, role, tanggal_gabung) VALUES
('Chandra Mualana', 'Petugas', '2026-01-10 08:00:00'),
('Muamar Khadafi', 'Petugas', '2026-01-15 12:40:00'),
('De Egi', 'Anggota', '2026-02-01 09:39:38'),
('Salsabila', 'Anggota', '2026-02-05 13:00:00'),
('Anit', 'Anggota', '2026-02-06 15:30:30');

-- Tambah Data Formulir Permohonan
INSERT INTO FPP (nomor_user_anggota, nomor_user_petugas, jumlah_permohonan, tanggal_permohonan, keperluan) VALUES
(3, 1, 1000000.00, '2026-02-02', 'Biaya Kuliah'),
(4, 2, 500000.00, '2026-02-05', 'Alat-alat Kampus'),
(5, 1, 12000000.00, '2026-02-10', 'Biaya Rumah Sakit');

-- Tambah Data Bukti Peminjaman
INSERT INTO BP (nomor_user_anggota, nomor_user_petugas, nomor_fpp, tanggal_bp, jumlah_realisasi, lama_angsuran, jumlah_angsuran, bunga) VALUES
(5, 1, 3, '2026-02-12', 12000000,00, 12, 1000000.00, 150000.00);

-- Tambah Data Angsuran (Bukti Angsuran)
INSERT INTO `Angsuran`(nomor_bp, jumlah_angsuran, bunga, tanggal_ba) VALUES
(1, 1000000.00, 150000.00, '2026-03-12'),
(1, 1000000.00, 150000.00, '2026-04-12'),
(1, 1000000.00, 150000.00, '2026-05-12');
