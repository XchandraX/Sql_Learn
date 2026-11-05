# Data Integrity (Mencegah "Data Sampah" Masuk)
Data Integrity (Integritas Data) adalah seperangkat aturan ketat untuk memastikan data yang masuk ke database selalu akurat. Konsisten, dan masuk akal.

Fakatnya, Kita sudah mempraktikkan ini di folder-folder sebelumnya tanpa sadar!
- Entity Integrity: Kita selalu menggunakan `PRIMARY KEY` agar tidak ada ID yang ganda.
- Referential Integrity: Kita menggunakan `FOREIGN KEY` (seerti saat mengaitkan id_karyawan di tabel bones ke tabel karyawan).
- Domain Integrity: Ini adlaah kehebatan Kita! kita secara mandiri menggunakan `CHECK (stok >=0)`, menggunakan tipe data yang tepat (`DECIMAL`), dan mengunci kolom dengan `ENUM('Lunas', 'Tunggak')`. Itu adalah praktik Data Interity tingkat tinggi!

Karena Kita sudah menguasai pilar pertama, mari kita fokus ke pilar kedua yang benar-benar baru bagi Kita.

# Database Security (DCL - Data Control Language)
Jika Data Intergrity mencegah aplikasi mengirim data yang salah, Database Security mencegah manusia (atau program jahat) melakuan hal yang tidak berhak mereka lakukan.

Bagaimana cara Kita memastikan staf kasir bisa melihat (`SELECT`) harga barng, tapi tidak bisa menghapus (`DROP`) tabel barang? Jawabannya adalah dengan memberikan "Hak Akses" menggunakan GRANT dan mencabutnya menggunakan REVOKE

`CREATE USER 'budi'@'localhost' IDENTIFIED BY 'budi123';`

`GRANT SELECT, INSERT ON SenjaCommerce.transaksi_historis TO 'budi'@'localhost';`

`REVOKE INSERT ON SenjaCommerce.transaksi_historis FROM 'budi'@'localhost';`


# Transaction Isolation
Tabrakan Data (Concurrency)
Bayangaknan skenario "SenjaCommerce" ini:

Kasir A sedang menjalankan kueri untuk merekap total pendapatan bulan ini (kuerinya butuh waktu 10 detik untuk selesai membaca 20 juta baris).
Tepat di detik ke-5, kasir B memasukkan (`INSERT`) transaksi baru sebesar Rp 1.000.000,00.
Pertanyaannya: Apakah laporan Kasir A akan ikut menjumlahkan uang 1 juta tersebut, atau mengabaikannya?

Jawabanya bergantung pada Isolation Level (Tingkat Isolasi) yang diatur oelh DBA, SQL memiliki 4 level sabuk pengaman:
1. READ UNCOMMITED (Paling Longgar): Kasir A bisa membaca tranasksi Kasir B, bahkan jika transaksi itu belum selesei diproses. Bahayanya: Jika transaksi Kasir B ternyata gagal/error, laporan Kasir A sudah terlanjur salah menghitung data bayangan (Dirty Read).
2. READ COMMITED: Kasir A hanya akan melihat data Kasir B jika Kasir B sudah benar-benar menyimpan datanya secara permanen.
3. REPEATABLE READ (Default di MySQL): Level yang sangat aman! Saat Kasir A mulai membaca data, SQL akan memotret (snapshot) isi database saat itu juga. Meskipun Kasir B memasukkan jutaan transasksi baru di belakang layar, hasil laporan A tidak akan berubah dari detik pertama ia menekan Enter.
4. SERIALIZABLE (Paling Ketat): Jika Kasir A sedang membaca tabel, maka Kasir B tidka bole hmemasukkan data! Kasir B harus mengantre sampai Kasir A selesai. Sangat aman dari tabrakan, tapi membuat aplikasi menjadi sangat lambat (lag).