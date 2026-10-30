-- "Kopi Senja" - GROUP BY & HAVING

-- Create
CREATE TABLE transaksi_penjualan(
    id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
    kategori_produk VARCHAR(50) NOT NULL,
    metode_bayar VARCHAR(50) NOT NULL,
    qty INT NOT NULL,
    total_harga DECIMAL(50, 2)
);

-- dummby
INSERT INTO transaksi_penjualan (kategori_produk, metode_bayar, qty, total_harga) VALUES
('Kopi', 'Qris', 2, 50000.00),
('Pastry', 'Cash', 1, 28000.00),
('Teh', 'Debit', 1, 18000.00),
('Kopi', 'Qris', 3, 85000.00),
('Pastry', 'Qris', 2, 56000.00),
('Kopi', 'Cash', 1, 25000.00),
('Teh', 'Cash', 2, 36000.00),
('Kopi', 'Debit', 4, 110000.00),
('Pastry', 'Debit', 1, 30000.00),
('Kopi', 'Qris', 2, 52000.00);


-- GROUP BY tunggal
SELECT kategori_produk, SUM(total_harga)
FROM transaksi_penjualan
GROUP BY kategori_produk;

-- WHERE + GROUP BY
SELECT kategori_produk, SUM(qty)
FROM transaksi_penjualan
WHERE metode_bayar = 'Qris'
GROUP BY kategori_produk;

-- GROUP BY + HAVING
SELECT metode_bayar, SUM(total_harga)
FROM transaksi_penjualan
GROUP BY metode_bayar
HAVING SUM(total_harga) > 200000; -- Aku ubah jadi 200rb karena di dummby paling tinggi hanya 243000(bagian Qris)