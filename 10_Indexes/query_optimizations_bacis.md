# Primary Key Vs Index
Kita bertanya, "B|ukankah Primary Key otomatis cepat dicari?"
Ya, Benar sekali!

Secara default, semua sistem database (MySQL, PostgreSQL, SQL Server) akan secara otomatis membuat Index untuk setiap kolom yang ditetapkan sebagai `PRIMARY KEY`. Index bawaan ini disebuat Clustered Index. Kita tidak perlu repot membuat `CREATE INDEX` lagi untuk kolomg PK.

Namun, untuk kolom lain seperti lainnya, Kita tetap wajib membuat Non-Clustered Index secara manual sepert yang baru saja Kita lakkukan.

# Composite Index (Index Ganda)
Bagiamana jika tim Analis paling sering mencari data dengan dua filter sekaligus? `SELECT * FROM transaksi_historis WHERE id_pelanggan = 142 AND tanggal_transaksi BETWEEN ... AND ...`

Memiliki dua index terpisah (idx_pelanggan dan idx_tanggal) sudah bagus. Namun, mesin SQL bisa lebih cepat lagi jika Kita membuatka satu "Buku Indeks Khusus" yang mengurutkan data berdasarkan Pelanggan DULU, baru Kemundian Tanggalnya. Ini disebut Composite Index.

Sintaks:
`CREATE INDEX idx_pelanggan_tanggal ON transaksi_historis (id_pelanggan, tanggal_transaksi);`

(Catatan urutan sangat penting: kolom yang filter-nya paling spesifik/sering digunakan harus ditaruh di depan).

# EXPLAIN
`EXPLAIN` adlaah fitur bawaan SQL untuk "Mengintip rencana mesin SQL sebelum ia mengeksekusi kuerinya"

Tabel hasil `EXPLAIN` itu adalah laporan rahasia mesin SQL tentang "bagaimana cara ia merencanakan pencarian data" sebelum benar-benar mengeksekusinya.

3 kolom terpenting yang ada:
1. `possible_keys` (Kandidat Buku Indeks):
Kolom ini menamplikan Index apa saja yang bisa dipakai oelh mesin SQL untuk mempermudahkan tugas ini.
- Karena Kita mencari `id_pelanggan = 177`, mesim melihat ada index `idx_pelanggan` yang tersedia, maka nama itu akan muncul di sini. (Ada satu kolom lagi bernama `key`, yang berisi index mana yang pada akhirnya benar-benar dipilih oleh mesin).

2. `type` (metode Pencarian - Rapor Kinerja Kita)
ini adalah kolom paling krusial! Kolom ini menunjukkan seberapa efisien SQL mencari data.
- `All`: Sinyal bahaya! Ini berarti Full Table Scan. Mesin terpaksa membaca buku dari halaman 1 sampai selesai karena tidak ada Index.
- `ref` atau `const`: Sukses besar! Ini berarti Index Seek. mesin langsugn melompat ke halaman yang tepat menggunakan Index
- `range`: Muncul ketika Kita mencari rentang data (seperti menggunakan `BETWEEN` tanggal awal dan akhir).

3. `rows` (Baris yang Harus Dibaca - Bukti Efisiensi)
Ini adalah angka estimasi berapa banyak data yang harus "disentuh" oleh mesin untuk menemukan hasil kueri Kita.
- Jika kita men-`DROP` (menghapus) index `idx_pelanggan` dan menjalankan `EXPLAIN` lagi, nilai rows akan menunjukkan 50 
- Namun karena Kita menggunakan Index, nilai rows kemungkinan besar hanya 1. Bayangkan jika datanya ada 50 juta! Angka `rows` ini yang membuktikan kueri Kita secepat kilat.

