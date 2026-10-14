--- DML, DDL, TCL

--- Kurangi stok produk 101 sebanyak 1, tetapi hanya jika stok masih tersedi. Gunakana transakis.
UPDATE produk
SET stok = stok -1
WHERE id_produk = 101
    AND stok > 0;

COMMIT;
-- Jika gagal: ROLLBACK;


--- Tambahkan kolom telepon VARCHAR(20) ke table pelanggan, lalu hapus kolom tersebut
ALTER TABLE pelanggan ADD COLUMN telepon VARCHAR(20);

ALTER TABLE pelanggan MODIFY telepon VARCHAR(30);

ALTER TABLE pelanggan DROP COLUMN telepon;


--- Tampilkan pelanggan yang kolom preferensi-nya NULL.
SELECT *
FROM pelanggan
WHERE preferensi IS NUll;