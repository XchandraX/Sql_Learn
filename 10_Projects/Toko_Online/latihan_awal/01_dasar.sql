--- Tulis query untuk ambil sesmua kolom dari sheet pelanggan.

SELECT *
FROM pelanggan;


--- Tulis query untuk ambil cuma naam dan kota.
SELECT nama, kota
FROM pelanggan;


--- Tulis query untuk ambil pelanggan yang kotannya Jakarta.
SELECT *
FROM pelanggan
WHERE kota = 'Jakarta';


-- Ambil nama dan saldo dari pelanggan yang saldo lebih dari 400000.
SELECT nama, saldo
FROM pelanggan
WHERE saldo > 400000;


--- Ambil semua kolom pelanggan bukan dari Jakarta
SELECT *
FROM pelanggan
WHERE kota != 'Jakarta';


--- Ambil nama saja, urutkan berdasarkan saldo dari yang terbesar ke terkecil.
SELECT nama, saldo
FROM pelanggan
ORDER BY saldo DESC;