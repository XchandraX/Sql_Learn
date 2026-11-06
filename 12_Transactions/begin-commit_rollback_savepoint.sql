-- Active: 1793677744104@@127.0.0.1@3306@SenjaBank
CREATE TABLE rekening (
    id_nasabah INT PRIMARY KEY,
    nama VARCHAR(50),
    saldo INT
);

INSERT INTO rekening VALUES
(1, 'Andi', 500000),
(2, 'Budi', 100000);

-- Andi mentransfer uang sebesar 200.000 kepada budi
START TRANSACTION;
UPDATE rekening SET saldo = saldo - 200000 WHERE id_nasabah = 1;
UPDATE rekening SET saldo = saldo + 200000 WHERE id_nasabah = 2;

SAVEPOINT transfer_selesai;
UPDATE rekening SET saldo = saldo - 50000 WHERE id_nasabah = 2;

SELECT * FROM rekening;

COMMIT;

ROLLBACK TO transfer_selesai;

TRUNCATE Table rekening;


-- 