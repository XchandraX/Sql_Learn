-- Active: 1793677744104@@127.0.0.1@3306@SenjaCommerce

-- Membuat Akun Budi manang
CREATE USER 'budi_magang'@'localhost' IDENTIFIED BY 'KucingOren123!';

-- GRANT SELECT
GRANT SELECT ON SenjaCommerce.transaksi_historis TO 'budi_magang'@'localhost';

-- GRANT LANJUTAN (UPDATE, INSERT)
GRANT UPDATE, INSERT ON SenjaCommerce.transaksi_historis To 'budi_magang'@'localhost';

-- REVOKE 
REVOKE ALL ON SenjaCommerce.transaksi_historis FROM 'budi_magang'@'localhost';

DROP USER 'budi_magang'@'localhost';