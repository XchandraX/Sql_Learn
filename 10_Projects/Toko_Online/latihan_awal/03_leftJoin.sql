--- Tampilkan semua nama pelanggan (termasuk yang gak punya pesanan) beserta id_pesanan-Nya. Pakai LEFT JOIN.
SELECT p.nama, o.id_pesanan
FROM pelanggan p 
LEFT JOIN pesanan o ON p.id_pelanggan = o.id_pelanggan;


--- Tampilkan  nama pelanggan yang belum pernah pesan sama sekali.
SELECT p.nama
FROM pelanggan p 
LEFT JOIN pesanan o ON p.id_pelanggan = o.id_pelanggan
WHERE o.id_pesanan IS NULL;


--- Tampilkan daftar kota yang unik dari pelanggan.
SELECT DISTINCT kota
FROM pelanggan;