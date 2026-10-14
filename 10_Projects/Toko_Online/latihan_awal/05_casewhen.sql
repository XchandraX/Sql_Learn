--- Tampilkan nama, saldo, dan kolom baru bernama kategori_saldo
/* dengan aturan:
- saldo >= 1.000.000 Tinggi
- saldo >= 500.000 Sedang
Selain itu Rendah */
SELECT 
nama, 
saldo,
    CASE 
        WHEN saldo >= 1000000 THEN 'Tinggi' 
        WHEN saldo >= 500000 THEN 'Sedang' 
        ELSE 'Rendah' 
    END AS kategori_saldo
FROM pelanggan;


--- Tampilkan nama dan kolom baru bernama asal_pulau 
/* dengang aturan:
- Jakarta = Jawa
- Bandung = Jawa
- Surabaya = Jawa
- Medan = Sumatra
selain itu = Lainnya */
SELECT nama, kota,
    CASE 
        WHEN kota IN ('Jakarta', 'Bandung', 'Surabaya') THEN 'Jawa' 
        WHEN kota = 'Medan' THEN 'Sumatra' 
        ELSE 'Lainnya' 
    END AS asal_pulaa
FROM pelanggan;

--- Dari hasil soal 1, hitung berapa pelanggan di tiap kategori_saldo pakai GROUP BY.
SELECT 
    CASE 
        WHEN saldo >= 1000000 THEN 'Tinggi' 
        WHEN saldo >= 500000 THEN 'Sedang' 
        ELSE 'Rendah' 
    END AS kategori_saldo,
    COUNT(*) AS jumlah
FROM pelanggan
GROUP BY kategori_saldo;