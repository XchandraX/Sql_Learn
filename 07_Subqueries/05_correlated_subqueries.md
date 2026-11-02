# Correlated Subquery
Kueri bersarang yang tidak bisa berdiri sendiri. Ia sangat bergantung pada data dari kueri luar (outer query) untuk bisa dieksekusi.

Jika Scalar Subquery biasa hanya dieksekusi satu kali oleh sistem, maka Correiated Subquery dieksekusi berulang-ulang untuk setiap baris data yang ada di tabel luar.

Inilah alasan mengapa ia dijuluki sebagai "Pelahap Memori" atau kueri yang paling berat bagi server

## Analogi: Sang Asisten dan Daftar Karyawan
Bayangkan Kita adalah Bos (Outer Query) dan Kita punya Asisten (Inner Query).

Skenario 1 (Subquery Biasa - Cepat):
Kita meminta: "Tolong carikan karyawan yang gajinya di atas rata-rata SELURUH perusahaan."
1. Asisten menghitung rata-rata seluruh perusahaan satu kali saja (misal ketemu Rp 5 Juta).
2. Kita mengecek daftar karyawan satu per satu dan membandingkan dengan angka 5 Juta tersebut. Selesai..

Skenario 2 (Correlated Subquery - Lambat):
Kita meminta: "Tolong carikan karyawan yang gajinya di atas rata-rata di DEPARTEMEN MEREKA MASING-MASING"
1. Kita menanggil karyawan pertama: Budi (Tim IT)
2. Kita menyuruh asisten: "Cepat hitung rata-rata gaji tim IT!"
3. Kita memanggil karyawan kedua: Siti (Tim Marketing)
4. Kita menyuruh asistem lagi: "Cepat hitung rata-rata gaji tim Marketing!"
5. Jika ada 1.000 karyawan, asisten Kita harus lari bolak-balik 1.000 kali untuk menghitung rata-rata masing-masing departemen!

Contoh Sintaks:
``SELECT
    karyawan_luar.nama ,
    karyawan_luar.departemen,
    karyawan_luar.gaji
FROM karyawan karyawan_luar
WHERE karyawan_luar.gaji > (
    SELECT AVG(karyawan_dalam.gaji)
    FROM karyawan karyawan_dalam
    WHERE karyawan_dalam.departemen = karyawan_luar.departemen
);``

Ciri Khas Correlated Subquery:
Lihat baris palnig bawah. Ada syarat `WHERE` di dalam Subquery yang memanggil nama tabel dari kueri luar (`karyawan_luar.departemen`). Kueri dalam ini mengemis data dari kueri luar. Jika kueri luarnya tidak jalan, kueri dalamnya akan error karena ia tidak tahu apa itu `karyawan_luar`.

Kapan Kita Menggunakannya?
Sebagai Data Engineer, Kita hanya menggunakan Correlated Subquery jika terpaksa (biasanya untuk kasus perbandingan spesifik per baris/kategori seperti contoh departemen di atas) dan jika jumlah datanya masih sedikit (di bawah puluhan ribu baris).

Jika datanya jutaan, kueri ini bisa membuat server database perusahaan Kita mati total(hang). Solusi modern untuk menggantikan Correlated Subquery yang berat in adalah menggunakan Window Function