# Tipe data SQL 
merupakan fondasi arsitektural dari desain skema basis data relasional. Pemilihan tipe data bukan sekadar tentang menentukan jenis nilai apa yang dapat dimasukkan ke dalam sebuah kolom, melainkan pembentukan seubah konrak komputasi yang ketat antara basis data dan perangkat lunak.
Kontrak ini mendikte secara spesifik bagaimana alokasi memori fisik dilakukan di dalam disk, bagaimana data tersebut diuraikan, divalidasi, diindeks, serta bagaimana operasi matematika dan komparasi logika dieksekusi di tingkat prosesor.

## Klasifikasi Tipe Data Fundamental
Sistem RDBMS modern membagi tipe data ke dalam beberapa keluarga besar, masing-masing dengan karakteristik ukuran dan presisi yang berbeda:

- Tipe Data Numerik (Numeric Types)
    - Integer (Angka Bulat)                 : `TINYINT` (1 byte, merentang dari 0 hingga 255) hingga `BIGINT` (8 byte, menampung nilai miliaran). Sempurna untuk ID unik, kunci primer (primary keys), dan metrik hitungan (seperti jumlah klik atau jumlah stok).

    - Fixed-Point (Presisi Eksak)           : `DECIMAL` atau `NUMERIC`. Tipe data ini menyimpan angka pecahan persis seperti yang dideklarasikan (misalnya `DECIMAL(10,2)` untuk angka dengan dua desimal). Tipe ini mutlak digunakan untuk aplikasi keuangan, transaksi moneter, atau sistem akuntansi di mana hilangnya presisi akibat pembulatan (Meskipun hanya sekian sen) tidak dapat ditoleransi.

    - Floating-Point (Presisi Perkiraan)    : `FLOAT` dan `DOUBLE`. Digunakan untuk menampung angka sangat besar atau sangat kecil dengan desimal dinamis yang umumnya ditemui dalam kalkulasi ilmiah, koordinat spasial, atau komputasi metrik di mana kecepatan dan ukuran diutamakan di atas akurasi absolut hingga desimal terkecil.

- Tipe Data Karakter dan Teks (Character Types)
    - Teks dengan Panjang Tetap (`CHAR(n)`)                 : Mengalokasikan ruang memori yang statis terlepas dari panjang teks yang dimasukkan (kekurangannya akan diisi dengan spasi/padding). Sangat dioptimalkan secara performa untuk nilai dengan ukuran absolut yang tidak pernah berubah, seperti kode negara (ISO 3166 speerti 'ID', 'US'), kode mata uang ('IDR', 'USD'), atau nilai hash kriptografi g(seperti MD5 yang selalu 32 karakter).

    - Teks dengan Panjang Dinamis (`VARCHAR(n)`)            : Hanya memakan ruang memori sebesar data aktual ditambah 1-2 bytes ekstra untuk mencatat panjang string. Ini adalah tipe data standar untuk nama pengguna, alamat email, atau alamat rumah.

    - Objek Teks Besar (`TEXT`, `CLOB` atau `VARCAHR(MAX)`) : Didesain untuk menampung ratusan ribu hingga miliaran karakter. Digunakan untuk menyimpan isi aritkel blog, deskripsi produk, catatan medis panjang, atau tumpukan log sistem. Data ini sering kali disimpan terpisah dari tabel utama (secara fisik) untuk menjaga kecepatn pindah halaman (page scanning).

- Tipe Data Temporal (Data & Time)
    - `DATE` & `TIME`           : Secara eksplisit hanya menyimpan entitas kalender (YYYY-MM-DD) atau jam (HH:MM:SS) secara independen.

    - `DATETIME` & `TIMESTAMP`  : Menggabungkan keduanya. Perbedaan krusial sering terjadi di sini antar sistem operasi RDBMS; misalnya di MySQL. `TIMESTAMP` akan mengonversi wakt udar izona waktu lokal ke UTC saat disimpan, dan mengembalikannya ke zona waktu lokal saat diambil (timezone-aware), sementara `DATATIME` menyimpan angka statis tanpa kepedulian terhadap lokasi server atau pengguna.

- Tipe Data Biner (Binary & BLOB)
    - `BLOB` (Binary Large Object): Digunakan untuk menyuntikkan aliran data mentah (raw byte streams) secara langsung ke dalam ke dalam sel database. Tipe ini mampu menyimpan gambar, dokumen PDF, arsip audio, hingga sertifikat enkripsi. Meskipun memusatkan penyimpanan, meletakkan file fisik berukuran raksasa di dalam basis data relasional sering kali berdampak negatif pada kinerja operasional backup/restore.

- Tipe Data Spesifik Tingkat Lanjut (Modern Data Types)
    - Banyak RDBMS saat ini mendobrak batas relasional murni dengan menyediakan tipe data `JSON` atau `XML`. Kolom ini memungkinkan pengembang untum menyimpan objek semi-trestruktur lengkap dengan hierarkinya, bahkan dapat diindeks dan dikueri dengan fungsi pencarian spesifik (misalnya, mencari nilai spesifik di dalam objek JSON). Terdapat juga tipe Geospasial(`POINT`, `POLYGON`) yang mampu menghitung jarak nyata menggunakan garis bujur dan lintang langsung di dalam kueri SQL.

## Mengapa Presisi Pemilihan Tipe Data Sangat Krusial?
    Keputusan arsitektural saat menentukan tipe data akan berdampak langsung pada tipe pilar utama basis data.

1. Optimalisasi Kapasitas Penyimpanan (Storage Efficiency): 
Menggunakanan `BIGINT` (8 byte) untuk kolom "Umur Pengguna" yang sebenarnya cukup menampung nilai 0-255 menggunakan `TINYINT` (1 byte) berarti membuang memori sebesar 7 bytes per baris. Dalam sistem yang menampung 1 miliar pengguna, inefisiensi sepele ini memboroskan ruang diska dan RAM sebesar 7 Gigabytes, yang secar langsung meningkatkan biaya infrastruktur server.

2. Integritas Lapis Pertama (Data Integrity):
Tipe data bertindak sebagai penjaga gerbang. Sistem aka nsecara otomatis menolak menolak dan membatalkan transaksi (error constraint) jika sebuah aplikasi mencoba memasukkan teks "ABCD" ke dalam kolom bertipe `INTEGER`, atau memcoba memasukkan tanggal fiktif "2026-02-30" ke dalam kolom `DATE`. Ini melindungi sistem dari masuknya "sampah" logika (anomali data).

3. Kinerja Mesin dan Indeksasi (Query Performance)
Mesin basis data memproses angka sangat cepat. Operasi relasional (`JSON`) atau pencarian (`WHERE`) yang mengandalkan angka numerik akan selalu mengalahkan perbandingkan teks (string-matching). Selain itu, tipe data yang memakan byte kecil memungkinkan sistem memuat lebih banyak baris data (rows) ke dalam cache memori dlaam satu siklus baca, yang menghasilkan operasi kueri (I/O) yang jauh lebih ringan dan cepat. Mengindeks kolom `INT` jauh lebih murah secara memori dibandingkan mengindeks kolom `VARCHAR(255)`.