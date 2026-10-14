--- Tampilkan nama dan kota pelanggan yang kotanya Jakarta atau Medan.
SELECT nama, kota
FROM pelanggan
WHERE kota in ('Jakarta', 'Medan');

--- Tampilkan nama dan saldo pelanggan yang saldonya antar 300.000 dan 1.000.000
SELECT nama, saldo
FROM pelanggan
WHERE saldo BETWEEN 300000 AND 1000000;


--- Tampilkan nama pelanggan yang namanya dimulai dengan huruf A.
SELECT nama
FROM pelanggan
WHERE nama LIKE 'A%';

--- Tampilkan nama pelanggan yang namanya mengandung huruf 'i'
SELECT nama
FROM pelanggan
WHERE nama LIKE '%i%';