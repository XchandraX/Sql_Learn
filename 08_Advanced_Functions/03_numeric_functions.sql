-- ubah database dulu ke SenjaCommerce

-- Buat Tabel produk
CREATE TABLE produk(
    id_produk INT PRIMARY KEY AUTO_INCREMENT,
    nama_produk VARCHAR(50),
    rating DECIMAL(3,2),
    CHECK (rating > 0),
    stok INT,
    CHECK (stok >= 0)
);


INSERT INTO produk (nama_produk, rating, stok) VALUES
('Kopi Bubuk', 4.35, 50),
('Gula Aren', 4.89, 15),
('Susu Oat', 3.12, 100);

SELECT
    nama_produk,
    ROUND(rating) AS rating_bulat,
    CEIL(rating) AS rating_maksimal,
    FLOOR(rating) AS rating_minimanl,
    MOD(stok, 12) AS barang_sisa
FROM produk;

SELECT
    nama_produk,
    CASE 
        WHEN stok <= 20 THEN  'Stok Menipis - Segera Restock!'
        ELSE 'Stok Aman' 
    END AS status_stok,
    CASE 
        WHEN rating >= 4.5 THEN 'Super Quality'
        WHEN rating >= 4.0 THEN'Good Quality'
        ELSE 'Needs Improvement'
    END AS kualitas
FROM produk;