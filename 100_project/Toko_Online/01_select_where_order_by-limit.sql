-- SELECT, WHERE, ORDER BY, LIMIT

-- Tampilkan nama, kota, dna saldo pelanggan yang berasal dari jakarta.
SELECT nama, kota, saldo 
FROM pelanggan
WHERE kota = 'Jakarta';

-- Tampilkan produk dengan harga antara 100.000 sampai 500.000, urutkan dari harga tertinggi.
SELECT nama_produk, harga
FROM produk
WHERE harga BETWEEN 100000 AND 500000
ORDER BY harga DESC;

-- Tampilkan 2 pesanan terbaru berdasarkan tanggal_pesanan.
SELECT *
FROM detail_pesanan
ORDER BY tanggal_pesanan DESC
LIMIT 2;