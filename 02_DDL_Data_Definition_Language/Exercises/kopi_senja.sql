-- "Kopi Senja"


-- Buat sebuah tabel menu_kopi
CREATE TABLE menu_kopi(
    id_menu INT PRIMARY KEY AUTO_INCREMENT,
    nama_kopi VARCHAR(50) NOT NULL,
    harga INT NOT NULL,
    is_tersedia BOOLEAN DEFAULT TRUE
);

-- Alter
ALTER TABLE menu_kopi
RENAME TO katalog_produk;

ALTER TABLE katalog_produk
ADD COLUMN kategori VARCHAR(30);

-- ALTER
ALTER TABLE katalog_produk
MODIFY harga DECIMAL(8, 2);

-- TRUNCATE & DROP
TRUNCATE TABLE table_coba_coba;

DROP TABLE IF EXISTS table_coba_coba;