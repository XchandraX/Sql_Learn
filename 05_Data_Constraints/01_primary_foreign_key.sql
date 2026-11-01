-- Buat Tabel Induk (kategori) terlebih dahulu
CREATE TABLE kategori (
    id_kategori INT PRIMARY KEY AUTO_INCREMENT,
    nama_kategori VARCHAR(50) NOT NULL
);

-- Buat Tabel Anak (Produ) yang akan menampugn titipan KTP (Foreign Key)
CREATE TABLE produk (
    id_produk INT PRIMARY KEY AUTO_INCREMENT,
    nama_produk VARCHAR(100) NOT NULL,
    harga DECIMAL(10, 2),
    id_kategori INT, -- Siapkan kolom untuk menampung KTP
    -- Definisikan bahwa kolom ini adalah titipan dari table kategori
    FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori)
    ON DELETE RESTRICT -- Mencegah kategori dihapus jika masih ada produk yang memakainya
);