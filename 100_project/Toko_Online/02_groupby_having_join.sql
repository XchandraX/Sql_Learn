-- GROUP BY, HAVING, JOIN

-- Hitung jumlah pesanan untuk setiap status
SELECT status, COUNT(*) as jumlah_pesanan
FROM pesanan
GROUP BY status;

-- Tampilkan nama pelanggan dan total pesanan yang statusnya SELESAI.
SELECT p.nama, o.total
FROM pelanggan p 
JOIN pesanan o ON p.id_pelanggan = o.id_pelanggan
WHERE o.status = 'SELESAI';

-- Hitung total penjualan per kategori produk dari pesanan berstatus SELESEI.
SELECT pr.kategori, SUM(dp.kuantitas * dp.harga_satuan) AS total_penjualan
FROM detail_pesanan dp
JOIN produk pr ON dp.id_produk = pr.id_produk
JOIN pesanan o ON dp.id_pesanan = o.id_pelanggan
WHERE o.status = 'SELESAI'
GROUP BY pr.kategori;

-- Tampilkan pelanggan yang total belanjanya (status SELESAI) lebih dari 1.000.000
SELECT p.nama, SUM(o.total) AS total_belanja
FROM pelanggan p 
JOIN pesanan o ON p.id_pelanggan = o.id_pelanggan
WHERE o.status = 'SELESAI'
GROUP BY p.id_pelanggan, p.nama
HAVING SUM(o.total) > 1000000;