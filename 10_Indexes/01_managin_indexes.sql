-- Active: 1793677744104@@127.0.0.1@3306@SenjaCommerce
CREATE TABLE transaksi_historis (
    id_transaki INT PRIMARY KEY,
    id_pelanggan INT,
    tanggal_transaksi DATE,
    metode_bayar VARCHAR(50),
    total_belanja DECIMAL(12, 2)
);

INSERT INTO transaksi_historis (id_transaki, id_pelanggan, tanggal_transaksi, metode_bayar, total_belanja) VALUES
(1, 103, '2026-01-02', 'Transfer Bank', 150000.00),
(2, 142, '2026-01-05', 'E-Wallet', 45500.00),
(3, 115, '2026-01-07', 'Kartu Kredit', 1250000.00),
(4, 189, '2026-01-10', 'COD', 89000.00),
(5, 122, '2026-01-12', 'Transfer Bank', 320000.00),
(6, 105, '2026-01-15', 'E-Wallet', 75000.00),
(7, 164, '2026-01-18', 'Kartu Debit', 450000.00),
(8, 131, '2026-01-20', 'COD', 120000.00),
(9, 150, '2026-01-22', 'Transfer Bank', 675000.00),
(10, 111, '2026-01-25', 'E-Wallet', 28500.00),
(11, 173, '2026-01-28', 'Kartu Kredit', 2100000.00),
(12, 195, '2026-02-01', 'COD', 55000.00),
(13, 102, '2026-02-03', 'Transfer Bank', 850000.00),
(14, 147, '2026-02-05', 'E-Wallet', 135000.00),
(15, 158, '2026-02-08', 'Kartu Debit', 240000.00),
(16, 119, '2026-02-11', 'COD', 95000.00),
(17, 182, '2026-02-14', 'Transfer Bank', 115000.00),
(18, 136, '2026-02-16', 'E-Wallet', 62000.00),
(19, 109, '2026-02-19', 'Kartu Kredit', 3450000.00),
(20, 177, '2026-02-22', 'Kartu Debit', 180000.00),
(21, 125, '2026-02-25', 'COD', 73000.00),
(22, 140, '2026-02-27', 'Transfer Bank', 525000.00),
(23, 169, '2026-03-02', 'E-Wallet', 99000.00),
(24, 113, '2026-03-05', 'Kartu Kredit', 1750000.00),
(25, 155, '2026-03-08', 'COD', 42000.00),
(26, 199, '2026-03-10', 'Transfer Bank', 310000.00),
(27, 104, '2026-03-13', 'E-Wallet', 15000.00),
(28, 138, '2026-03-16', 'Kartu Debit', 620000.00),
(29, 161, '2026-03-19', 'COD', 110000.00),
(30, 185, '2026-03-22', 'Transfer Bank', 430000.00),
(31, 120, '2026-03-25', 'E-Wallet', 88500.00),
(32, 144, '2026-03-28', 'Kartu Kredit', 950000.00),
(33, 172, '2026-04-01', 'COD', 67000.00),
(34, 107, '2026-04-03', 'Transfer Bank', 125000.00),
(35, 152, '2026-04-06', 'E-Wallet', 54000.00),
(36, 190, '2026-04-09', 'Kartu Debit', 380000.00),
(37, 116, '2026-04-12', 'COD', 105000.00),
(38, 163, '2026-04-15', 'Transfer Bank', 720000.00),
(39, 134, '2026-04-18', 'E-Wallet', 23000.00),
(40, 178, '2026-04-21', 'Kartu Kredit', 4200000.00),
(41, 101, '2026-04-24', 'Kartu Debit', 195000.00),
(42, 149, '2026-04-27', 'COD', 83000.00),
(43, 188, '2026-04-30', 'Transfer Bank', 560000.00),
(44, 127, '2026-05-02', 'E-Wallet', 112000.00),
(45, 159, '2026-05-05', 'Kartu Kredit', 850000.00),
(46, 110, '2026-05-08', 'COD', 35000.00),
(47, 166, '2026-05-11', 'Transfer Bank', 290000.00),
(48, 133, '2026-05-14', 'E-Wallet', 47000.00),
(49, 192, '2026-05-17', 'Kartu Debit', 510000.00),
(50, 106, '2026-05-20', 'COD', 125000.00);


CREATE INDEX idx_pelanggan ON transaksi_historis (id_pelanggan);

CREATE INDEX idx_tanggal ON transaksi_historis (tanggal_transaksi);

EXPLAIN SELECT * 
FROM transaksi_historis
WHERE id_pelanggan = 177;

SELECT *
FROM transaksi_historis
WHERE tanggal_transaksi BETWEEN '2026-04-01' AND '2026-04-15';

