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