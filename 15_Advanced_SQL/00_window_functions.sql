SELECT 
    p.nama, 
    o.tanggal, 
    o.total_harga, 
    RANK() OVER (ORDER BY o.total_harga DESC) AS peringkat_belanja
FROM pesanan o
INNER JOIN pelanggan p ON p.id_pelanggan = o.id_pelanggan;