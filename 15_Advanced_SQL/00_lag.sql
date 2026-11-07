SELECT 
    id_pesanan, 
    tanggal, 
    total_harga AS transaksi_barang,
    LAG(total_harga) OVER (ORDER BY tanggal ASC) AS transaksi_sebelumnya
FROM pesanan;
