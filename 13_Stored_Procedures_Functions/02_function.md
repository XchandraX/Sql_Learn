# Function
Jika Stroed Procedure (`PROCEDURE`) adalah robot pekerja yang melakkukan aksi (seperti mesin kasir Kita), maka Function (`FUNCTION`) adalah sebuah kalkulator pintar.

Kita membuat `FUNCTION` ketika Kita memiliki sebuah rumus rumit yang sering Kita pakai berulang-ulang di dalam kueri SELECT. Daripada menulis rumusnya berulang-ulang kali, Kita menyimpanya sebagai Function dna memanggilnya sesuka hati.

Aturan Emas Function:
1. WAJIB menghasilkan (Return) SATU nilai saja. (Tidak boleh mencetak tabel).
2. DILARANG keras mengubah data tabel. (Tidak boel hada `INSERT`, `UPDATE`, `DELETE` di dalam Function. Hanya boleh kalkulasi/membaca).
3. Dipanggil langsung di dalam kueri `SELECT`, bukan menggunakan `CALL`

## Sintaks Dasar:


``DELIMITER $$

CREATE FUNCTION nama_fungsi (p_input TIPE_DATA)
RETURNS TIPE_DATA_HASIL
DETERMINISTIC -- (Wajib di MySQL: artinya jika inputnya sama, hasilnya pasti sama)
BEGIN
    DECLARE v_hasil TIPE_DATA_HASIL;

    -- Lakukan perhitungan kita di sini
    SET v_hasil = p_input * 10;

    RETURN v_HASIL; -- Nilai yang dikelurkan
END $$

DELIMITER ;``
