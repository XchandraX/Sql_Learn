-- Tulis query untuk menampilkan nama dan id_pesanan, dengan menggabungkan sheet pelanggan dan pesanan
SELECT p.nama, o.id_pesanan
FROM pelanggan p
JOIN pesanan o ON p.id_pelanggan = o.id_pelanggan;

--- Tampilkan nama(pelanggan) dan total(pesanan), tapi cuma untuk pesanan di atas 500.000
SELECT p.nama, o.total
FROM pelanggan p
JOIN pesanan o ON p.id_pelanggan = o.id_pelanggan
WHERE o.total > 5000000;

--- Tampilkan nama pelanggan dan COUNT (jumlah pesanan) mereka. Kasih nama kolomnya jumlah_pesanan.
SELECT p.nama, COUNT(*) AS jumlah_pesanan
FROM pelanggan p 
JOIN pesanan o ON p.id_pelanggan = o.id_pelanggan
GROUP BY p.nama;

--- Tampilkan nama pelanggan dan total belanjannya (SUM), tapi hanya pelanggan yang total belanjannya di atas 500.000
SELECT p.nama, SUM(o.total) AS total_belanja
FROM pelanggan p 
JOIN pesanan o ON p.id_pelanggan = o.id_pelanggan
GROUP BY p.nama
HAVING SUM(o.total) > 500000;


-- Tampilkan nama dan kota pelanggan yang kotanya bukan Jakarta.
SELECT nama, kota
FROM pelanggan
WHERE kota != 'Jakarta';

--- Tampilkan nama pelanggan dan total pesanannya, hanya untuk pesanan yang statusnya 'SELESAI'
SELECT p.nama, o.total
FROM pelanggan p 
JOIN pesanan o ON p.id_pelanggan = o.id_pelanggan
WHERE o.status = 'SELESAI';

--- Tampilkan nama pelanggan dan jumlah pesanan mereka (COUNT), hanya untuk pelanggan yang punya lebih dari 1 pesanan.
SELECT p.nama, COUNT(*) AS jumlah_pesanan
FROM pelanggan p 
JOIN pesanan o ON p.id_pelanggan = o.id_pelanggan
GROUP BY p.nama
HAVING COUNT(*) > 1;