DROP TABLE IF EXISTS detail_pesanan;
DROP TABLE IF EXISTS pesanan;
DROP TABLE IF EXISTS produk;
DROP TABLE IF EXISTS pelanggan;

CREATE TABLE pelanggan (
    id_pelanggan BIGINT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    kota VARCHAR(50),
    bergabung_pada DATE,
    saldo DECIMAL(12, 2) DEFAULT 0,
    preferensi JSON
);

CREATE TABLE produk (
    id_produk BIGINT PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    kategori VARCHAR(50),
    harga DECIMAL(10, 2) NOT NULL,
    stok INT DEFAULT 0,
    dibuat_pada TIMESTAMP
);

CREATE Table pesanan (
    id_pesanan BIGINT PRIMARY KEY,
    id_pelanggan BIGINT NOT NULL,
    tanggal_pesanan TIMESTAMP NOT NULL,
    status VARCHAR(20) NOT NULL,
    total DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

CREATE TABLE detail_pesanan (
    id_pesanan BIGINT NOT NULL,
    id_produk BIGINT NOT NULL,
    kuantitas INT NOT NULL,
    harga_satuan DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_pesanan, id_produk),
    Foreign Key (id_pesanan) REFERENCES pesanan(id_pesanan),
    Foreign Key (id_produk) REFERENCES produk(id_produk)
);

INSERT INTO pelanggan (id_pelanggan, nama, email, kota, bergabung_pada, saldo, preferensi) VALUES
(1, 'Andi', 'andi@mail.com', 'Jakarta', '2024-01-10', 1500000.00, '{"newsletter": true}'),
(2, 'Budi', 'budi@mail.com', 'Bandung', '2024-02-15', 500000.00, NULL),
(3, 'Citra', 'citra@mail.com', 'Jakarta', '2024-03-20', 250000.00, '{"newsletter": false}'),
(4, 'Dewi', 'dewi@mail.com', 'Surabaya', '2024-04-01', 0.00, NULL);

INSERT INTO produk (id_produk, nama_produk, kategori, harga, stok, dibuat_pada) VALUES
(101, 'Laptop', 'Elektronik', 12000000.00, 10, '2024-01-01 10:00:00'),
(102, 'Mouse', 'Elektronik', 150000.00, 50, '2024-01-02 11:00:00'),
(103, 'Buku SQL', 'Buku', 200000.00, 30, '2024-01-03 12:00:00'),
(104, 'Meja', 'Furnitur', 750000.00, 5, '2024-01-04 13:00:00'),
(105, 'Keyboard', 'Elektronik', 300000.00, 20, '2024-01-05 14:00:00');

INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, status, total) VALUES
(1001, 1, '2025-01-05 10:20:00', 'SELESAI', 12150000.00),
(1002, 2, '2025-01-07 14:00:00', 'PENDING', 350000.00);

INSERT INTO detail_pesanan (id_pesanan, id_produk, kuantitas, harga_satuan) VALUES
(1001, 101, 1, 12000000.00),
(1001, 102, 1, 150000.00),
(1002, 102, 1, 150000.00),
(1002, 103, 1, 200000.00),