# Perintah INSERT
mekanisme ekslusif dalam SQL untuk memigrasikan entitas data baru ke dalam ruang penyimpanan fisik sebuah table. Kinerja dan tingkat keberhasilan perintah ini sangat bergantung pada cara penyusunannya, terutama saat aplikasi harus menangani volume data yang masif dalam waktu singkat.

Dalam lingkungan produksi tingkat lanjut, pengembang jarang menggunakan perintah INSERT dasar satu per satu karena masalah latensi. Terdapat beberapa variasi arsitektural yang digunakan untuk mengoptimalkan operasi penyisipan data:

1. Multi-Row (Bullk) Insert
mengirimkan ribuan baris data melalui satu blok blok perintah INSERT tunggal jauh lebih efisien daripada menjalankan perintah INSERT berulang kali.

- Keuntungan: ini meminimalkan bolak-balik lalu lintas jaringan antara apliikasi dan server database, serta memungkinkan mesin RDBMS menulis seluruh data ke dalam blok disk fisik secara bersamaan, mengurangi latensi I/O secara drastis.

2. Penanganan Konflik Logika (UPSERT)
Sering kali terjadi anomali ras di mana aplikasi mencoba memasukkan data yang sudah ada (misalnya ID pengguna atau alamat email yang terdaftar), yang secara normal akan memicu error dan menggagalkan keseluruhan transaksi (constraint violation). RDBMS modern menyelesaikan ini dengan teknik UPSERT (Update or Insert).

- MySQL: Menggunakan klausa ON DUPLICATE KEY UPDATE. Jika data sudah ada, sistem akan mengubah operasinya menjadi UPDATE secar instan.

- PostgreSQL / SQLite: Menggunakan klausa ON CONFLICT DO UPDATE. Jika tidak ingin memperbarui data, bisa menggunakan ON CONFLICT DO NOTHING untuk melewati data yang duplikat dalam diam.

3. Subquery Insertion (INSERT INTO ... SELECT)
Alih-alih menarik jutaan baris ke memori aplikasi (seperti Python atau Node.js) hanya untuk memindahkannya ke tabel lain, SQL memungkinkan penyisipan data secara langsung antar tabel di level server.

- Sintaksis INSERT INTO Table_A SELECT * FROM Tabel_B memindahkan data menggunakan memori internal server RDBMS dengan kecepatan maksimal, sangat berguna untuk pemindahan data arsip, pelaporan, atau replikasi data harian.

4. Mengelola Nilai Absen (NULL dan Default)
Saat mendefinisikan klausa INSERT, Kita tidak diwajibkan untuk memetakan seluruh kolom di dalam tabel.

- Jika Kita melewati kolom yang menggunakan atribut AUTO_INCREMENT atau SERIAL. RDBMS akan menghasilkan angka urutan berikutnya secara matematis.

- Kolom dengan klausa DEFAULT (misalnya penanda waktu CURRENT_TIMESTAMP) akan diisi otomatis oleh mesin jika tidak disertakan dalam operasi penyisipan.