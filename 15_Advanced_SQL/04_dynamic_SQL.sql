SET @tabel = 'rekap_penjualan';

SET @kueri_dinamis = CONCAT('SELECT * FROM ', @tabel);

PREPARE stmt FROM @kueri_dinamis;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;