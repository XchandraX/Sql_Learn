-- Active: 1793677744104@@127.0.0.1@3306@KopiSenja
CREATE TABLE menu_kopi (
    id_menu INT PRIMARY KEY,
    nama_menu VARCHAR(50),
    harga INT,
    stok INT
);

INSERT INTO menu_kopi VALUES
(1, 'Kopi Susu Senja', 20000, 50),
(2, 'Americano', 15000, 10);

DELIMITER $$

CREATE PROCEDURE RestockKopi (p_id INT, p_tambahan INT)
BEGIN
    UPDATE menu_kopi SET stok = stok + p_tambahan WHERE id_menu = p_id;
END $$

DELIMITER ;

CALL RestockKopi(1, 50);

SELECT * FROM menu_kopi;


-- Soal ke dua

DELIMITER $$

CREATE PROCEDURE JualKopi (p_id INT, p_jumlah_beli INT)
BEGIN

DECLARE v_stok INT;
SELECT stok INTO v_stok FROM menu_kopi WHERE id_menu = p_id;

IF v_stok >= p_jumlah_beli THEN
    UPDATE menu_kopi SET stok = stok - p_jumlah_beli WHERE id_menu = p_id;
    SELECT 'Transaksi Berhasil' AS status;

ELSEIF p_jumlah_beli >= 100 THEN
    SELECT 'Jumlah Beli terlalu banyak!' AS status;

ELSE 
    SELECT 'Stok Tidak Cukup' AS status;
END IF;

END $$

DROP PROCEDURE `JualKopi`;
DELIMITER ;

CALL JualKopi(1, 50);
CALL JualKopi(2, 100);

SELECT * FROM menu_kopi;