--- Tampilkan nama dan saldo pelanggan yang saldonya di atas rata-rata.
SELECT nama, saldo
FROM pelanggan
WHERE saldo > (
    SELECT AVG(saldo) FROM pelanggan
);

--- Tampilkan nama pelanggan yang belum pernah pesan. Pakai NOT IN + subquery.
SELECT nama
FROM pelanggan
WHERE id_pelanggan NOT IN (
    SELECT id_pelanggan FROM pesanan
);


--- Tampilkan nama dan saldo pelanggan yang saldonya sama degnan saldo tertinggi.
SELECT nama, saldo
FROM pelanggan
WHERE saldo = (
    SELECT MAX(saldo) FROM pelanggan
);