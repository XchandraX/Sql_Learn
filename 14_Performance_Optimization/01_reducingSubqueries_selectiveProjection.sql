CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(50),
    kota VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    no_hp VARCHAR(20)
);

CREATE TABLE pesanan(
    id_pesanan INT PRIMARY KEY AUTO_INCREMENT,
    id_pelanggan INT,
    tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_harga DECIMAL(12, 2),
    kurir VARCHAR(20),

    Foreign Key (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

INSERT INTO pelanggan (nama, kota, email, no_hp) VALUES
('Budi Santoso', 'Jakarta', 'budi.santoso@email.com', '081234567890'),
('Siti Aminah', 'Bandung', 'siti.aminah@email.com', '082345678901'),
('Ahmad Fauzi', 'Surabaya', 'ahmad.fauzi@email.com', '083456789012'),
('Dewi Lestari', 'Yogyakarta', 'dewi.lestari@email.com', '084567890123'),
('Rian Hidayat', 'Medan', 'rian.hidayat@email.com', '085678901234'),
('Lani Wijaya', 'Semarang', 'lani.wijaya@email.com', '086789012345'),
('Bambang Pamungkas', 'Solo', 'bambang.p@email.com', '087890123456'),
('Eka Putri', 'Malang', 'eka.putri@email.com', '088901234567'),
('Rizky Pratama', 'Makassar', 'rizky.p@email.com', '089012345678'),
('Sari Utami', 'Denpasar', 'sari.utami@email.com', '081122334455');

INSERT INTO pesanan (id_pelanggan, tanggal, total_harga, kurir) VALUES
(1, '2026-11-01 10:00:00', 150000.00, 'J&T'),
(2, '2026-11-01 11:30:00', 320000.00, 'JNE'),
(3, '2026-11-02 09:15:00', 75000.00, 'SiCepat'),
(4, '2026-11-02 14:00:00', 500000.00, 'GoSend'),
(5, '2026-11-03 16:45:00', 210000.00, 'GrabExpress'),
(6, '2026-11-04 08:00:00', 95000.00, 'J&T'),
(7, '2026-11-04 13:20:00', 1250000.00, 'JNE'),
(8, '2026-11-05 19:00:00', 430000.00, 'SiCepat'),
(9, '2026-11-06 10:10:00', 60000.00, 'Anteraja'),
(10, '2026-11-07 15:30:00', 185000.00, 'J&T');


-- Kueri yang Lambat
SELECT *
FROM pesanan
WHERE id_pelanggan IN (
    SELECT id_pelanggan
    FROM pelanggan
    WHERE kota = 'Jakarta'
);

-- Optimasi Kode
-- Selective Projection
-- Optimasi Subquery
SELECT o.id_pesanan, p.nama, o.total_harga
FROM pesanan o
INNER JOIN pelanggan p ON p.id_pelanggan = o.id_pelanggan
WHERE kota = 'Jakarta';