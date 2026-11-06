# Stored Procedures & Functions
Kita bisa menanamkan logika programming (Varibel, `IF-THEN-ELSE`, `WHILE LOOP`, dan `TRY-CATCH`) langsung di dalam mesin database itu sendiri!

## Apa Bedanya Stored Procedure dan Function
    Banyak orang bingung membedakan keduannya, tapi konsepnya sederhana.
1. Function (Fungsi Khusus):
- Fokus: Menghasilkan SATU NILAI (Return Value).
- Sifat: Mirip seperti fungsi bawaan `SUM()` atau `CONCAT()`.
- Penggunaan: Dipanggil di dalam kueri `SELECT`.
- Contoh Kasus: Kita membuat fungsi `HitungDiskon()`. Lalu Kita bisa memanggilnya begini: `SELECT nama_barang, HitungBarang(harga) FROM produk;`

2. Stored Procedure (Prosedur Eksekusi):
- Fokus: Melakukan AKSI/TUGAS (Action). Bisa Insert, Update, Delete, mencetak tabel, dan bisa punya banyak output (atau tidak ada output sama sekali).
- Sifat: Seperti sebuah mini-program atau script otomatisasi.
Penggunaan: Dipanggil secara mandiri menggunakan perintah CALL.
- Contoh Kasus: Ktia membuat procedure bernama `ProsesCheckout(id_pelanggan)`. Saat mengetik `CALL ProsesCheckout(123);`, mesin SQL akan otomatis mengecek stok, memotong saldo E-Wallet (menggunakan Transaction), dan memasukkan data ke tabel pengiriman sekaligus!