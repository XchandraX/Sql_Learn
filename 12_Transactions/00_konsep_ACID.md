# HUKUM A.C.I.D
    Sebuah sistem transaksi yang baik harus menjamin 4 hal ini (ACID):
1. Atomicity (Satu Kesatuan/Tidak Bisa Dibelah): Aturan "All or Nothing". Jika Kita mentransfer uang (Saldo Kita berkurang, saldo teman bertambah), kedua proses ini adalah SATU atom. Jika proses menambah saldo teman gagal karena mati lampu, maka proses mengurangi saldo Kita HARUS batal otomatis. Tidak boleh ada transaksi yang sukses setengah.
2. Consistency (Konsistensi): Transaksi tidak boleh melanggar hukum database (seperti `CHECK (stock >= 0)`). Jika sebuah transaksi membuat stonk jadi minus, sistem akan membatalkannya.
3. Isolation (Isolasi): Seperti yang ktia bahas di masalah Dirty Read, transaksi yang sednag berjalan tidak boleh diganggu atau diintip oleh kueri lain sampai ia benar-benar selesai.
4. Durability (Daya Tahan/Permanen): SEkali Kita menekan tombol "Resmi" (COMMIT), data itu akan tersimpan di hard disk secara permanen, bahkan jika detik berikutnya server terbakar atau meledak.

## Cara menggunakan Transaksi (BEGIN, COMMIT, ROLLBACK)
Secara bawaan (default), setiap Ktia mengetik `INSERT` atau `UPDATE`, MySQL akan otomatis melakukan "Auto-Commit" (meresmikannya detik itu juga).
Untuk mematikan "Auto-Commit" dan mengambil kendali penuh. Kita menggunakan tiga perintah ajaib:
- `START TRANSACTION;` (atau `BEGIN`): "Hai SQL, tahan dulu ya. Apapun yang saya ketik setelah ini, jadikan data bayangan dulu, jangan disimpan permanen"
- `COMMIT`: "Oke, SQL semua kuerikuk lancar dan aman. Resmikan ke dalam hard disk sekarang!"
- `ROLLBACK`: "Gawat SQL, ada yang salah! Batalkan semua kueri sejak saya mengetik `START TRANSACTION` tadi. Kembalikan tabel ke kondisi semula!"