-- "Kopi Senja" - ORDER BY & LIMIT

-- Penyortiran Tunggal
SELECT * FROM transaksi_penjualan
ORDER BY total_harga DESC;

-- Penyortiran Berlapis
SELECT * FROM transaksi_penjualan
ORDER BY kategori_produk ASC, qty DESC;

-- Top 3 Transaksi
SELECT kategori_produk, metode_bayar, total_harga 
FROM transaksi_penjualan
ORDER BY total_harga DESC
LIMIT 3;