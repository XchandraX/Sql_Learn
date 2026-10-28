SELECT nama, kota
FROM pelanggan
WHERE saldo > 400000 
ORDER  BY saldo DESC;

SELECT p.nama, o.total
FROM pelanggan p 
JOIN pesanan o ON p.id_pelanggan = o.id_pelanggan
WHERE o.status = "SELESAI" && o.total BETWEEN 200000 AND 1500000;
