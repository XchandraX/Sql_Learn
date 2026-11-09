-- ====================================================================
-- STORED PROCEDURE: BuatBuktiPinjaman
-- Description: Mengotomatisasi pembuatan Bukti Pinjaman (BP).
-- Logic: Mengecek sisa hutang menggunakan Transaction. Jika masih ada
--        hutang 'Belum Lunas', sistem akan melakukan ROLLBACK.
-- ====================================================================

DELIMITER $$

CREATE PROCEDURE BuatBuktiPinjaman(
    p_nomor_fpp INT,
    p_nomor_user_anggota INT,
    p_nomor_user_petugas INT,
    p_jumlah_realisasi DECIMAL(12, 2),
    p_lama_angsuran INT,
    p_jumlah_angsuran DECIMAL(12, 2),
    p_bunga DECIMAL(12, 2)
)
BEGIN
    DECLARE v_cek_hutang INT DEFAULT 0;

    START TRANSACTION;

    SELECT COUNT(*) INTO v_cek_hutang
    FROM BP
    WHERE nomor_user_anggota = p_nomor_user_anggota AND status_pinjaman = 'Belum Lunas';

    IF v_cek_hutang > 0 THEN
        ROLLBACK;
        SELECT 'Penolakan: Anggota masih memiliki pinjaman yang belum lunas.' AS informasi;
    ELSE
        INSERT INTO BP(nomor_fpp, nomor_user_anggota, nomor_user_petugas, tanggal_bp, jumlah_realisasi, lama_angsuran, jumlah_angsuran, bunga) VALUES
        (p_nomor_fpp, p_nomor_user_anggota, p_nomor_user_petugas, CURDATE(), p_jumla_realisasi, p_lama_angsuran, p_jumlah_angsuran, p_bunga);

        UPDATE FPP SET status = 'Disetujui' WHERE nomor_fpp = p_nomor_fpp;

        COMMIT;
        SELECT 'Pinjaman Berhasil Direalisasikan.' AS informasi;
    END IF:
END $$

CALL BuatBuktiPinjaman(2, 4, 1, 10000000.00, 10, 1000000.00, 150000.00);
