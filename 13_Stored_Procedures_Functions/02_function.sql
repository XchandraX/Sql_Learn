-- Membuat Kalkulator Pajak Senja

DELIMITER $$

-- Pajak
CREATE FUNCTION HitungPajak (p_harga INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_hasil DECIMAL(10,2);

    SET v_hasil = p_harga * 0.11;

    SET v_hasil = p_harga + v_hasil;

    RETURN v_hasil;
END $$

-- Diskon
CREATE FUNCTION DiskonHarga (p_harga INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_hasil DECIMAL(10,2);

    SET v_hasil = p_harga * 0.20;

    SET v_hasil = p_harga - v_hasil;

    RETURN v_hasil;
END $$

DROP FUNCTION `HitungPajak`;

DELIMITER ;

SELECT
    nama_menu,
    harga,
    HitungPajak(harga) AS nilai_pajak,
    DiskonHarga(harga) AS diskon_harga
FROM menu_kopi;