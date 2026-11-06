# Stored Procedure
Kita wajib mengetahui Satu Rahasia Penting MySQL: `DELIMITER`.

Saat Kita mengetik kueri biasa,, Kita mengakhirinya dengan titik koma (;). Masalahnya, di dalam Stored Procedure, Kita akan menulis banyak kueri dengan banyak titik koma. Jika Kita tidak mengubah aturan bacanya, MySQL akan mengira SP Kita sudah selesai di titik koma pertama dan menghasilkan error.

Solusinya: Kita ubah sementara tanda penutupnya dari `;` menjadi `$$` (atau simbol lain), lalu kembalikan lagi setelah SP selesai dibuat.

``DELIMITER $$ -- Ubah tanda penutup jadi $$
CREATE PROCEDURE nama_prosedur (IN paramter1 TIPE_DATA)
BEGIN
    -- Masukkan kueri-kueri Kita di sini (tetep pakai ;)
END $$

DELIMITER ;``

--- 
## Lanjutan
Kekuatan sejati Stored Procedure baru keluar saat kita menambahkan "Otak"(Logika Pemrograman) ke dalamnya.

Di sinilah Kita bisa menggunakan Variable (`DECLARE`), menyedot data dari tabel ke variable tersebut (`SELECT data_table INTO`), dan membuat keputusan (`IF-THEN-ELSE`)