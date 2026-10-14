--- Subquery, EXISTS, Set Operations

--- Cari pelanggan yang belum pernah membuat pesanan.
SELECT *
FROM pelanggan p
WHERE NOT EXISTS (
    SELECT 1 FROM pesanan o
    WHERE o.id_pelanggan = p.id_pelanggan
);


--- Cari produk yang belum pernah dipesan
SELECT * 
FROM produk pr
WHERE NOT EXISTS (
    SELECT 1 FROM detail_pesanan dp
    WHERE dp.id_produk = pr.id_produk
)


--- Guanakn UNION ALL untuk menggabungkan daftar kota pelanggan dan kategori produk.
SELECT kota AS nilai FROM pelanggan
UNION ALL 
SELECT kategori AS nilai FROM produk;