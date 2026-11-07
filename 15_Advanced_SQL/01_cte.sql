WITH RankingPelanggan AS (
    SELECT 
        p.nama, 
        o.total_harga, 
        ROW_NUMBER() OVER (ORDER BY o.total_harga DESC) AS peringkat_belanja
    FROM pesanan o
    INNER JOIN pelanggan p ON p.id_pelanggan = o.id_pelanggan
)
SELECT * 
FROM RankingPelanggan
WHERE peringkat_belanja = 1;
