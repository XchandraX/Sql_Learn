-- Active: 1793677744104@@127.0.0.1@3306@SenjaRide
# Views
View adalah kueri `SELECT` yang disimpan di dalam database dan dberi nama. Ia bertindak layaknya sebuah tabel fisik, padahal isinya hanyalah "jendela virtua" untuk melihat data dari tabel asli.

Fungsi Utama Views:
1. Kemudahan (Simplicity): Menyembunyikan Mega Query yang sangat kompleks ke dalam satu nama tabel pendek.
2. Keamanan (Security): Kita bisa memberikan akses ke divisi HRD untuk melihat gaji, tapi menyembunyikannya dari divisi Marketing, cukup dengan membuat View khusus untuk Marketing (tanpa kolom gaji).
3. Real-time: View tidak menyimpan data. ia hanya menyimpan "rumus kuerinya". Jadi jika tabel aslinya di-update, data di View otomatis ikut ter-update detik itu juga.

## Sintaks Dasar Membuat View:

``CREATE VIEW laporan_karyawan_it AS
SELECT nama, gaji, divisi
FROM karyawan
WHERE divisi = 'IT';``

Setelah dieksekusi, kueri panjang itu akan tersimpan. Besok paginya, jika Manajer meminta laporannya, Kita cukup mengetik kueri super singkat ini:

`SELECT * FROM laporan_karyawan_it`

Jika Kita tidak menggunakan View, Kita harus membongkar ulang mega Query Kita dan membuat Derived Table yang memusingkan. Tapi karena Kita sudah punya View, Kita tinggal menambahkan klausa WHERE pada saat memanggilnya

## Modifying Views

Jika Kita menggunakan CREATE VIEW, sistem akan menolak kueri Kita dan memunculkan error: "Table 'laporan_kinerja_driver' already exists".

UNtuk mengatasinya tanpa harus menggunakan perintah `DROP VIEW` (manghapus view), para Data Engineer menggunakan mantra ajaib ini: `CREATE OR REPLACE VIEW`

Sesuai namanya( Buat atau Timpa), perintah ini sangat pintar:
1. Jika View belum ada, ia akan membuatnya.
2. Jika View sudah ada, ia akan menimpa/mengganti kueri lama dengan kueri baru yang Kita tulis

## Drop Views
DROP VIEW nama_view // cara biasa

DROP VIEW IF EXISTS nama_view // cara lebih aman pro-level

Menghapus sebuah View TIDAK AKAN menghapus data asli Anda. Jika Anda menjalankan DROP VIEW laporan_kinerja_driver;, data di tabel fisik driver_senjaride akan tetap aman tak tersentuh. Anda hanya menghancurkan "jendela" untuk melihatnya, bukan menghancurkan datanya. Inilah alasan mengapa View sangat aman digunakan untuk diutak-atik oleh analis data!