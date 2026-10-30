-- "Kopi Senja" - Insert Select Update Delete

-- Insert
INSERT INTO katalog_produk (nama_kopi, harga, kategori, is_tersedia) 
VALUES ('Americano', 20.00, 'Kopi', TRUE);
INSERT INTO katalog_produk (nama_kopi, harga, kategori, is_tersedia) 
VALUES ('Croissant', 15.50, 'Pastry', TRUE);

-- SELECT
SELECT nama_kopi, harga FROM katalog_produk WHERE harga < 18.00;

-- UPDATE
UPDATE katalog_produk SET harga = 25.00 WHERE id_menu = 1;

-- DELETE
DELETE FROM katalog_produk WHERE kategori = 'Pastry';